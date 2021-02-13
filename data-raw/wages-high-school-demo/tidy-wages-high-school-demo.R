library(here)
library(readr)
library(tidyr)
library(tidyverse)

# code written to read and save data automatically by NLSY
# source(here::here("data-raw/wages-high-school-demo/wages-high-school-demo.R"))
#
# Creates four files: new_data, has the variables using RNUM
#                     new_data_qnames, has the data with qnames
#                     categories_vallabels, has RNUM and coding of each variable
#                     categories_qnames, has qname and coding of each variable
# (qname must be Question name?)
#
# write_rds(as_tibble(new_data_qnames),
#           here::here("data-raw/wages-high-school-demo/data-frames/wages-high-school-demo-new_data_qnames.rds"),
#           compress = "xz")

# write_rds(as_tibble(categories_qnames),
#           here::here("data-raw/wages-high-school-demo/data-frames/wages-high-school-demo-categories_qnames.rds"),
#           compress = "xz")

new_data_qnames <- read_rds(here::here("data-raw/wages-high-school-demo/data-frames/wages-high-school-demo-new_data_qnames.rds"))
categories_qnames <- read_rds(here::here("data-raw/wages-high-school-demo/data-frames/wages-high-school-demo-categories_qnames.rds"))


# tidying dob data

dob_tidy <- new_data_qnames %>%
  select(CASEID_1979,
         `Q1-3_A~M_1979`,
         `Q1-3_A~Y_1979`,
         `Q1-3_A~M_1981`,
         `Q1-3_A~Y_1981`) %>%
  mutate(dob_year = case_when(
    `Q1-3_A~Y_1979` == `Q1-3_A~Y_1981` ~ `Q1-3_A~Y_1979`,   # if the years recorded in both sets match, take 79 data
    is.na(`Q1-3_A~Y_1981`) ~ `Q1-3_A~Y_1979`,    # if the year in the 81 set is missing, take the 79 data
    `Q1-3_A~Y_1979` != `Q1-3_A~Y_1981` ~ `Q1-3_A~Y_1979`    # if the sets don't match for dob year, take the 79 data
    ),
    dob_month = case_when(
      `Q1-3_A~M_1979` == `Q1-3_A~M_1981` ~ `Q1-3_A~M_1979`,    # if months recorded in both sets match, take 79 data
      is.na(`Q1-3_A~M_1981`) ~ `Q1-3_A~M_1979`,    # if month in 81 set is missing, take the 79 data
      `Q1-3_A~M_1979` != `Q1-3_A~M_1981` ~ `Q1-3_A~M_1979`     # if sets don't match for dob month, take the 79 data
    ),
    dob_conflict = case_when(     # flag if there is a conflict between dob recorded in 79 and 81
      (`Q1-3_A~M_1979` != `Q1-3_A~M_1981`) & !is.na(`Q1-3_A~M_1981`) ~ TRUE,
      (`Q1-3_A~Y_1979` != `Q1-3_A~Y_1981`) & !is.na(`Q1-3_A~Y_1981`) ~ TRUE,
      (`Q1-3_A~Y_1979` == `Q1-3_A~Y_1981`) & (`Q1-3_A~M_1979` == `Q1-3_A~M_1981`) ~ FALSE,
      is.na(`Q1-3_A~M_1981`) | is.na(`Q1-3_A~Y_1981`) ~ FALSE
    )) %>%
  select(CASEID_1979,
         dob_month,
         dob_year,
         dob_conflict)


# Demographics tidying
demog_tidy <- categories_qnames %>%
  select(CASEID_1979,
         SAMPLE_RACE_78SCRN,
         SAMPLE_SEX_1979) %>%
  rename(gender = SAMPLE_SEX_1979,
         race = SAMPLE_RACE_78SCRN)


# Highest year tidying

demog_education <- new_data_qnames %>%
  as_tibble() %>%
  select(CASEID_1979,
         starts_with("HGCREV"),
         "HGC_2012",
         "HGC_2014",
         "HGC_2016") %>%
  gather('raw-var', 'grades', 'HGCREV79_1979':'HGC_2016', -'CASEID_1979', na.rm = TRUE) %>%
  separate('raw-var', c(NA, 'year'), sep = -4)

