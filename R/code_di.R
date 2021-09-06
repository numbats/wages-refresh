library(tidyverse)
d <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment.csv")

# Check counts by individual
d %>% count(CASEID_1979, sort=TRUE) %>% summary(n)

# Check values for one long individual
id1105 <- d %>% filter(CASEID_1979 == 1105)# %>% count(year) %>% print(n=50)
ggplot(id1105, aes(x=year, y=mean_hourly_wage)) +
  geom_point() + geom_smooth(se=FALSE)

# Check numbers by year
d %>% count(year) %>% print(n=50)

# Keep records for long individuals
keep <- d %>% count(CASEID_1979, sort=TRUE) %>% filter(n > 26)
d2 <- d %>% filter(CASEID_1979 %in% keep$CASEID_1979)

ggplot(d2, aes(x=year, y=`mean_hourly_wage`)) +
  #geom_point() +
  geom_smooth(aes(group=CASEID_1979), se=FALSE, alpha=0.2) +
  ylim(c(0,100))

ggplot(d2, aes(x=year, y=`mean_hourly_wage`)) +
  geom_line(aes(group=CASEID_1979)) +
  geom_smooth(se=FALSE) +
  ylim(c(0,100))

wages <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_employment.csv")
demog <- read_csv("data-raw/wages-high-school-demo/data-frames/tidy_demographics.csv")

# Check RDS files
wages <- readRDS("data-raw/wages-high-school-demo/data-frames/tidy_employment.rds")
wages %>% count(CASEID_1979, sort = TRUE) %>% summarise(mean(n), min(n), max(n))
wages %>% ggplot(aes(x=number_of_jobs, y=mean_hourly_wage)) + geom_point()

demog <- readRDS("data-raw/wages-high-school-demo/data-frames/tidy_demographics.rds")
demog %>% count(`highest-grade`)
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

# don't need demog-education.rds
# demog_educ <- readRDS("data-raw/wages-high-school-demo/data-frames/demog-education.rds")

# Need to compute relative numbers
# Since finishing school and starting on workforce
# Organise educ to set categories, or subset on this
# Need to filter out observations with crazy wages, and too few points
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

# Set any hourly wages > 100 to NA because there are very few, Q3=11.50
# Hard to decide when its just too  high too be unbelievable
# Old data max wage was ~70
wages_demog_hs <- wages_demog_hs %>%
  mutate(mean_hourly_wage = ifelse(mean_hourly_wage > 30, NA, mean_hourly_wage))
keep_me <- wages_demog_hs %>% count(CASEID_1979)
keep_me %>% ggplot(aes(x=n)) + geom_bar()
keep_me <- keep_me %>% filter(n > 4)
wages_demog_hs <- wages_demog_hs %>%
  filter(CASEID_1979 %in% keep_me$CASEID_1979)

wages_hs2020 <- wages_demog_hs %>%
  rename(id=CASEID_1979, hgc=`highest-grade`,
         hgc_i=`highest-grade-int`, yr_hgc=year_completed_highest_grade) %>%
  select(id, year, mean_hourly_wage, age_1979, gender, race, hgc, hgc_i, yr_hgc, number_of_jobs, total_hours)
save(wages_hs2020, file="wages_hs2020.rda")

# Clearly there are problems with wages, tracking down problems
wages_demog %>% filter(mean_hourly_wage > 50000) %>% select(CASEID_1979)
wages_demog %>% filter(CASEID_1979 == "6803") %>% print(n=50)
wages_demog %>% filter(CASEID_1979 == "7980") %>% print(n=50)
wages_demog %>% filter(CASEID_1979 == "5140") %>% print(n=50)

# RE-DO
library(tidyverse)
library(yowie)
data("wages_hs_dropout")
glimpse(wages_hs_dropout)

# Number of observations per person
wages_hs_dropout %>% count(id, sort=TRUE) %>% summary(n)
wages_hs_dropout %>% count(id, sort=TRUE) %>%
  ggplot(aes(x=n)) +
  geom_histogram(breaks = seq(4.5, 28.5, 1), colour="white") +
  xlab("Number of observations per individual")

# Check values for long individuals
long <- wages_hs_dropout %>%
  count(id, sort=TRUE) %>%
  filter(n == 28)
wages_hs_dropout %>%
  filter(id %in% long$id) %>%
  ggplot(aes(x=year, y=mean_hourly_wage)) +
    geom_point() +
    geom_smooth(method="lm", se=FALSE) +
    facet_wrap(~id) +
  scale_x_continuous("", breaks = seq(1980, 2020, 10),
                     labels = c("80", "90", "00", "10", "20")) +
  ylab("Hourly wage")

# Check values for short individuals
short <- wages_hs_dropout %>%
  count(id, sort=TRUE) %>%
  filter(n == 5)
wages_hs_dropout %>%
  filter(id %in% short$id) %>%
  ggplot(aes(x=year, y=mean_hourly_wage)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(~id) +
  scale_x_continuous("", breaks = seq(1980, 2020, 10),
                     labels = c("80", "90", "00", "10", "20")) +
  ylab("Hourly wage")

# Random collection of individuals

# By demographics
# hgc
# race
# gender
# number of jobs or hours worked, aggregated over time

