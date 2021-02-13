library(tidyverse)
library(zoo)
library(rstatix)



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

# replace the obs with mean_hourly_wage is.extreme == TRUE to be NA
# since we will impute the missing values with the last observation carried forward (locf) for each id
# we give the flag for that locf observation

wages_demog_ext <- wages_demog_hs %>%
  group_by(id) %>%
  identify_outliers("mean_hourly_wage") %>%
  filter(is.extreme == TRUE) %>%
  select(year, id, is.extreme)




wages_demog_hs <- left_join(wages_demog_hs, wages_demog_ext, by = c("id", "year"))

wages_demog_hs <- wages_demog_hs %>%
  mutate(is.extreme = ifelse(is.na(is.extreme), FALSE,
                             is.extreme))

wages_demog_hs <- wages_demog_hs %>%
  mutate(mean_hourly_wage = ifelse(is.extreme == TRUE, NA, mean_hourly_wage),
         is_locf = ifelse(is.na(mean_hourly_wage), TRUE, FALSE))


# doing locf

for_locf <- wages_demog_hs %>%
  select(id, year, mean_hourly_wage) %>%
  group_by(id) %>%
  na.locf()


# join back

wages_demog_hs <- left_join(wages_demog_hs, for_locf, by = c("id", "year")) %>%
  select(-mean_hourly_wage.x) %>%
  rename(mean_hourly_wage = mean_hourly_wage.y)


# calculate the number of observation
keep_me <- wages_demog_hs %>% count(id)
keep_me %>% ggplot(aes(x=n)) + geom_bar()

# filter out the id with low number of observation
keep_me <- keep_me %>% filter(n > 4)

wages_demog_hs <- wages_demog_hs %>%
  filter(id %in% keep_me$id)

# Add the extreme value flag







# rename and select the wages in tidy
wages_hs2020_weighted <- wages_demog_hs %>%
  select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours, is_wm, is_locf)

#save(wages_hs2020_weighted, file="wages_hs2020_weighted_updated2018.rda")

summary(wages_hs2020_weighted$mean_hourly_wage)

ggplot(wages_hs2020_weighted) +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id), alpha = 0.1)