highest_year <- demog_education %>%
  group_by(CASEID_1979) %>%
  mutate('highest-grade-int' = max(grades)) %>%
  filter(`highest-grade-int` == grades) %>%
  filter(year == first(year)) %>%
  rename(year_completed_highest_grade = year) %>%
  select(CASEID_1979, year_completed_highest_grade, `highest-grade-int`) %>%
  ungroup() %>%
  mutate('highest-grade' = case_when(`highest-grade-int` == 0 ~ "NONE",
                                     `highest-grade-int` == 1 ~ "1ST GRADE",
                                     `highest-grade-int` == 2 ~ "2ND GRADE",
                                     `highest-grade-int` == 3 ~ "3RD GRADE",
                                     `highest-grade-int` == 4 ~ "4TH GRADE",
                                     `highest-grade-int` == 5 ~ "5TH GRADE",
                                     `highest-grade-int` == 6 ~ "6TH GRADE",
                                     `highest-grade-int` == 7 ~ "7TH GRADE",
                                     `highest-grade-int` == 8 ~ "8TH GRADE",
                                     `highest-grade-int` == 9 ~ "9TH GRADE",
                                     `highest-grade-int` == 10 ~ "10TH GRADE",
                                     `highest-grade-int` == 11 ~ "11TH GRADE",
                                     `highest-grade-int` == 12 ~ "12TH GRADE",
                                     `highest-grade-int` == 13 ~ "1ST YEAR COL",
                                     `highest-grade-int` == 14 ~ "2ND YEAR COL",
                                     `highest-grade-int` == 15 ~ "3RD YEAR COL",
                                     `highest-grade-int` == 16 ~ "4TH YEAR COL",
                                     `highest-grade-int` == 17 ~ "5TH YEAR COL",
                                     `highest-grade-int` == 18 ~ "6TH YEAR COL",
                                     `highest-grade-int` == 19 ~ "7TH YEAR COL",
                                     `highest-grade-int` == 20 ~ "8TH YEAR COL +",
                                     `highest-grade-int` == 95 ~ "UNGRADED",
                                     ))


# putting together full demographic table

full_demographics <- full_join(dob_tidy, demog_tidy, by = "CASEID_1979") %>%
  full_join(highest_year, by = "CASEID_1979")

# saving data frames as csv and rds
#write.csv(full_demographics, here::here("data-raw/wages-high-school-demo/data-frames/tidy_demographics.csv"))
#write_rds(as_tibble(full_demographics),
          #here::here("data-raw/wages-high-school-demo/data-frames/tidy_demographics.rds"),
          #compress = "xz")
#write.csv(demog_education, here::here("data-raw/wages-high-school-demo/data-frames/demog-education.csv"))
#write_rds(as_tibble(demog_education),
          #here::here("data-raw/wages-high-school-demo/data-frames/demog-education.rds"),
          #compress = "xz")


# tidying employment data

