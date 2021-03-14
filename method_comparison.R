library(tidyverse)
library(zoo)
library(rstatix)
library(robustlmm)
library(modelr)
library(patchwork)
library(MASS)
library(broom)




# open the tidy raw data set
wages <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment_weighted.csv")
demog <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_demographics_v2.csv")

# join the wages information and the demographic information by case id.
wages_demog <- left_join(wages, demog, by="id")


# calculate the years in work force and the age of the subjects in 1979
wages_demog <- wages_demog %>%
  mutate(yr_hgc = as.numeric(yr_hgc)) %>%
  mutate(years_in_workforce = year - yr_hgc) %>%
  mutate(age_1979 = 1979 - (dob_year + 1900))

# filter only the id with high school education
wages_demog_hs <- wages_demog  %>% filter(grepl("GRADE", hgc))

ggplot(wages_demog_hs, aes(x = mean_hourly_wage)) +
  geom_boxplot()


# get the number of observations
n_obs <- wages_demog_hs %>% count(id)

# sample some IDs

set.seed(20210218)

sample_id <- sample(unique(n_obs$id), 100)
sample <- subset(wages_demog_hs, id %in% sample_id)

# check the extreme value

sample_ext <- sample %>%
  group_by(id) %>%
  identify_outliers("mean_hourly_wage") %>%
  dplyr::select(year, id, is.outlier, is.extreme)

# check the influential value using robust linear mixed model

rfm <- rlmer(mean_hourly_wage ~ (1|year) + (1|id), sample)
summary(rfm)

weight_obs <- as.vector(getME(rfm, "w_e"))


# join the weight with the data
sample_weight <- cbind(sample, weight_obs)


# join the extreme value with the data
wages_hs_sample <- left_join(sample_weight, sample_ext, by = c("id", "year"))

# flag the extreme value and outlier flag based on IQR methos
wages_hs_sample <- wages_hs_sample %>%
  mutate(is.outlier = ifelse(is.na(is.outlier), FALSE, is.outlier),
         is.extreme = ifelse(is.na(is.extreme), FALSE, is.extreme))

# add the prediction and residual of robust lmm model
wages_hs_sample <- wages_hs_sample %>%
  add_predictions(rfm, var = "pred") %>%
  add_residuals(rfm, var = "res")

# create a clean wages data based on robust lmm model
wages_hs_sample <- wages_hs_sample %>%
  mutate(wages_cleaned_rlmm = ifelse(weight_obs != 1, pred,
                                     mean_hourly_wage),
         is_pred = ifelse(weight_obs != 1, TRUE, FALSE),
         wages_cleaned_rlmm = ifelse(wages_cleaned_rlmm < 0, mean_hourly_wage, wages_cleaned_rlmm))

summary(wages_hs_sample$wages_cleaned_rlmm)

p1 <- ggplot(wages_hs_sample) +
  geom_line(aes(x = year,
                y = wages_cleaned_rlmm,
                group = id), alpha = 0.3)


# create a clean wages data based on IQR method


# make the extreme values as NA and give the flag to that observation
# since we're gonna do locf
wages_hs_sample <- wages_hs_sample %>%
  mutate(wages_clean_ext = ifelse(is.extreme == TRUE, NA, mean_hourly_wage),
         is_locf = ifelse(is.na(wages_clean_ext), TRUE, FALSE))


# doing locf
for_locf <- wages_hs_sample %>%
  dplyr::select(id, year, wages_clean_ext) %>%
  group_by(id) %>%
  na.locf()


# join back the locf value to wages_demog_hs
wages_hs_sample <- left_join(wages_hs_sample, for_locf, by = c("id", "year")) %>%
  dplyr::select(-wages_clean_ext.x) %>%
  rename(wages_clean_ext = wages_clean_ext.y)


p2 <- ggplot(wages_hs_sample) +
  geom_line(aes(x = year,
                y = wages_clean_ext,
                group = id), alpha = 0.3)

