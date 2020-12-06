library(tidyverse)
# read the raw military data in
source(here::here("data-raw",
                  "wages-military",
                  "read-raw-military.R"))
# source the qnames file
source(here::here("R", "qnames.R"))
#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels.
categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
qnames_new_data <- qnames(new_data)
qnames_categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)
summary(categories)
summary(qnames_new_data)
summary(qnames_categories)

tidy_military <- as_tibble(qnames_new_data) %>%
  gather('raw_var',
         'raw_week_no',
         -CASEID_1979) %>%
  na.omit() %>%
  separate('raw_var',
           c(NA, 'start_stop_1_2', 'year', NA),
           sep = "_",
           remove = TRUE) %>%
  separate('start_stop_1_2', c('start_stop', 'spell'), sep = -1, remove = TRUE) %>%
  select(CASEID_1979, year, raw_week_no, start_stop, spell)

source(here::here("R", "generate-week-conversion.R"))

tidy_military

week_conversions <- create_week_conversions()

week_conversions

# now tidy up the years
source(here::here("R", "lookup-table.R"))
# this will give a warning message - which we can ignore. It is:
# Warning message:
#   In rep(c(1978L:2020L), each = c(53L, 52L, 52L, 52L)) :
#   first element used of 'each' argument
# this creates the week_lookup function.

week_lookup(0)
week_lookup(1)
week_lookup(105)
week_lookup(106)
week_lookup(107)

tidy_military %>%
  # this overwrites the original "year" data
  mutate(year = week_lookup(raw_week_no))

library(lubridate)
# now a start on creating the date information:
military <- tidy_military %>%
  # this overwrites the original "year" data
  mutate(year = week_lookup(raw_week_no)) %>%
  left_join(week_conversions,
            by = "year") %>%
  mutate(week = raw_week_no - week_start,
         date = ymd(paste0(year, "01-01")) + weeks(week),
         date = if_else(condition = raw_week_no == 0,
                        true = as.Date("1977/12/31", origin = "1970-01-01"),
                        false = date)) %>%
  select(-week_start,
         -week_end,
         -week,
         -raw_week_no)

military
  # use the select line at the end to get vars in order want
# need to work out how to do the date, also change raw weeks to the week in the given year
# could see if lubridate can do the calcs based on raw week no with start date in 1978 or can make a reference
# table with the first week no in the year (with count from 1978) to subtract from raw to get the week of the
# year then use lubridate to work out the date from the week of the year
# if want to do reference table method, may want to join with the category data? Or maybe better to just
# hardcode using numbers from the vallabels function

#************************************************************************************************************

