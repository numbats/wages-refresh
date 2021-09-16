library(tidyverse)
library(brolgar)
library(modelr)
library(lme4)

# read data
wages <- yowie::wages %>%
  mutate(year0 = year - 1979,
         ln_wages = log(wage)) %>%
  mutate(hgc_regroup = fct_collapse(hgc, `ungraded` = "UNGRADED",
                                    `8TH grade or less` = c("1ST GRADE", "3RD GRADE",
                                                            "4TH GRADE", "5TH GRADE",
                                                            "6TH GRADE", "7TH GRADE",
                                                            "8TH GRADE"),
                                    `9TH to 11TH grade` = c("9TH GRADE",
                                                            "10TH GRADE",
                                                            "11TH GRADE"),
                                    `12TH grade` = "12TH GRADE"))

# calculate slope
wages_slope <- key_slope(wages, ln_wages ~ year0) %>%
  left_join(yowie::demog_nlsy79, by = "id")


# build linear-mixed model
wages_fit <- lmer(
  ln_wages ~ year0 +  (1|id) + (year0-1|id),
  data = as_tibble(wages)
)

wages_fit_aug<- wages %>%
  add_predictions(wages_fit, var = "pred") %>%
  add_residuals(wages_fit, var = "resid")

slope_bottom_12 <- wages_slope %>%
  dplyr::select(id, .slope_year0) %>%
  arrange(.slope_year0) %>%
  slice_head(n = 12)

wages_fit_aug2 <- wages_fit_aug %>%
  filter(id %in% slope_bottom_12$id)

ggplot(wages_fit_aug2, aes(x = year,
                           y = pred,
                           group = id,
                           colour = factor(id))) +
  geom_line() +
  geom_point(aes(x = year,
                 y = ln_wages,
                 colour = factor(id))) +
  facet_wrap(~id) +
  theme(legend.position = "none")
