## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, 
                      warning = FALSE, 
                      message = FALSE,
                      cache = TRUE, 
                      cache.path = "cache/",
                      fig.path = "figures/")
library(tidyverse)
library(brolgar)
library(patchwork)
library(kableExtra)
library(MASS)
library(janitor)
library(DiagrammeR)
library(rsvg)
library(webshot)
library(mgcv)
library(modelr)
library(tsibble)


## ---- cache = TRUE, echo = FALSE----------------------------------------------
source(here::here("data-raw/NLSY79/NLSY79.R"))


## ----untidy-data, echo = FALSE------------------------------------------------

untidy_demo <- new_data_qnames %>%
  as_tibble() %>%
  # in 2018, the variable's name is Q3-4_2018, instead of HGC_2018
  rename(HGC_2018 = `Q3-4_2018`) %>%
  dplyr::select(CASEID_1979,
            starts_with("HRP") &
              ends_with(c("1979", "1980", "1981", "1982", "1983"))) %>%
  dplyr::select(1:7) %>%
  head()

kable(untidy_demo,
      caption = "The Untidy Form of the NLSY79 Raw Data") %>%
  kable_styling(latex_options = "striped")


## ----dob-tidy-----------------------------------------------------------------
## tidy the date of birth data
dob_tidy <- new_data_qnames %>%
  dplyr::select(CASEID_1979,
         starts_with("Q1-3_A~")) %>%
  mutate(dob_year = case_when(
                    # if the years recorded in both sets match, take 79 data
                    `Q1-3_A~Y_1979` == `Q1-3_A~Y_1981` ~ `Q1-3_A~Y_1979`,
                    # if the year in the 81 set is missing, take the 79 data
                    is.na(`Q1-3_A~Y_1981`) ~ `Q1-3_A~Y_1979`,
                    # if the sets don't match for dob year, take the 79 data
                    `Q1-3_A~Y_1979` != `Q1-3_A~Y_1981` ~ `Q1-3_A~Y_1979`),
        dob_month = case_when(
                    # if months recorded in both sets match, take 79 data
                    `Q1-3_A~M_1979` == `Q1-3_A~M_1981` ~ `Q1-3_A~M_1979`,
                    # if month in 81 set is missing, take the 79 data
                    is.na(`Q1-3_A~M_1981`) ~ `Q1-3_A~M_1979`,
                    # if sets don't match for dob month, take the 79 data
                    `Q1-3_A~M_1979` != `Q1-3_A~M_1981` ~ `Q1-3_A~M_1979`),
        # flag if there is a conflict between dob recorded in 79 and 81
        dob_conflict = case_when(     
                      (`Q1-3_A~M_1979` != `Q1-3_A~M_1981`) & !is.na(`Q1-3_A~M_1981`)
                      ~ TRUE,
                      (`Q1-3_A~Y_1979` != `Q1-3_A~Y_1981`) & !is.na(`Q1-3_A~Y_1981`)
                      ~ TRUE,
                      (`Q1-3_A~Y_1979` == `Q1-3_A~Y_1981`) & 
                      (`Q1-3_A~M_1979` == `Q1-3_A~M_1981`) ~ FALSE,
                      is.na(`Q1-3_A~M_1981`) | is.na(`Q1-3_A~Y_1981`) ~ FALSE)) %>%
  dplyr::select(CASEID_1979,
         dob_month,
         dob_year,
         dob_conflict)


## ----demog-tidy---------------------------------------------------------------
## tidy the gender and race variables
demog_tidy <- categories_qnames %>%
  dplyr::select(CASEID_1979,
         SAMPLE_RACE_78SCRN,
         SAMPLE_SEX_1979) %>%
  rename(gender = SAMPLE_SEX_1979,
         race = SAMPLE_RACE_78SCRN)


