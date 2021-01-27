library(tidyverse)

wages <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment_sc2.csv")
demog <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_demographics.csv")

wages_demog <- left_join(wages, demog, by="CASEID_1979")

wages_demog %>%
  filter(`highest-grade` %in% c("10TH GRADE", "11TH GRADE", "12TH GRADE")) %>%
  ggplot(aes(x=year, y=mean_hourly_wage))  +
  geom_point() + facet_wrap(~`highest-grade`)
# Look like some issues with wages > 10000 per hour
# Need to organsie education
wages_demog %>% #count(gender)
  #filter(`highest-grade` %in% c("10TH GRADE", "11TH GRADE", "12TH GRADE")) %>%
  ggplot(aes(x=year, y=mean_hourly_wage))  +
  geom_point() + facet_wrap(~gender)

wages_demog <- wages_demog %>%
  mutate(year = as.numeric(year),
         year_completed_highest_grade = as.numeric(year_completed_highest_grade)) %>%
  mutate(years_in_workforce = year - year_completed_highest_grade) %>%
  mutate(age_1979 = 1979 - (dob_year + 1900))

wages_demog %>% filter(years_in_workforce < 0) %>% tally()

wages_demog %>% filter(years_in_workforce < 0) %>%
  count(CASEID_1979) %>% tally()
wages_demog %>%
  ggplot(aes(x=years_in_workforce, y=number_of_jobs)) +
  geom_point()
wages_demog_hs <- wages_demog  %>% filter(grepl("GRADE", `highest-grade`))
wages_demog_hs %>% filter(years_in_workforce < 0) %>% tally()
wages_demog_hs %>% filter(years_in_workforce < -35) %>%
  select(CASEID_1979, year, year_completed_highest_grade, `highest-grade`, dob_year, number_of_jobs, mean_hourly_wage)
wages_demog_hs %>% filter(CASEID_1979 == "4396") %>% print(n=50)

wages_demog %>% ggplot(aes(x=age_1979)) + geom_bar()
summary(wages_demog$mean_hourly_wage)
wages_demog_hs %>% ggplot(aes(x=mean_hourly_wage)) + geom_density() +
  xlim(c(0, 75))
wages_demog_hs %>% filter(mean_hourly_wage > 300) %>%  count(CASEID_1979) %>% tally()
wages_demog_hs %>%
  group_by(year) %>%
  summarise(m=mean(mean_hourly_wage, na.rm=TRUE)) %>%
  print(n=50)
wages_demog %>%
  group_by(year) %>%
  summarise(m=mean(mean_hourly_wage, na.rm=TRUE)) %>%
  print(n=50)


wages_demog_hs <- wages_demog_hs %>%
  mutate(mean_hourly_wage = ifelse(mean_hourly_wage > 30, NA, mean_hourly_wage))
keep_me <- wages_demog_hs %>% count(CASEID_1979)
keep_me %>% ggplot(aes(x=n)) + geom_bar()
keep_me <- keep_me %>% filter(n > 4)
wages_demog_hs <- wages_demog_hs %>%
  filter(CASEID_1979 %in% keep_me$CASEID_1979)

wages_hs2020_sc2 <- wages_demog_hs %>%
  rename(id=CASEID_1979, hgc=`highest-grade`,
         hgc_i=`highest-grade-int`, yr_hgc=year_completed_highest_grade) %>%
  select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours)


save(wages_hs2020_sc2, file="wages_hs2020_sc2.rda")
