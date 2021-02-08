library(tidyverse)
library(zoo)


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

# replace the obs with mean_hourly_wage > 100 to be NA
# since we will impute the missing values with the last observation carried forward (locf) for each id
# we give the flag for that locf observation

wages_demog_hs <- wages_demog_hs %>%
  mutate(mean_hourly_wage = ifelse(mean_hourly_wage > 100, NA, mean_hourly_wage),
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


# calculate the IQR to create the extreme value flag

IQR_cut_off <- IQR(wages_demog_hs$mean_hourly_wage, na.rm = TRUE)*1.5
q1 <- quantile(wages_demog_hs$mean_hourly_wage, 0.25, na.rm = TRUE)
q3 <- quantile(wages_demog_hs$mean_hourly_wage, 0.75, na.rm = TRUE)

lower_limit <- q1 - IQR_cut_off
upper_limit <- q3 + IQR_cut_off

wages_demog_hs <- wages_demog_hs %>%
  mutate(is_extreme_val = ifelse(mean_hourly_wage < lower_limit |
                          mean_hourly_wage > upper_limit, TRUE,
                        FALSE)) %>%
  mutate(flag = case_when(is_wm == TRUE & is_extreme_val == FALSE ~ 1,
                          is_wm == TRUE & is_extreme_val == TRUE ~ 2,
                          is_wm == FALSE & is_extreme_val == FALSE ~ 3,
                          is_wm == FALSE & is_extreme_val == TRUE ~ 4))

filtered <- filter(wages_demog_hs, is_extreme_val == FALSE)
summary(filtered$mean_hourly_wage)



# rename and select the wages in tidy
wages_hs2020_weighted <- wages_demog_hs %>%
  select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours, is_wm, is_extreme_val, is_locf, flag)

save(wages_hs2020_weighted, file="wages_hs2020_weighted.rda")

summary(wages_hs2020_weighted$mean_hourly_wage)