## ----tidy-grade, echo = FALSE-------------------------------------------------
# tidy the grade 
demog_education <- new_data_qnames %>%
  as_tibble() %>%
  # in 2018, the variable's name is Q3-4_2018, instead of HGC_2018
  rename(HGC_2018 = `Q3-4_2018`) %>%
  dplyr::select(CASEID_1979,
         starts_with("HGCREV"),
         "HGC_2012",
         "HGC_2014",
         "HGC_2016",
         "HGC_2018") %>%
  pivot_longer(!CASEID_1979,
               names_to = "var",
               values_to = "grade") %>%
  separate("var", c("var", "year"), sep = -4) %>%
  filter(!is.na(grade)) %>%
  dplyr::select(-var)


## ----tidy-hgc, echo = FALSE---------------------------------------------------

## getting the highest year of completed education ever
highest_year <- demog_education %>%
  group_by(CASEID_1979) %>%
  mutate(hgc_i = max(grade)) %>%
  filter(hgc_i == grade) %>%
  filter(year == first(year)) %>%
  rename(yr_hgc = year) %>%
  dplyr::select(CASEID_1979, yr_hgc, hgc_i) %>%
  ungroup() %>%
  mutate('hgc' = ifelse(hgc_i == 0, "NONE", ifelse(hgc_i == 1, "1ST GRADE",
                 ifelse(hgc_i == 2, "2ND GRADE", ifelse(hgc_i == 3, "3RD GRADE",
                 ifelse(hgc_i >= 4 & hgc_i <= 12, paste0(hgc_i,"TH GRADE"),
                 ifelse(hgc_i == 13, "1ST YEAR COL",
                 ifelse(hgc_i == 14, "2ND YEAR COL",
                 ifelse(hgc_i == 15, "3RD YEAR COL",
                 ifelse(hgc_i == 95, "UNGRADED", 
                        paste0((hgc_i - 12), "TH YEAR COL")))))))))))


## ----full-demog, echo = FALSE-------------------------------------------------
full_demographics <- full_join(dob_tidy, demog_tidy, by = "CASEID_1979") %>%
  full_join(highest_year, by = "CASEID_1979") %>%
  rename("id" = "CASEID_1979")

head(full_demographics)


## ----tidy-hours---------------------------------------------------------------
# make a list for years where we used the "QES-52A"
year_A <- c(1979:1987, 1993)
#function to get the hour of work
get_hour <- function(year){
  if(year %in% year_A){
   temp <- new_data_qnames %>%
    dplyr::select(CASEID_1979,
            starts_with("QES-52A") &
              ends_with(as.character(year)))} 
  else{
    temp <- new_data_qnames %>%
    dplyr::select(CASEID_1979,
            starts_with("QES-52D") &
              ends_with(as.character(year)))} 
    temp %>% 
      pivot_longer(!CASEID_1979,
                 names_to = "job",
                 values_to = "hours_work") %>%
      separate("job", c("job", "year"), sep = -4) %>%
      mutate(job = paste0("job_", substr(job, 9, 10))) %>%
      rename(id = CASEID_1979)
}

# list to save the iteration result
hours <- list()
# getting the hours of work of all observations
for(ayear in c(1979:1994, 1996, 1998, 2000, 2002, 2004, 2006, 2008, 2010, 
               2012, 2014, 2016, 2018)) {
   hours[[ayear]] <- get_hour(ayear)
}
# unlist the hours of work
hours_all <- bind_rows(!!!hours)