# tidying hours data
tidy_hours_79 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1979",
         "QES-52A.02_1979",
         "QES-52A.03_1979",
         "QES-52A.04_1979",
         "QES-52A.05_1979") %>%
  gather("raw-var", "hours", "QES-52A.01_1979":"QES-52A.05_1979", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_80 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1980",
         "QES-52A.02_1980",
         "QES-52A.03_1980",
         "QES-52A.04_1980",
         "QES-52A.05_1980") %>%
  gather("raw-var", "hours", "QES-52A.01_1980":"QES-52A.05_1980", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_81 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1981",
         "QES-52A.02_1981",
         "QES-52A.03_1981",
         "QES-52A.04_1981",
         "QES-52A.05_1981") %>%
  gather("raw-var", "hours", "QES-52A.01_1981":"QES-52A.05_1981", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_82 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1982",
         "QES-52A.02_1982",
         "QES-52A.03_1982",
         "QES-52A.04_1982",
         "QES-52A.05_1982") %>%
  gather("raw-var", "hours", "QES-52A.01_1982":"QES-52A.05_1982", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_83 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1983",
         "QES-52A.02_1983",
         "QES-52A.03_1983",
         "QES-52A.04_1983",
         "QES-52A.05_1983") %>%
  gather("raw-var", "hours", "QES-52A.01_1983":"QES-52A.05_1983", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_84 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1984",
         "QES-52A.02_1984",
         "QES-52A.03_1984",
         "QES-52A.04_1984",
         "QES-52A.05_1984") %>%
  gather("raw-var", "hours", "QES-52A.01_1984":"QES-52A.05_1984", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_85 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1985",
         "QES-52A.02_1985",
         "QES-52A.03_1985",
         "QES-52A.04_1985",
         "QES-52A.05_1985") %>%
  gather("raw-var", "hours", "QES-52A.01_1985":"QES-52A.05_1985", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_86 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1986",
         "QES-52A.02_1986",
         "QES-52A.03_1986",
         "QES-52A.04_1986",
         "QES-52A.05_1986") %>%
  gather("raw-var", "hours", "QES-52A.01_1986":"QES-52A.05_1986", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_87 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1987",
         "QES-52A.02_1987",
         "QES-52A.03_1987",
         "QES-52A.04_1987",
         "QES-52A.05_1987") %>%
  gather("raw-var", "hours", "QES-52A.01_1987":"QES-52A.05_1987", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_88 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1988",
         "QES-52D.02_1988",
         "QES-52D.03_1988",
         "QES-52D.04_1988",
         "QES-52D.05_1988") %>%
  gather("raw-var", "hours", "QES-52D.01_1988":"QES-52D.05_1988", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_89 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1989",
         "QES-52D.02_1989",
         "QES-52D.03_1989",
         "QES-52D.04_1989",
         "QES-52D.05_1989") %>%
  gather("raw-var", "hours", "QES-52D.01_1989":"QES-52D.05_1989", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_90 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1990",
         "QES-52D.02_1990",
         "QES-52D.03_1990",
         "QES-52D.04_1990",
         "QES-52D.05_1990") %>%
  gather("raw-var", "hours", "QES-52D.01_1990":"QES-52D.05_1990", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_91 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1991",
         "QES-52D.02_1991",
         "QES-52D.03_1991",
         "QES-52D.04_1991",
         "QES-52D.05_1991") %>%
  gather("raw-var", "hours", "QES-52D.01_1991":"QES-52D.05_1991", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_92 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1992",
         "QES-52D.02_1992",
         "QES-52D.03_1992",
         "QES-52D.04_1992",
         "QES-52D.05_1992") %>%
  gather("raw-var", "hours", "QES-52D.01_1992":"QES-52D.05_1992", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_93 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52A.01_1993",
         "QES-52A.02_1993",
         "QES-52A.03_1993",
         "QES-52A.04_1993",
         "QES-52A.05_1993") %>%
  gather("raw-var", "hours", "QES-52A.01_1993":"QES-52A.05_1993", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_94 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1994",
         "QES-52D.02_1994",
         "QES-52D.03_1994",
         "QES-52D.04_1994",
         "QES-52D.05_1994") %>%
  gather("raw-var", "hours", "QES-52D.01_1994":"QES-52D.05_1994", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_96 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1996",
         "QES-52D.02_1996",
         "QES-52D.03_1996",
         "QES-52D.04_1996",
         "QES-52D.05_1996") %>%
  gather("raw-var", "hours", "QES-52D.01_1996":"QES-52D.05_1996", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_98 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_1998",
         "QES-52D.02_1998",
         "QES-52D.03_1998",
         "QES-52D.04_1998",
         "QES-52D.05_1998") %>%
  gather("raw-var", "hours", "QES-52D.01_1998":"QES-52D.05_1998", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_00 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2000",
         "QES-52D.02_2000",
         "QES-52D.03_2000",
         "QES-52D.04_2000",
         "QES-52D.05_2000") %>%
  gather("raw-var", "hours", "QES-52D.01_2000":"QES-52D.05_2000", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_02 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2002",
         "QES-52D.02_2002",
         "QES-52D.03_2002",
         "QES-52D.04_2002",
         "QES-52D.05_2002") %>%
  gather("raw-var", "hours", "QES-52D.01_2002":"QES-52D.05_2002", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_04 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2004",
         "QES-52D.02_2004",
         "QES-52D.03_2004",
         "QES-52D.04_2004",
         "QES-52D.05_2004") %>%
  gather("raw-var", "hours", "QES-52D.01_2004":"QES-52D.05_2004", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_06 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2006",
         "QES-52D.02_2006",
         "QES-52D.03_2006",
         "QES-52D.04_2006",
         "QES-52D.05_2006") %>%
  gather("raw-var", "hours", "QES-52D.01_2006":"QES-52D.05_2006", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_08 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2008",
         "QES-52D.02_2008",
         "QES-52D.03_2008",
         "QES-52D.04_2008") %>%
  gather("raw-var", "hours", "QES-52D.01_2008":"QES-52D.04_2008", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_10 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2010",
         "QES-52D.02_2010",
         "QES-52D.03_2010",
         "QES-52D.04_2010",
         "QES-52D.05_2010") %>%
  gather("raw-var", "hours", "QES-52D.01_2010":"QES-52D.05_2010", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_12 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2012",
         "QES-52D.02_2012",
         "QES-52D.03_2012",
         "QES-52D.04_2012",
         "QES-52D.05_2012") %>%
  gather("raw-var", "hours", "QES-52D.01_2012":"QES-52D.05_2012", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_14 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2014",
         "QES-52D.02_2014",
         "QES-52D.03_2014",
         "QES-52D.04_2014",
         "QES-52D.05_2014") %>%
  gather("raw-var", "hours", "QES-52D.01_2014":"QES-52D.05_2014", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)

