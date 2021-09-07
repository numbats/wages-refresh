## ---- age-table
age_table <- yowie::demog_nlsy79 %>%
group_by(age_1979) %>%
  count(age_1979)

kable(age_table,
      caption = "Age Distribution of the NLSY79 samples",
      col.names = c("Age", "Number of Sample")) %>%
  kable_styling(latex_options = "striped")

## ---- gender-race-table
gender_race_table <- yowie::demog_nlsy79 %>%
  tabyl(gender, race) %>%
  adorn_totals(c("row", "col")) %>%
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns(position = "front") %>%
  mutate(gender = ifelse(gender == "MALE", "Male",
                         ifelse(gender == "FEMALE", "Female", "Total")))

kable(gender_race_table,
      caption = "Gender and Race Distribution of the NLSY79 Samples",
      col.names = c("Gender", "Hispanic", "Black", "Non-Black, Non-Hispanic", "Total")) %>%
  kable_styling(latex_options = "striped") %>%
  add_header_above(c(" " = 1, "Race" = 3, " " = 1))

## ---- summarytable
kable(as.array(summary(wages_demog_hs$mean_hourly_wage)),
      caption = "Summary Statistics of Wages of High School Data",
      col.names = c("Statistics", "Value")) %>%
  kable_styling(latex_options = "striped")