## ----tidy-rate, echo = FALSE--------------------------------------------------
get_rate <- function(year) {
  new_data_qnames %>%
    dplyr::select(CASEID_1979,
            starts_with("HRP") &
              ends_with(as.character(year))) %>%
    pivot_longer(!CASEID_1979, names_to = "job", values_to = "rate_per_hour") %>%
    separate("job", c("job", "year"), sep = -4) %>%
    mutate(job = paste0("job_0", substr(job, 4, 4))) %>%
    rename(id = CASEID_1979)
}
rates <- list()
for(ayear in c(1979:1994, 1996, 1998, 2000, 2002, 2004, 2006, 2008, 2010, 
               2012, 2014, 2016, 2018)) {
   rates[[ayear]] <- get_rate(ayear)
}
rates_all <- bind_rows(!!!rates)
# join hours and rates variable
hours_wages <- left_join(rates_all, 
                         hours_all, 
                         by = c("id", "year", "job")) %>%
  # set the 0 value in rate_per_hour as NA 
  mutate(rate_per_hour = ifelse(rate_per_hour == 0, NA,
                                rate_per_hour))
head(hours_wages)


## ----tidy-nojob, echo = FALSE-------------------------------------------------
# calculate number of jobs that a person has in one year
no_job <- hours_wages %>%
  filter(!is.na(rate_per_hour)) %>%
  group_by(id, year) %>%
  summarise(no_jobs = length(rate_per_hour))

# filter the observations with available rate per hour
eligible_wages <- hours_wages %>%
  filter(!is.na(rate_per_hour)) %>%
  left_join(no_job, by = c("id", "year")) 

# calculate the mean_hourly_wage
# flag1 = code 1 for weighted mean
# code 0 for arithmetic mean
mean_hourly_wage <- 
  eligible_wages %>%
  group_by(id, year) %>%
  #calculate the weighted mean if the number of jobs > 1
  mutate(wages = ifelse(no_jobs == 1, rate_per_hour/100,
                        weighted.mean(rate_per_hour, hours_work, na.rm = TRUE)/100)) %>%
  #give the flag if it the weighted mean
  mutate(flag1 = ifelse(!is.na(wages) & no_jobs != 1, 1,
                        0)) %>%
  #calculate the arithmetic mean for the na
  mutate(wages = ifelse(is.na(wages), mean(rate_per_hour)/100,
                        wages)) %>%
  group_by(id, year) %>%
  summarise(wages = mean(wages),
            total_hours = sum(hours_work),
            number_of_jobs = mean(no_jobs),
            flag1 = mean(flag1)) %>%
  mutate(year = as.numeric(year)) %>%
  ungroup() %>%
  rename(mean_hourly_wage = wages) %>%
  mutate(is_wm = ifelse(flag1 == 1, TRUE,
                        FALSE)) %>%
  dplyr::select(-flag1)

head(mean_hourly_wage, n = 10)


## ----wages-demog-hs, echo = FALSE---------------------------------------------
# join the wages information and the demographic information by case id.
wages_demog <- left_join(mean_hourly_wage, full_demographics, by="id")
# calculate the years in work force and the age of the subjects in 1979
wages_demog <- wages_demog %>%
  mutate(yr_hgc = as.numeric(yr_hgc)) %>%
  mutate(years_in_workforce = year - yr_hgc) %>%
  mutate(age_1979 = 1979 - (dob_year + 1900))
# filter only the id with high school education
wages_demog_hs <- wages_demog  %>% filter(grepl("GRADE", hgc))
# calculate the number of observation
keep_me <- wages_demog_hs %>%
  count(id) %>%
  filter(n > 4)
wages_demog_hs <- wages_demog_hs %>%
  filter(id %in% keep_me$id)


## ----age-table, echo = FALSE--------------------------------------------------
age_table <- yowie::demographic_nlsy79 %>%
  group_by(age_1979) %>%
  count(age_1979) 

kable(age_table,
      caption = "Age Distribution of the NLSY79 samples",
      col.names = c("Age", "Number of Sample")) %>%
  kable_styling(latex_options = "striped")


## ----gender-race-table, echo = FALSE------------------------------------------
gender_race_table <- yowie::demographic_nlsy79 %>%
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