p3 <- ggplot(wages_hs_sample) +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id), alpha = 0.3)

p1 + p2 + p3


wages_sample_long <- wages_hs_sample %>%
  dplyr::select(id, year, mean_hourly_wage, wages_cleaned_rlmm, wages_clean_ext) %>%
  pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")

n_obs_sample <- wages_sample_long %>% count(id) %>%
  filter(n > 30)

set.seed(31251587)

sample_plot <- sample(unique(n_obs_sample$id), 20)
sample_plot <- subset(wages_sample_long, id %in% sample_plot)

ggplot(sample_plot) +
  geom_line(aes(x = year,
                y = wages,
                colour = type)) +
  facet_wrap(~id)


##### ROBUST LINEAR MODEL

keep_me <- wages_demog_hs %>% count(id) %>% filter(n >4)

wages_demog_hs <- wages_demog_hs %>%
  filter(id %in% keep_me$id)

by_id <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage) %>%
  group_by(id) %>%
  nest()


id_rlm <- by_id %>%
  mutate(model = map(.x = data,
                     .f = function(x){
                   rlm(mean_hourly_wage ~ year, data = x)
                     }))

id_aug <- id_rlm %>%
  mutate(augmented = map(model, broom::augment)) %>%
  unnest(augmented)

id_w <- id_rlm %>%
  mutate(w = map(.x = model,
                 .f = function(x){
                   x$w
                 })) %>%
  unnest(w) %>%
  dplyr::select(w)


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

wages_rlm_dat <- id_aug_w %>%
  mutate(wages_rlm_1 = ifelse(w != 1 & .fitted >= 0, .fitted,
                            mean_hourly_wage),
         wages_rlm_2 = ifelse(w < 0.7 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_3 = ifelse(w < 0.5 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_4 = ifelse(w < 0.3 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_5 = ifelse(w < 0.1 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_6 = ifelse(w < 0.2 & .fitted >= 0, .fitted,
                              mean_hourly_wage)) %>%
  mutate(is_pred1 = ifelse(w != 1 & .fitted >= 0, TRUE,
                          FALSE),
         is_pred2 = ifelse(w < 0.7 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred3 = ifelse(w < 0.5 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred4 = ifelse(w < 0.3 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred5 = ifelse(w < 0.1 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred6 = ifelse(w < 0.2 & .fitted >= 0, TRUE,
                           FALSE)) %>%
  rename(wages_original = mean_hourly_wage)





wages_compare <- wages_rlm_dat %>%
  dplyr::select(id, year, wages_original, wages_rlm_1,
                wages_rlm_2,
                wages_rlm_3,
                wages_rlm_4,
                wages_rlm_5,
                wages_rlm_6) %>%
  pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")



set.seed(333222123)

sample_id <- sample(unique(wages_compare$id), 20)
sample <- subset(wages_compare, id %in% sample_id)


# plot all of the thresholds
ggplot(sample) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id)


# plot by threshold

w05 <- ggplot(filter(sample, type %in% c("wages_original", "wages_rlm_5"))) +
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

w05

wages_rlm_zero_pone <- wages_rlm_dat %>%
  dplyr::select(id, year, wages_original, w, wages_rlm_5, is_pred5)

sum_id <- wages_rlm_zero_pone %>%
  group_by(id) %>%
  summarise(n_obs = length(id))

sum_pred <- wages_rlm_zero_pone %>%
  filter(is_pred5 == TRUE) %>%
  group_by(id) %>%
  summarise(n_pred = length(id))


summarize_pred <- left_join(sum_pred, sum_id, by = "id") %>%
  mutate(perc_pred = (n_pred/n_obs)*100) %>%
  arrange(perc_pred, decrease = TRUE)


sum_pred_filtered <- summarize_pred %>%
  filter(perc_pred > 10)


sum_pred_filtered2 <- wages_compare %>%
  filter(id %in% sum_pred_filtered$id)



ggplot(filter(sum_pred_filtered2, type %in% c("wages_original", "wages_rlm_5"))) +
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











