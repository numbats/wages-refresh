## ---- nobs-plot
wages_obs <- yowie::wages %>%
  features(wage, n_obs) %>%
  arrange(n_obs)

wages_obs_p <- ggplot(wages_obs, aes(x = n_obs)) +
  geom_bar() +
  xlab("number of observations") +
  theme_bw() +
  ggtitle("A)")

## ---- slope
wages <- yowie::wages %>%
  mutate(year0 = year - 1979,
         ln_wages = log(wage))

wages_slope <- key_slope(wages, ln_wages ~ year0) %>%
  left_join(yowie::demog_nlsy79, by = "id") %>%
  mutate(hgc_regroup = fct_collapse(hgc, `ungraded` = "UNGRADED",
                                    `8TH grade or less` = c("1ST GRADE", "3RD GRADE",
                                                            "4TH GRADE", "5TH GRADE",
                                                            "6TH GRADE", "7TH GRADE",
                                                            "8TH GRADE"),
                                    `9TH to 11TH grade` = c("9TH GRADE",
                                                            "10TH GRADE",
                                                            "11TH GRADE"),
                                    `12TH grade` = "12TH GRADE")) %>%
  mutate(hgc_regroup = factor(hgc_regroup, levels = c("UNGRADED",
                                                      "8TH grade or less",
                                                      "9TH to 11TH grade",
                                                      "12TH grade")))
## ---- slope-nobs
wages_obs_slope <- left_join(wages_obs, wages_slope, by = "id")
wages_obs_slop_p <- ggplot(wages_obs_slope, aes(x = n_obs, y = .slope_year0)) +
  geom_point() +
  geom_jitter() +
  xlab("number of observations") +
  ylab("slope") +
  theme_bw() +
  ggtitle("B)")

## ---- slope-nobs-plot
wages_obs_p + wages_obs_slop_p

## ---- trim-slope
slope_trimmed <- wages_obs_slope %>%
  filter(n_obs >= 10)

## ---- slope-gender
slope_bottom_5<- slope_trimmed %>%
  arrange(.slope_year0) %>%
  slice_head(n = 5) %>%
  arrange(desc(.slope_year0)) %>%
  mutate(note = "bottom 5") %>%
  mutate(rank = seq_along(1:5))

slope_top_5<- slope_trimmed %>%
  arrange(desc(.slope_year0))%>%
  slice_head(n = 5) %>%
  mutate(note = "top 5") %>%
  mutate(rank = seq_along(1:5))

keep_contrast <- rbind(slope_bottom_5, slope_top_5) %>%
  dplyr::select(.slope_year0, id, note, rank, hgc_regroup)

contrast_slope <- left_join(keep_contrast, wages, by = "id") %>%
  arrange(.slope_year0) %>%
  mutate(note = factor(note, levels = c("top 5", "bottom 5")))

ggplot(contrast_slope, aes(x = year, y = ln_wages, color = gender)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(note ~ rank) +
  scale_color_manual(values = c("#04B4AE", "#BF00FF")) +
  ylab("ln(wages)") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 25),
        legend.position = "bottom")

## ---- gap-gender
wages_gender <- as.tibble(wages) %>%
  left_join(wages_obs, by = "id") %>%
  filter(n_obs >= 10) %>%
  group_by(gender, year) %>%
  summarise(mean = mean(wage),
            median = median(wage),
            sd = sd(wage),
            samplesize = n()) %>%
  ungroup() %>%
  mutate(upper = mean + sd/sqrt(samplesize),
         lower = mean - sd/sqrt(samplesize))

# number of observations by gender
nobs_gender <- ggplot(wages_gender, aes(fill=gender, y=samplesize, x=year)) +
  geom_bar(position="dodge", stat="identity") +
  theme(legend.position = "bottom") +
  ylab("number of observations") +
  scale_fill_manual(values = c("#088A68", "#DF7401")) +
  ggtitle("A)")

# wages by gender
wage_female <- wages_gender %>%
  filter(gender == "FEMALE") %>%
  dplyr::select(year, median) %>%
  rename(female = median)

wage_male <- wages_gender %>%
  filter(gender == "MALE") %>%
  dplyr::select(median) %>%
  rename(male = median)

gender_wage_gap <- cbind(wage_female, wage_male) %>%
  mutate(gap = (male-female)/male) %>%
  mutate(relative = 1-gap)

gender_gap_plot <- ggplot(gender_wage_gap) +
  geom_line(aes(x = year,
                y = relative),
            color = "#DF7401", size = 0.8) +
  geom_point(aes(x = year,
                 y = relative),
             color = "#DF7401", size = 2) +
  geom_hline(yintercept = 1, colour = "#088A68", size = 1) +
  #scale_x_continuous(limits = c(1978.7,2018.3), expand = c(0, 0)) +
  ylab("females' median wages relative to males (US$)") +
  annotate("text", x = 2010, y = 1, size = 3, label = "$1 of male wages", vjust = 1.4) +
  annotate("text", x = 2005, y = 0.81, size = 3, label = "female wages relative to male", vjust = 1) +
  ggtitle("B)")

nobs_gender + gender_gap_plot

## ---- slope-educ
ggplot(contrast_slope, aes(x = year, y = ln_wages, color = hgc_regroup)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(note ~ rank) +
  ylab("ln(wages)") +
  labs(color = "education") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 25),
        legend.position = "bottom")