## ----featureplot, echo = FALSE, fig.cap = "Two plots showing the distribution of the mean hourly wage. Plot A portrays the pattern of mean hourly wage of high school cohort from 1979 to 2018 of each ID in US Dollar; Plot B shows the distribution of their minimum, median, and maximum value. We can see that some IDs had an extremely high of wages and it made the distribution of the three features is extremely skewed.", fig.width=6, fig.height=4----

spag <- wages_demog_hs %>%
  ggplot(aes(x = year,
             y = mean_hourly_wage,
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("A)") +
  theme(plot.title = element_text(size = 10))


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
  theme(plot.title = element_text(size = 10)) 
 
spag + feature


## ----summarytable, echo = FALSE-----------------------------------------------
kable(as.array(summary(wages_demog_hs$mean_hourly_wage)), 
      caption = "Summary Statistics of Wages of High School Data",
      col.names = c("Statistics", "Value")) %>%
  kable_styling(latex_options = "striped")


## ----high-wages, echo = FALSE, fig.cap= "Some observations with extremely high mean hourly wage. Most of the IDs only have one point of high wage.", fig.height=8, fig.width=6----

wages_high <- filter(wages_demog_hs, mean_hourly_wage > 500) %>%
  as_tibble() 

wages_high2 <- wages_demog_hs %>%
  filter(id %in% wages_high$id)

ggplot(wages_high2) +
  geom_line(aes(x = year,
                y = mean_hourly_wage)) +
  geom_point(aes(x = year,
                y = mean_hourly_wage),
             size = 0.5,
             alpha = 0.5) +
  facet_wrap(~id, scales = "free_y", ncol = 5) +
  theme(axis.text.x = element_text(angle = 10, size = 6)) +
  ylab("mean hourly wage") 
  


## ----sampleplot, echo = FALSE, fig.cap="The mean hourly wages of some random samples are shown in twelve facets, three IDs per facet. It suggests that some IDs had a reasonably fluctuate wages.", fig.height=4, fig.width=5----

set.seed(20210225)

ggplot(wages_demog_hs_tsibble, 
       aes(x = year,
                y = mean_hourly_wage,
                group = id)) +
  geom_line(alpha = 0.7) +
  facet_sample() +
  theme(axis.text.x = element_text(angle = 10, size = 6)) +
  ylab("mean hourly wage") 


## ----rlm, cache=TRUE, warning = FALSE, message = FALSE------------------------
 
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

# if the weight < 1, the mean_hourly_wage is replaced by the model's fitted/predicted value.
# and add the flag whether the observation is predicted value or not.
# since the fitted value is sometimes <0, and wages value could never be negative,
# we keep the mean hourly wage value even its weight < 1.

wages_rlm_dat <- id_aug_w %>%
  mutate(wages_rlm = ifelse(w < 0.12  & .fitted >= 0, .fitted,
                            mean_hourly_wage)) %>%
  mutate(is_pred = ifelse(w < 0.12 & .fitted >= 0, TRUE,
                          FALSE)) %>%
  dplyr::select(id, year, wages_rlm, is_pred)

# join back the `wages_rlm_dat` to `wages_demog_hs`

wages_demog_hs <- left_join(wages_demog_hs, wages_rlm_dat, by = c("id", "year"))



## ----comppict, echo = FALSE, fig.cap = "The distribution of the mean hourly wage after treating the extreme values. Plot A portrays the pattern of mean hourly wage of high school cohort from 1979 to 2018 of each ID in US Dollar; Plot B shows the distribution of their minimum, median, and maximum value transformed to log10 scale. We can see that some observations still had reasonbaly higher wages than the others. Also, some IDs' have a minimum wages that is higher than others' maximum wages.", fig.width=6, fig.height=4----

spag2 <- wages_demog_hs %>%
  ggplot(aes(x = year,
             y = wages_rlm,
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("A)") +
  theme(plot.title = element_text(size = 10))

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
  xlab("value (log10)")
 
spag2 + feature2


## ----compare-data, echo = FALSE-----------------------------------------------
set.seed(31251587)

sample_id <- sample(unique(wages_demog_hs$id), 20)
sample <- subset(wages_demog_hs, id %in% sample_id)

wages_compare <- sample %>%
  dplyr::select(id, year, mean_hourly_wage, wages_rlm) %>%
  rename(mean_hourly_wage_rlm = wages_rlm) %>%
  pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")


## ----compare, echo = FALSE, fig.cap="Comparison between the original and the treated mean hourly wage. The orange line portray the original value of mean hourly wage, while the turquoise line display the mean hourly wages value after the extreme values imputed with the robust linear model's prediction value. We can see that some extreme spikes has been reduced by the model.", fig.height=5, fig.width=6----
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
  facet_wrap(~id, scales = "free_y")




## -----------------------------------------------------------------------------
# select out the old value of mean hourly wage and change it with the wages_rlm value
wages_demog_hs <- wages_demog_hs %>%
  dplyr::select(-mean_hourly_wage) %>%
  rename(mean_hourly_wage = wages_rlm)

# rename and select the wages in tidy
wages_hs2020 <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc,
                number_of_jobs, total_hours, is_wm, is_pred) %>%
  mutate(hgc = as.factor(hgc),
         year = as.integer(year),
         age_1979 = as.integer(age_1979),
         yr_hgc = as.integer(yr_hgc),
         number_of_jobs = as.integer(number_of_jobs))

# Create a data set for demographic variables
demographic_nlsy79 <- full_demographics %>%
  mutate(age_1979 = 1979 - (dob_year + 1900)) %>%
  dplyr::select(id,
         age_1979,
         gender,
         race,
         hgc,
         hgc_i,
         yr_hgc) %>%
  mutate(age_1979 = as.integer(age_1979),
         hgc = as.factor(hgc),
         yr_hgc = as.integer(yr_hgc))

# Create a data set for the high school dropouts cohort
wages_hs_dropout <- wages_hs2020 %>%
  mutate(dob = 1979 - age_1979,
         age_hgc = yr_hgc - dob) %>%
  filter((hgc %in% c("9TH GRADE",
                     "10TH GRADE",
                     "11TH GRADE")) |
          (hgc == "12TH GRADE" &
              age_hgc > 19)) %>%
  filter(age_1979 <= 17,
         gender == "MALE") %>%
  dplyr::select(-dob,
         -age_hgc)



## ----nrow, echo=FALSE---------------------------------------------------------
a = nrow(categories_qnames)
b = nrow(full_demographics)
d = eligible_wages %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_hgc = wages_hs2020 %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_obs_hgc = nrow(wages_hs2020)
n_obs_hgc_pred = filter(wages_hs2020, is_pred == TRUE) %>%
  nrow()

n_do = wages_hs_dropout %>%
  group_by(id) %>%
  count(id) %>%
  nrow()
n_obs_do = nrow(wages_hs_dropout)
n_obs_do_pred = filter(wages_hs_dropout, is_pred == TRUE) %>%
  nrow()


## ----flowchart, echo=FALSE, fig.cap="The stages of data filtering from the raw data to get three datasets that are contained in an R package called yowie, n means the number of ID, while n_obs means the number of observations.", fig.height=3, fig.width=3----

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


## ----wages-tsibble, echo = FALSE----------------------------------------------
# create the wages data as tsibble
wages_hs2020_tsibble <- wages_hs2020 %>%
  as_tsibble(key = id,
             index = year,
             regular = FALSE)


## ----wages-slope, echo = FALSE, fig.cap="Regression slope of mean hourly wage regression by highest grade completed. The regression model has mean hourly wage as response variable and year as predictor. Respondents who completed 12th grade has the highest median of slope."----


wages_slope <- key_slope(wages_hs2020_tsibble, 
            mean_hourly_wage ~ year) %>%
  left_join(demographic_nlsy79, by = "id") %>%
  mutate(hgc = factor(hgc, levels = c("1ST GRADE", "2ND GRADE", "3RD GRADE", 
                                      "4TH GRADE", "5TH GRADE", "6TH GRADE", 
                                      "7TH GRADE", "8TH GRADE", "9TH GRADE",
                                      "10TH GRADE", "11TH GRADE", "12TH GRADE", 
                                      "UNGRADED"))) %>%
  filter(hgc != "UNGRADED")

ggplot(wages_slope, aes(y = hgc,
                      x = .slope_year)) +
  geom_boxplot()


## ----gender-plot, echo = FALSE, warning = FALSE, fig.cap= "The pattern of mean hourly wages overtime displayed in 12 facets coloured by gender. The respondents belong to high school cohort are randomly sampled. We learn that both male and female respondents had a fluctuate mean hourly wage over the year."----
# sample the data by gender

set.seed(31251587)
wages_hs2020_male <- wages_hs2020_tsibble %>%
  filter(gender == "MALE") %>%
  sample_n_keys(size = 120)

set.seed(31251587)
wages_hs2020_female <- wages_hs2020_tsibble %>%
  filter(gender == "FEMALE") %>%
  sample_n_keys(size = 120)

wages_hs2020_sample_gender <- bind_rows(wages_hs2020_male, wages_hs2020_female)


ggplot(wages_hs2020_sample_gender, 
       aes(x = year,
           y = mean_hourly_wage,
           group = id,
           color = gender)) + 
  geom_line(alpha = 0.7) +
  scale_color_brewer(palette = "Dark2") +
  facet_strata(along = ~gender) 


## ----gender-se, echo=FALSE, fig.cap="The yearly mean of mean hourly wage by gender along with its standard error. Males generally earn more wages than females. The error interval tend to be wider over the years."----
wages_hs2020_grouped_gender <- wages_hs2020 %>%
  group_by(gender, year) %>%
  summarise(mean = mean(mean_hourly_wage),
             sd = sd(mean_hourly_wage),
             samplesize = n()) %>%
  ungroup() %>%
  mutate(upper = mean + sd/sqrt(samplesize),
         lower = mean - sd/sqrt(samplesize)) 

gender_plot <- ggplot(wages_hs2020_grouped_gender,
                      aes(x = year,
                          y = mean,
                          group = gender,
                          colour = gender)) +
  geom_point(size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=1,
                 position=position_dodge(0.1)) +
  theme(legend.position = "bottom",
         legend.text = element_text(size = 5),
         axis.title = element_text(size = 9)) +
  scale_color_brewer(palette = "Dark2") +
  ylab("median of mean hourly wage (US$)")

gender_plot



## ----gam-plot, cache=TRUE, echo=FALSE, fig.cap="Exploration of wages data by fitting a GAM. The fitted model displayed by blue line. The fitted line shows that the model flexible enough to follow the pattern of the data."----

# take a small fraction of key
set.seed(2020)
wages_sample_gam <- sample_frac_keys(wages_hs2020_tsibble, size = 0.01) %>%
  mutate(id_fct = as.factor(id),
         year0 = year - 1979)

# build GAM model
wages_gam <- gam(
  mean_hourly_wage ~ s(year0, by = id_fct) + id_fct,
  data = wages_sample_gam,
  method = "REML"
)

wages_aug_gam <- wages_sample_gam %>%
  add_predictions(wages_gam, var = "pred") %>%
  add_residuals(wages_gam, var = "res") %>%
  group_by_key() %>%
  mutate(rss = sum(res^2)) %>%
  ungroup()

set.seed(2021)
wages_aug_gam %>%
  sample_n_keys(12) %>%
  ggplot(aes(x = year,
             y = pred,
             group = id)) +
  geom_line(color = "steelblue") +
  geom_point(aes(y = mean_hourly_wage)) +
  facet_wrap(~id)


