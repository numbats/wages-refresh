library(tidyverse)
library(zoo)
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


# calculate the number of observation
keep_me <- wages_demog_hs %>% count(id)
keep_me %>% ggplot(aes(x=n)) + geom_bar()

# filter out the id with low number of observation
keep_me <- keep_me %>% filter(n > 4)

wages_demog_hs <- wages_demog_hs %>%
  filter(id %in% keep_me$id)

# nesting the data by id to build a robust linear model
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
  mutate(wages_rlm = ifelse(w != 1 & .fitted >= 0, .fitted,
                            mean_hourly_wage)) %>%
  mutate(is_pred = ifelse(w != 1 & .fitted >= 0, TRUE,
                          FALSE)) %>%
  dplyr::select(id, year, wages_rlm, is_pred)


# join back the `wages_rlm_dat` to `wages_demog_hs`

wages_demog_hs <- left_join(wages_demog_hs, wages_rlm_dat, by = c("id", "year"))

# select out the old value of mean hourly wage and change it with the wages_rlm value
wages_demog_hs <- wages_demog_hs %>%
  select(-mean_hourly_wage) %>%
  rename(mean_hourly_wage = wages_rlm)

# rename and select the wages in tidy
wages_hs2020_weighted <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours, is_wm, is_pred)

save(wages_hs2020_weighted, file="wages_hs2020_weighted_updated2018.rda")

summary(wages_hs2020_weighted$mean_hourly_wage)

ggplot(wages_hs2020_weighted) +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id), alpha = 0.1)

