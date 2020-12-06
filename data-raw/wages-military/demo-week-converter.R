library(tidyverse)
library(lubridate)
library(purrr)
week_convert <- tibble(week_start = c(1, 54, 106, 158, 210),
                       week_end = c(53, 105, 157, 209, 261),
                       year = 1978:1982)

week_convert

week_data <- tibble(week_raw = sample(x = 1:261,
                                      size = 7,
                                      replace = FALSE))

week_data
week_convert

# solution from Miles McBain
week_converter_map <- function(week){

    map2_lgl(.x = week_convert$week_start,
             .y = week_convert$week_end,
             .f = ~ between(x = week,
                            left = .x ,
                            right = .y)) %>%
      keep(week_convert$year, .)
}

week_converter_map(1)
week_converter_map(53)
week_converter_map(54)

vec_week_converter_map <- function(week){
    map_int(.x = week, .f = week_converter_map)
}

vec_week_converter_map(1:2)

week_data %>%
  mutate(year = vec_week_converter_map(week_raw))

week_converter_base <- function(week){
  week_convert[which.max(week_convert$week_end > week), ]$year
}

week_converter_base(54)
week_converter_base(200)
week_converter_map(200)

