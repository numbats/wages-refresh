library(tidyverse)
library(zoo)
library(rstatix)
library(robustlmm)
library(modelr)
library(patchwork)




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

set.seed(20210217)

sample_id <- sample(unique(n_obs$id), 100)
sample <- subset(wages_demog_hs, id %in% sample_id)

# check the extreme value

sample_ext <- sample %>%
  group_by(id) %>%
  identify_outliers("mean_hourly_wage") %>%
  select(year, id, is.outlier, is.extreme)

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
  select(id, year, wages_clean_ext) %>%
  group_by(id) %>%
  na.locf()


# join back the locf value to wages_demog_hs
wages_hs_sample <- left_join(wages_hs_sample, for_locf, by = c("id", "year")) %>%
  select(-wages_clean_ext.x) %>%
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


