# remotes::install_github("njtierney/brolgar")
library(brolgar)
library(tidyverse)
library(gghighlight)
library(purrr)
library(broom)
library(tsibble)
load("wages_hs2020.rda")

# Maybe should be saved as a tsibble already?
wages_hs2020 <- as_tsibble(x = wages_hs2020,
                   key = id,
                   index = year,
                   regular = TRUE)

nmeas <- wages_hs2020 %>%
  as_tibble() %>%
  filter(!is.na(mean_hourly_wage)) %>%
  count(id)
nmeas %>% filter(n==27) %>% tally()
complete_cases <- nmeas %>% filter(n==27)
wages_hs2020_complete <- wages_hs2020 %>% filter(id %in% complete_cases$id)

# Plot a few
set.seed(20200413)
wages_hs2020 %>%
  sample_n_keys(size = 5) %>%
  ggplot(aes(x = year,
             y = mean_hourly_wage,
             group = id)) +
  geom_line()

# Clever facets
ggplot(wages_hs2020,
       aes(x = year,
           y = mean_hourly_wage,
           group = id)) +
  geom_line() +
  facet_sample()

# Features
wages_hs2020 %>%
  features(mean_hourly_wage,
           feat_five_num)
wages_hs2020 %>%
  features(mean_hourly_wage, feat_monotonic) %>%
  count(increase)

# Join features and plot
wages_mono <- wages_hs2020 %>%
  features(mean_hourly_wage, feat_monotonic)
wages_hs2020 %>% left_join(wages_mono, by = "id") %>%
  ggplot(aes(x = year,
             y = mean_hourly_wage,
             group = id)) +
  geom_line() +
  gghighlight(increase)

# Really want a better set of features
wages_slope <- wages_hs2020 %>%
  mutate(year0 = year -  1979) %>%
  as_tibble() %>%
  split(.$id) %>%
  map(~lm(mean_hourly_wage~year0, .x)) %>%
  map_dfr(~ coefficients(.)[2])
wages_slope <- tibble(id=as.numeric(names(unlist(wages_slope))), slope=unlist(wages_slope))

wages_slope %>% summary()
wages_slope %>% ggplot(aes(x=slope)) + geom_density()

# highest <- wages_slope %>% arrange(desc(slope)) %>% top_n(50)
keep_slopes <- wages_slope %>% filter(between(slope, -1, 1)) # 6017 to 5826
wages_hs2020 <- wages_hs2020 %>% filter(id %in% keep_slopes$id)
wages_hs2020 %>%
  ggplot() +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id), alpha=0.01)
# Some weird up and down patterns that look terribly suspicious
wages_hs2020_complete %>%
  ggplot() +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id), alpha=0.5)

wages_hs2020_complete %>%
  sample_n_keys(size = 5) %>%
  ggplot(aes(x = year,
             y = mean_hourly_wage,
             group = id)) +
  geom_line()

# Explore race
wages_hs2020_complete %>%
  ggplot() +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id)) +
  facet_wrap(~race) +
  geom_smooth(aes(x = year,
              y = mean_hourly_wage))

wages_hs2020_complete %>%
  ggplot() +
  geom_smooth(aes(x = year,
                  y = mean_hourly_wage, colour=race), se=FALSE)

# Explore gender
wages_hs2020_complete %>%
  ggplot() +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id)) +
  facet_wrap(~gender) +
  geom_smooth(aes(x = year,
                  y = mean_hourly_wage))

wages_hs2020_complete %>%
  ggplot() +
  geom_smooth(aes(x = year,
                  y = mean_hourly_wage, colour=gender), se=FALSE)

# education
wages_hs2020_complete %>% as_tibble() %>% count(hgc)
wages_hs2020_complete <- wages_hs2020_complete %>%
  mutate(hgc12 = ifelse(hgc == "12TH GRADE", "12", "less than 12"))

wages_hs2020_complete %>%
  ggplot() +
  geom_line(aes(x = year,
                y = mean_hourly_wage,
                group = id)) +
  facet_wrap(~hgc12) +
  geom_smooth(aes(x = year,
                  y = mean_hourly_wage))

wages_hs2020_complete %>%
  ggplot() +
  geom_smooth(aes(x = year,
                  y = mean_hourly_wage, colour=hgc12), se=FALSE)

save(wages_hs2020_complete, file="wages_hs2020_complete.rda")