tidy_hours_16 <- new_data_qnames %>%
  select(CASEID_1979,
         "QES-52D.01_2016",
         "QES-52D.02_2016",
         "QES-52D.03_2016",
         "QES-52D.04_2016",
         "QES-52D.05_2016") %>%
  gather("raw-var", "hours", "QES-52D.01_2016":"QES-52D.05_2016", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(total_hours = sum(hours)) %>%
  filter(`job-no` == first(`job-no`)) %>%
  select(CASEID_1979, year, total_hours)


# tidying hourly wage data

tidy_wage_79 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1979",
         "HRP2_1979",
         "HRP3_1979",
         "HRP4_1979",
         "HRP5_1979") %>%
  gather("raw-var", "hourly-rate", "HRP1_1979":"HRP5_1979", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_80 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1980",
         "HRP2_1980",
         "HRP3_1980",
         "HRP4_1980",
         "HRP5_1980") %>%
  gather("raw-var", "hourly-rate", "HRP1_1980":"HRP5_1980", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_81 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1981",
         "HRP2_1981",
         "HRP3_1981",
         "HRP4_1981",
         "HRP5_1981") %>%
  gather("raw-var", "hourly-rate", "HRP1_1981":"HRP5_1981", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_82 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1982",
         "HRP2_1982",
         "HRP3_1982",
         "HRP4_1982",
         "HRP5_1982") %>%
  gather("raw-var", "hourly-rate", "HRP1_1982":"HRP5_1982", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_83 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1983",
         "HRP2_1983",
         "HRP3_1983",
         "HRP4_1983",
         "HRP5_1983") %>%
  gather("raw-var", "hourly-rate", "HRP1_1983":"HRP5_1983", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_84 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1984",
         "HRP2_1984",
         "HRP3_1984",
         "HRP4_1984",
         "HRP5_1984") %>%
  gather("raw-var", "hourly-rate", "HRP1_1984":"HRP5_1984", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_85 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1985",
         "HRP2_1985",
         "HRP3_1985",
         "HRP4_1985",
         "HRP5_1985") %>%
  gather("raw-var", "hourly-rate", "HRP1_1985":"HRP5_1985", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_86 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1986",
         "HRP2_1986",
         "HRP3_1986",
         "HRP4_1986",
         "HRP5_1986") %>%
  gather("raw-var", "hourly-rate", "HRP1_1986":"HRP5_1986", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_87 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1987",
         "HRP2_1987",
         "HRP3_1987",
         "HRP4_1987",
         "HRP5_1987") %>%
  gather("raw-var", "hourly-rate", "HRP1_1987":"HRP5_1987", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_88 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1988",
         "HRP2_1988",
         "HRP3_1988",
         "HRP4_1988",
         "HRP5_1988") %>%
  gather("raw-var", "hourly-rate", "HRP1_1988":"HRP5_1988", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_89 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1989",
         "HRP2_1989",
         "HRP3_1989",
         "HRP4_1989",
         "HRP5_1989") %>%
  gather("raw-var", "hourly-rate", "HRP1_1989":"HRP5_1989", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_90 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1990",
         "HRP2_1990",
         "HRP3_1990",
         "HRP4_1990",
         "HRP5_1990") %>%
  gather("raw-var", "hourly-rate", "HRP1_1990":"HRP5_1990", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_91 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1991",
         "HRP2_1991",
         "HRP3_1991",
         "HRP4_1991",
         "HRP5_1991") %>%
  gather("raw-var", "hourly-rate", "HRP1_1991":"HRP5_1991", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_92 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1992",
         "HRP2_1992",
         "HRP3_1992",
         "HRP4_1992",
         "HRP5_1992") %>%
  gather("raw-var", "hourly-rate", "HRP1_1992":"HRP5_1992", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_93 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1993",
         "HRP2_1993",
         "HRP3_1993",
         "HRP4_1993",
         "HRP5_1993") %>%
  gather("raw-var", "hourly-rate", "HRP1_1993":"HRP5_1993", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_94 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1994",
         "HRP2_1994",
         "HRP3_1994",
         "HRP4_1994",
         "HRP5_1994") %>%
  gather("raw-var", "hourly-rate", "HRP1_1994":"HRP5_1994", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_96 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1996",
         "HRP2_1996",
         "HRP3_1996",
         "HRP4_1996",
         "HRP5_1996") %>%
  gather("raw-var", "hourly-rate", "HRP1_1996":"HRP5_1996", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_98 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_1998",
         "HRP2_1998",
         "HRP3_1998",
         "HRP4_1998",
         "HRP5_1998") %>%
  gather("raw-var", "hourly-rate", "HRP1_1998":"HRP5_1998", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_00 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2000",
         "HRP2_2000",
         "HRP3_2000",
         "HRP4_2000",
         "HRP5_2000") %>%
  gather("raw-var", "hourly-rate", "HRP1_2000":"HRP5_2000", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_02 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2002",
         "HRP2_2002",
         "HRP3_2002",
         "HRP4_2002",
         "HRP5_2002") %>%
  gather("raw-var", "hourly-rate", "HRP1_2002":"HRP5_2002", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_04 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2004",
         "HRP2_2004",
         "HRP3_2004",
         "HRP4_2004",
         "HRP5_2004") %>%
  gather("raw-var", "hourly-rate", "HRP1_2004":"HRP5_2004", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_06 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2006",
         "HRP2_2006",
         "HRP3_2006",
         "HRP4_2006",
         "HRP5_2006") %>%
  gather("raw-var", "hourly-rate", "HRP1_2006":"HRP5_2006", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_08 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2008",
         "HRP2_2008",
         "HRP3_2008",
         "HRP4_2008",
         "HRP5_2008") %>%
  gather("raw-var", "hourly-rate", "HRP1_2008":"HRP5_2008", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_10 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2010",
         "HRP2_2010",
         "HRP3_2010",
         "HRP4_2010",
         "HRP5_2010") %>%
  gather("raw-var", "hourly-rate", "HRP1_2010":"HRP5_2010", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_12 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2012",
         "HRP2_2012",
         "HRP3_2012",
         "HRP4_2012",
         "HRP5_2012") %>%
  gather("raw-var", "hourly-rate", "HRP1_2012":"HRP5_2012", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_14 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2014",
         "HRP2_2014",
         "HRP3_2014",
         "HRP4_2014",
         "HRP5_2014") %>%
  gather("raw-var", "hourly-rate", "HRP1_2014":"HRP5_2014", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)

