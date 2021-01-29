library(tidyverse)

wages <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment_weighted.csv")
demog <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_demographics.csv")

d <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment.csv")

wages_demog <- left_join(wages, demog, by="CASEID_1979")

wages_demog <- wages_demog %>%
  mutate(year_completed_highest_grade = as.numeric(year_completed_highest_grade)) %>%
  mutate(years_in_workforce = year - year_completed_highest_grade) %>%
  mutate(age_1979 = 1979 - (dob_year + 1900))

# filter only the id with high school education
wages_demog_hs <- wages_demog  %>% filter(grepl("GRADE", `highest-grade`))

# replace the obs with mean_hourly_wage > 30 to be NA
wages_demog_hs <- wages_demog_hs %>%
  mutate(mean_hourly_wage = ifelse(mean_hourly_wage > 30, NA, mean_hourly_wage))

# calculate the number of observation
keep_me <- wages_demog_hs %>% count(CASEID_1979)
keep_me %>% ggplot(aes(x=n)) + geom_bar()

# filter out the id with low number of observation
keep_me <- keep_me %>% filter(n > 4)

wages_demog_hs <- wages_demog_hs %>%
  filter(CASEID_1979 %in% keep_me$CASEID_1979)


wages_hs2020_weighted <- wages_demog_hs %>%
  rename(id=CASEID_1979, hgc=`highest-grade`,
         hgc_i=`highest-grade-int`, yr_hgc=year_completed_highest_grade) %>%
  select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours, flag1)


save(wages_hs2020_weighted, file="wages_hs2020_weighted.rda")