## ---- feature-plot
spag <- wages_demog_hs %>%
  ggplot(aes(x = year,
             y = mean_hourly_wage,
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("A)") +
  theme(plot.title = element_text(size = 10)) +
  theme_bw()

wages_demog_hs_tsibble <- as_tsibble(x = wages_demog_hs,
                                     key = id,
                                     index = year,
                                     regular = FALSE)
wages_three_feat <- wages_demog_hs_tsibble %>%
  features(mean_hourly_wage,
           feat_three_num
  )
wages_feat_long <- wages_three_feat %>%
  pivot_longer(c(min, med, max), names_to = "feature", values_to = "value")
feature <- ggplot(wages_feat_long) +
  geom_density(aes(x = value, colour = feature, fill = feature), alpha = 0.3) +
  ggtitle("B)") +
  theme(plot.title = element_text(size = 10))+
  theme_bw()

spag + feature

## ---- high-wages
wages_high <- filter(wages_demog_hs, mean_hourly_wage > 500) %>%
  as_tibble() %>%
  head(n = 6)

wages_high2 <- wages_demog_hs %>%
  filter(id %in% wages_high$id)

ggplot(wages_high2) +
  geom_line(aes(x = year,
                y = mean_hourly_wage)) +
  geom_point(aes(x = year,
                 y = mean_hourly_wage),
             size = 0.5,
             alpha = 0.5) +
  facet_wrap(~id, scales = "free_y") +
  theme(axis.text.x = element_text(angle = 10, size = 6)) +
  ylab("mean hourly wage") +
  theme_bw()

## ---- sample-plot
set.seed(20210225)
ggplot(wages_demog_hs_tsibble,
       aes(x = year,
           y = mean_hourly_wage,
           group = id)) +
  geom_line(alpha = 0.7) +
  facet_sample() +
  theme(axis.text.x = element_text(angle = 10, size = 6)) +
  ylab("mean hourly wage") +
  theme_bw()

## ---- rlm
# nest the data by id to build a robust linear model
by_id <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage) %>%
  group_by(id) %>%
  nest()

# build a robust linear model
id_rlm <- by_id %>%
  mutate(model = map(.x = data,
                     .f = function(x){
                       rlm(mean_hourly_wage ~ year, data = x)
                     }))
# extract the property of the regression model
id_aug <- id_rlm %>%
  mutate(augmented = map(model, broom::augment)) %>%
  unnest(augmented)

# extract the weight of each observation
id_w <- id_rlm %>%
  mutate(w = map(.x = model,
                 .f = function(x){
                   x$w
                 })) %>%
  unnest(w) %>%
  dplyr::select(w)

# bind the property of each observation with their weight
id_aug_w <- cbind(id_aug, id_w) %>%
  dplyr::select(`id...1`,
                year,
                mean_hourly_wage,
                .fitted,
                .resid,
                .hat,
                .sigma,
                w) %>%
  rename(id = `id...1`)

# if the weight < 0.12, the mean_hourly_wage is replaced by the model's fitted/predicted value.
# and add the flag whether the observation is predicted value or not.
# since the fitted value is sometimes <0, and wages value could never be negative,
# we keep the mean hourly wage value even its weight < 0.12.

wages_rlm_dat <- id_aug_w %>%
  mutate(wages_rlm = ifelse(w < 0.12  & .fitted >= 0, .fitted,
                            mean_hourly_wage)) %>%
  mutate(is_pred = ifelse(w < 0.12 & .fitted >= 0, TRUE,
                          FALSE)) %>%
  dplyr::select(id, year, wages_rlm, is_pred)

# join back the `wages_rlm_dat` to `wages_demog_hs`

wages_demog_hs <- left_join(wages_demog_hs, wages_rlm_dat, by = c("id", "year"))

# save it to rds file so it would faster the knitting process
# saveRDS(wages_demog_hs, here::here("Report/Result/wages_demog_hs_tmp.rds"))

## ---- compare-data
set.seed(31251587)

wages_demog_hs <- readRDS(here::here("paper/results/wages_demog_hs_tmp.rds"))
sample_id <- sample(unique(wages_demog_hs$id), 20)
sample <- subset(wages_demog_hs, id %in% sample_id)

wages_compare <- sample %>%
  dplyr::select(id, year, mean_hourly_wage, wages_rlm) %>%
  rename(mean_hourly_wage_rlm = wages_rlm) %>%
  pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")

## ---- compare-plot
ggplot(wages_compare) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  geom_point(aes(x = year,
                 y = wages,
                 colour = type),
             alpha = 0.5,
             size = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y") +
  theme_bw()

## ---- comppict
spag2 <- wages_demog_hs %>%
  ggplot(aes(x = year,
             y = wages_rlm,
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("A)") +
  theme(plot.title = element_text(size = 10)) +
  theme_bw()

wages_hs2020_rlm <- as_tsibble(x = wages_demog_hs,
                               key = id,
                               index = year,
                               regular = FALSE)
wages_three_feat_rlm <- wages_hs2020_rlm %>%
  features(wages_rlm,
           feat_three_num
  )
wages_feat_long_rlm <- wages_three_feat_rlm %>%
  pivot_longer(c(min, med, max), names_to = "feature", values_to = "value")

feature2 <- ggplot(wages_feat_long_rlm) +
  geom_density(aes(x = value, colour = feature, fill = feature), alpha = 0.3) +
  ggtitle("B)") +
  scale_x_log10() +
  theme(plot.title = element_text(size = 10)) +
  xlab("value (log10)") +
  theme_bw()

spag2 + feature2


## ---- save-data
# select out the old value of mean hourly wage and change it with the wages_rlm value
wages_demog_hs <- wages_demog_hs %>%
  dplyr::select(-mean_hourly_wage) %>%
  rename(mean_hourly_wage = wages_rlm)

# rename and select the wages in tidy
wages <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc,
                number_of_jobs, total_hours, is_wm, is_pred) %>%
  mutate(id = as.factor(id),
         hgc = as.factor(hgc),
         year = as.integer(year),
         age_1979 = as.integer(age_1979),
         yr_hgc = as.integer(yr_hgc),
         number_of_jobs = as.integer(number_of_jobs)) %>%
  rename(wage = mean_hourly_wage,
         njobs = number_of_jobs,
         hours = total_hours) %>%
  as_tsibble(key = id,
             index = year,
             regular = FALSE)

# Create a data set for demographic variables
demog_nlsy79 <- full_demographics %>%
  mutate(age_1979 = 1979 - (dob_year + 1900)) %>%
  dplyr::select(id,
                age_1979,
                gender,
                race,
                hgc,
                hgc_i,
                yr_hgc) %>%
  mutate(id = as.factor(id),
         age_1979 = as.integer(age_1979),
         hgc = as.factor(hgc),
         yr_hgc = as.integer(yr_hgc))

# Create a data set for the high school dropouts cohort
wages_hs_do <- wages %>%
  mutate(dob = 1979 - age_1979,
         age_hgc = yr_hgc - dob) %>%
  filter((hgc %in% c("9TH GRADE",
                     "10TH GRADE",
                     "11TH GRADE")) |
           (hgc == "12TH GRADE" &
              age_hgc >= 19)) %>%
  filter(age_1979 <= 17,
         gender == "MALE") %>%
  dplyr::select(-dob,
                -age_hgc) %>%
  as_tsibble(key = id,
             index = year,
             regular = FALSE)

### ---- nrow
a = nrow(categories_qnames)
b = nrow(full_demographics)
d = eligible_wages %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_hgc = wages %>%
  as_tibble() %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_obs_hgc = nrow(wages)
n_obs_hgc_pred = filter(wages, is_pred == TRUE) %>%
  nrow()

n_do = wages_hs_do %>%
  as_tibble() %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_obs_do = nrow(wages_hs_do)
n_obs_do_pred = filter(wages_hs_do, is_pred == TRUE) %>%
  nrow()

### ---- flow-chart
fc <- grViz("digraph flowchart {
      node [fontname = Helvetica, shape = rectangle]
      tab1 [label = '@@1']
      tab2 [label = '@@2']
      tab3 [label = '@@3']
      tab4 [label = '@@4']
      tab5 [label = '@@5']
      tab6 [label = '@@6']
      tab7 [label = '@@7']

      tab1 -> tab2;
      tab1 -> tab3;
      tab1 -> tab4 -> tab5 -> tab6;
      tab5 -> tab7;
      tab6 -> tab7;
      tab2 -> tab7
      }

      [1]: paste0('NLSY79, n = ', a)
      [2]: paste0('Extract demographic variable, n = ', b)
      [3]: paste0('Exclude ', a - d, ' IDs whose hourly rate is missing')
      [4]: paste0('Eligible ID, n = ', d)
      [5]: paste0('Cohort whose hgc is up to 12th grade and \\n participated at least 5 years in the survey, \\n n = ', n_hgc, ', n_obs = ', n_obs_hgc, ' \\n (', n_obs_hgc_pred, ' observations are predicted value)')
      [6]: paste0('High school dropouts cohort, \\n n = ', n_do, ', n_obs = ', n_obs_do, ' \\n (', n_obs_do_pred, ' observations are predicted value)')
      [7]: 'yowie Package'
      ",
            height = 200)
fc
