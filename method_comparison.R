library(tidyverse)
library(zoo)
library(rstatix)
library(robustlmm)
library(modelr)
library(patchwork)
library(MASS)
library(broom)




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


##### ROBUST LINEAR MODEL

keep_me <- wages_demog_hs %>% count(id) %>% filter(n >4)

wages_demog_hs <- wages_demog_hs %>%
  filter(id %in% keep_me$id)

by_id <- wages_demog_hs %>%
  dplyr::select(id, year, mean_hourly_wage) %>%
  group_by(id) %>%
  nest()


id_rlm <- by_id %>%
  mutate(model = map(.x = data,
                     .f = function(x){
                   rlm(mean_hourly_wage ~ year, data = x)
                     }))

id_aug <- id_rlm %>%
  mutate(augmented = map(model, broom::augment)) %>%
  unnest(augmented)

id_w <- id_rlm %>%
  mutate(w = map(.x = model,
                 .f = function(x){
                   x$w
                 })) %>%
  unnest(w) %>%
  dplyr::select(w)


id_aug_w <- cbind(id_aug, id_w) %>%
  dplyr::select(`id...1`,
                year,
                mean_hourly_wage,
                .fitted,
                .resid,
                .hat,
                .sigma,
                w) %>%
  rename(id = `id...1`)

wages_rlm_dat <- id_aug_w %>%
  mutate(wages_rlm_1 = ifelse(w != 1 & .fitted >= 0, .fitted,
                            mean_hourly_wage),
         wages_rlm_2 = ifelse(w < 0.7 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_3 = ifelse(w < 0.5 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_4 = ifelse(w < 0.3 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_5 = ifelse(w < 0.1 & .fitted >= 0, .fitted,
                              mean_hourly_wage),
         wages_rlm_6 = ifelse(w < 0.12 & .fitted >= 0, .fitted,
                              mean_hourly_wage)) %>%
  mutate(is_pred1 = ifelse(w != 1 & .fitted >= 0, TRUE,
                          FALSE),
         is_pred2 = ifelse(w < 0.7 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred3 = ifelse(w < 0.5 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred4 = ifelse(w < 0.3 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred5 = ifelse(w < 0.1 & .fitted >= 0, TRUE,
                           FALSE),
         is_pred6 = ifelse(w < 0.12 & .fitted >= 0, TRUE,
                           FALSE)) %>%
  rename(wages_original = mean_hourly_wage)





wages_compare <- wages_rlm_dat %>%
  dplyr::select(id, year, wages_original, wages_rlm_1,
                wages_rlm_2,
                wages_rlm_3,
                wages_rlm_4,
                wages_rlm_5,
                wages_rlm_6) %>%
  pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")


ggplot(filter(wages_compare, type == "wages_rlm_6")) +
  geom_line(aes(x = year,
                y = wages,
                group = id),
            alpha = 0.1)





set.seed(31251587)

sample_id <- sample(unique(wages_compare$id), 20)
sample <- subset(wages_compare, id %in% sample_id)


# plot all of the thresholds
ggplot(sample) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y")


# plot by threshold

for_plot <- dplyr::filter(sample, type %in% c("wages_original", "wages_rlm_6"))

w05 <- ggplot(for_plot) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  geom_point(aes(x = year,
                 y = wages,
                 colour = type),
             alpha = 0.5,
             size = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y")

w05


## INSPECT OBS WITH PREDICTED VALUE (THRESHOLD < 0.1)
wages_rlm_zero_pone <- wages_rlm_dat %>%
  dplyr::select(id, year, wages_original, w, wages_rlm_6, is_pred6)

sum_id <- wages_rlm_zero_pone %>%
  group_by(id) %>%
  summarise(n_obs = length(id))

sum_pred <- wages_rlm_zero_pone %>%
  filter(is_pred6 == TRUE) %>%
  group_by(id) %>%
  summarise(n_pred = length(id))


summarize_pred <- left_join(sum_pred, sum_id, by = "id") %>%
  mutate(perc_pred = (n_pred/n_obs)*100) %>%
  arrange(perc_pred, decrease = TRUE)


sum_pred_filtered <- summarize_pred %>%
  filter(perc_pred > 10)


sum_pred_filtered2 <- wages_compare %>%
  filter(id %in% sum_pred_filtered$id)



ggplot(filter(sum_pred_filtered2, type %in% c("wages_original", "wages_rlm_6"))) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  geom_point(aes(x = year,
                 y = wages,
                 colour = type),
             alpha = 0.5,
             size = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y")


## INSPECT OBS WITH PREDICTED VALUE (THRESHOLD < 0.15)
wages_rlm_zero_ponefive <- wages_rlm_dat %>%
  dplyr::select(id, year, wages_original, w, wages_rlm_6, is_pred6)

sum_id2 <- wages_rlm_zero_ponefive %>%
  group_by(id) %>%
  summarise(n_obs = length(id))

sum_pred2 <- wages_rlm_zero_ponefive %>%
  filter(is_pred6 == TRUE) %>%
  group_by(id) %>%
  summarise(n_pred = length(id))


summarize_pred2 <- left_join(sum_pred2, sum_id2, by = "id") %>%
  mutate(perc_pred = (n_pred/n_obs)*100) %>%
  arrange(perc_pred, decrease = TRUE) %>%
  dplyr::select(id, n_pred, perc_pred)


sum_pred_filtered3 <- summarize_pred2 %>%
  filter(perc_pred > 10)

sum_pred_filtered4 <- wages_compare %>%
  filter(id %in% sum_pred_filtered3$id)



ggplot(filter(sum_pred_filtered4, type %in% c("wages_rlm_5") & id == 4495)) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  geom_point(aes(x = year,
                 y = wages,
                 colour = type),
             alpha = 0.5,
             size = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y")



## CHECK WAGES MORE THAN US$ 150

id_more_than_150 <- wages_rlm_zero_pone %>%
  filter(wages_rlm_6 > 150)



wages_more_than_150 <- wages_compare %>%
  filter(id %in% id_more_than_150$id)


ggplot(filter(wages_more_than_150, type %in% c("wages_original", "wages_rlm_5"))) +
  geom_line(aes(x = year,
                y = wages,
                colour = type,
                linetype = type),
            alpha = 1) +
  geom_point(aes(x = year,
                 y = wages,
                 colour = type),
             alpha = 0.5,
             size = 1) +
  theme(axis.text.x = element_text(angle = 10, size = 5),
        legend.position = "bottom") +
  facet_wrap(~id, scales = "free_y")


summary(wages_rlm_dat$wages_rlm_5)
summary(wages_rlm_dat$wages_rlm_6)

