## ---- sw_wages

sw_wages <- brolgar::wages %>%
  ggplot(aes(x = xp,
             y = ln_wages,
             group = id)) +
  geom_line(alpha = 0.1) +
  geom_smooth(se = FALSE, color = "red") +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  theme(plot.title = element_text(size = 10))

sw_wages


## ---- do_refreshed

do_ref <- yowie::wages_hs_do %>%
  ggplot(aes(x = year-1979,
             y = log10(wage),
             group = id)) +
  geom_line(alpha = 0.1) +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  theme(plot.title = element_text(size = 10))

do_ref

