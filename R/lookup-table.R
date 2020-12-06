library(tibble)
library(dplyr)
lookup_table <- tibble(year = rep(c(1978L:2020L),
                                  each = c(53L, 52L, 52L, 52L))) %>%
  mutate(week = 1L:n()) %>%
  add_row(year = 1977L,
          week = 0L) %>%
  arrange(week)

# ignore the warning message

lookup_list <- as.list(lookup_table) %>%
  purrr::transpose()

str(as.list(lookup_table))
lookup_list[[1]]$year

find_week <- function(week){
  # (to handle indexing issue)
  week <- week + 1
  lookup_list[[week]]$year
}

week_lookup <- function(week) {
  purrr::map_dbl(week, find_week)
}

week_lookup(0)
week_lookup(1)
week_lookup(100)
week_lookup(106)
week_lookup(107)
