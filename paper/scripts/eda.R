## ---- sw_wages

sw <- brolgar::wages %>%
  mutate(id = as.factor(id))

sw_wages <- sw %>%
  ggplot(aes(x = xp,
             y = ln_wages,
             group = id)) +
  geom_line(alpha = 0.1) +
  geom_smooth(se = FALSE, color = "red") +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10))

## ---- do_refreshed

do <- yowie::wages_hs_do

do_ref <- do %>%
  ggplot(aes(x = year-1979,
             y = log10(wage),
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("B") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)")
  theme(plot.title = element_text(size = 10))


## --- compare-sw-do

sw_nid <- length(key_rows(sw))
do_nid <- length(key_rows(do))

sw_tib <- as_tibble(sw)
do_tib <- as_tibble(do)
unique(sw$id)


# check common id in data set