tidy_wage_16 <- new_data_qnames %>%
  select(CASEID_1979,
         "HRP1_2016",
         "HRP2_2016",
         "HRP3_2016",
         "HRP4_2016",
         "HRP5_2016") %>%
  gather("raw-var", "hourly-rate", "HRP1_2016":"HRP5_2016", na.rm = TRUE) %>%
  separate("raw-var", c("mod-var", "year"), sep = -4) %>%
  separate("mod-var", c("mod-var", NA), sep = -1) %>%
  separate("mod-var", c(NA, "job-no"), sep = -1) %>%
  group_by(CASEID_1979) %>%
  mutate(number_of_jobs = n_distinct(`job-no`),
         mean_hourly_wage = mean(`hourly-rate`)/100) %>%    # divided by 100 to get into dollars
  filter(`job-no` == first(`job-no`)) %>%
  select(-`job-no`, -`hourly-rate`)


tidy_employment_79 <- full_join(tidy_hours_79, tidy_wage_79, by = c("CASEID_1979", "year"))

tidy_employment_80 <- full_join(tidy_hours_80, tidy_wage_80, by = c("CASEID_1979", "year"))

tidy_employment_81 <- full_join(tidy_hours_81, tidy_wage_81, by = c("CASEID_1979", "year"))

tidy_employment_82 <- full_join(tidy_hours_82, tidy_wage_82, by = c("CASEID_1979", "year"))

tidy_employment_83 <- full_join(tidy_hours_83, tidy_wage_83, by = c("CASEID_1979", "year"))

tidy_employment_84 <- full_join(tidy_hours_84, tidy_wage_84, by = c("CASEID_1979", "year"))

tidy_employment_85 <- full_join(tidy_hours_85, tidy_wage_85, by = c("CASEID_1979", "year"))

tidy_employment_86 <- full_join(tidy_hours_86, tidy_wage_86, by = c("CASEID_1979", "year"))

tidy_employment_87 <- full_join(tidy_hours_87, tidy_wage_87, by = c("CASEID_1979", "year"))

tidy_employment_88 <- full_join(tidy_hours_88, tidy_wage_88, by = c("CASEID_1979", "year"))

tidy_employment_89 <- full_join(tidy_hours_89, tidy_wage_89, by = c("CASEID_1979", "year"))

tidy_employment_90 <- full_join(tidy_hours_90, tidy_wage_90, by = c("CASEID_1979", "year"))

tidy_employment_91 <- full_join(tidy_hours_91, tidy_wage_91, by = c("CASEID_1979", "year"))

tidy_employment_92 <- full_join(tidy_hours_92, tidy_wage_92, by = c("CASEID_1979", "year"))

tidy_employment_93 <- full_join(tidy_hours_93, tidy_wage_93, by = c("CASEID_1979", "year"))

tidy_employment_94 <- full_join(tidy_hours_94, tidy_wage_94, by = c("CASEID_1979", "year"))

tidy_employment_96 <- full_join(tidy_hours_96, tidy_wage_96, by = c("CASEID_1979", "year"))

tidy_employment_98 <- full_join(tidy_hours_98, tidy_wage_98, by = c("CASEID_1979", "year"))

tidy_employment_00 <- full_join(tidy_hours_00, tidy_wage_00, by = c("CASEID_1979", "year"))

tidy_employment_02 <- full_join(tidy_hours_02, tidy_wage_02, by = c("CASEID_1979", "year"))

tidy_employment_04 <- full_join(tidy_hours_04, tidy_wage_04, by = c("CASEID_1979", "year"))

tidy_employment_06 <- full_join(tidy_hours_06, tidy_wage_06, by = c("CASEID_1979", "year"))

tidy_employment_08 <- full_join(tidy_hours_08, tidy_wage_08, by = c("CASEID_1979", "year"))

tidy_employment_10 <- full_join(tidy_hours_10, tidy_wage_10, by = c("CASEID_1979", "year"))

tidy_employment_12 <- full_join(tidy_hours_12, tidy_wage_12, by = c("CASEID_1979", "year"))

tidy_employment_14 <- full_join(tidy_hours_14, tidy_wage_14, by = c("CASEID_1979", "year"))

tidy_employment_16 <- full_join(tidy_hours_16, tidy_wage_16, by = c("CASEID_1979", "year"))


tidy_employment <- bind_rows(tidy_employment_79,
                             tidy_employment_80,
                             tidy_employment_81,
                             tidy_employment_82,
                             tidy_employment_83,
                             tidy_employment_84,
                             tidy_employment_85,
                             tidy_employment_86,
                             tidy_employment_87,
                             tidy_employment_88,
                             tidy_employment_89,
                             tidy_employment_90,
                             tidy_employment_91,
                             tidy_employment_92,
                             tidy_employment_93,
                             tidy_employment_94,
                             tidy_employment_96,
                             tidy_employment_98,
                             tidy_employment_00,
                             tidy_employment_02,
                             tidy_employment_04,
                             tidy_employment_06,
                             tidy_employment_08,
                             tidy_employment_10,
                             tidy_employment_12,
                             tidy_employment_14,
                             tidy_employment_16)

#write.csv(tidy_employment, here::here("data-raw/wages-high-school-demo/data-frames/tidy_employment.csv"))
#write_rds(as_tibble(tidy_employment),
          #here::here("data-raw/wages-high-school-demo/data-frames/tidy_employment.rds"),
          #compress = "xz")


visdat::vis_dat(tidy_employment, warn_large_data = FALSE)

filter(tidy_employment, !is.na(mean_hourly_wage))
