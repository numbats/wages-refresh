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

# singer-willet did not stated how they calculate experience
# in database, there is work experience topic
# (https://www.nlsinfo.org/content/cohorts/nlsy79/topical-guide/employment/work-experience)
# but there is no variable explicitly mention about experience.
# in this case, we approximate it with year-1979

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
# since the id who are in Singer-Willet and the id in do-refreshed might be different


## --- compare-sw-do

sw_id <- as_tibble(sw) %>%
  group_by(id) %>%
  count() %>%
  select(id)

do_id <- as_tibble(do) %>%
  group_by(id) %>%
  mutate(id = as.numeric(id)) %>%
  count() %>%
  select(id)

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

sw_wages_agree_exp <- sw_agree_xpedit %>%
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


# Takeaways:

# we don't know how exactly the criteria of drop out,
# resulted view agreements of id being dropped out in the two dataset.

# with the same id, the ln(wages) didn't agree each other, probably due to:

# we don't have experience variable in the original data base.
# we want to calculate it, but we don't know how Singer-Willet compute the experience
# we want to compare it just with year, Singer and Willet dont have year variable
# hence, it is hard to create key-index pair.


# for people who work show data example (book, research, ets), it is very important to disclose how the data derived from the initial source, to make the analysis reproducible, especially for longitudinal data because other researcher often want to compare with the recent data.
# in this case, in Singer-Willet textbook, it important to state how the experience variable derived from the database.
# In this EDA, we found that it is difficult to make apple to apple comparison (and refresh the data in general) cause we don't know how exactly they calculate the variable (even the wages)


# This is why in our paper, we show the practice of reproducible and responsible data cleaning work flow to make sure the data can be refreshed.
# Especially with longitudinal data from a survey that is still being held (so it will be refreshed from year to year).





