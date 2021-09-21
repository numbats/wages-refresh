## ---- sw_wages

sw <- brolgar::wages

sw_wages <- sw %>%
  ggplot(aes(x = xp,
             y = ln_wages)) +
  geom_line(aes(group = id),alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-4, 6)

## ---- do_refreshed

do <- yowie::wages_hs_do %>%
  mutate(exp = year-1979,
         lnwage = log(wage))

do_ref <- do %>%
  ggplot(aes(x = exp,
             y = lnwage)) +
  geom_line(aes(group = id), alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("B") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-4, 6)

sw_wages + do_ref

# the two plots are not comparable
# since the id who are in Singer-Willet and the id in do-refreshed migth be different


## --- compare-sw-do

sw_id <- as_tibble(sw) %>%
  group_by(id) %>%
  count() %>%
  dplyr::select(id)

do_id <- as_tibble(do) %>%
  group_by(id) %>%
  mutate(id = as.numeric(id)) %>%
  count() %>%
  dplyr::select(id)

# check common id in data set
sw_do <- inner_join(sw_id, do_id, by = "id")

# only have 94 id that agree upon each other
sw_agree <- filter(sw, id %in% sw_do$id)
do_agree <- filter(do, id %in% sw_do$id)

# plotting

sw_wages_agree <- sw_agree %>%
  ggplot(aes(x = xp,
             y = ln_wages)) +
  geom_line(aes(group = id),alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-3, 5)


do_ref_agree <- do_agree %>%
  ggplot(aes(x = exp,
             y = lnwage)) +
  geom_line(aes(group = id), alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("B") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-3, 5)


sw_wages_agree + do_ref_agree
# even though it already has the same id, it still has different period measured
# hence the following using the same period apprx.

## ---- compare-period

# filter the xp in refreshed data in order to get the same experience with Singer-Willet data,
# which is 13 years of experience

do_agree_cutxp <- do_agree %>%
  filter(exp <= 13)

# compare summary stat

#summary of singer-willet wages
summary(sw_agree$ln_wages)

#summary of refreshed-do wages
summary(do_agree_cutxp$lnwage)

# plotting

sw_wages_agree_exp <- sw_agree %>%
  ggplot(aes(x = xp,
             y = ln_wages)) +
  geom_line(aes(group = id),alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("A") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-1, 4.5)


do_ref_agree_cutxp <- do_agree_cutxp %>%
  ggplot(aes(x = exp,
             y = lnwage)) +
  geom_line(aes(group = id), alpha = 0.1) +
  geom_smooth(se = FALSE) +
  ggtitle("B") +
  theme_bw() +
  ylab("ln(Hourly wage) ($)") +
  xlab("Experience (years)") +
  theme(plot.title = element_text(size = 10)) +
  ylim(-1, 4.5)


sw_wages_agree_exp + do_ref_agree_cutxp

## ---- compare-id

# Takes some id and compare them



# Takeaways:







