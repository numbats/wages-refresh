library(magrittr)
create_week_conversions <- function(){

week_conversion_raw <- tibble::tibble(
  week_var_raw = c(
    "0: Week Prior to 1/1/1978",
    "1 TO 53: Week Number in 1978",
    "54 TO 105: Week Number in 1979",
    "106 TO 157: Week Number in 1980",
    "158 TO 209: Week Number in 1981",
    "210 TO 261: Week Number in 1982",
    "262 TO 313: Week Number in 1983",
    "314 TO 366: Week Number in 1984",
    "367 TO 418: Week Number in 1985",
    "419 TO 470: Week Number in 1986",
    "471 TO 522: Week Number in 1987",
    "523 TO 574: Week Number in 1988",
    "575 TO 627: Week Number in 1989",
    "628 TO 679: Week Number in 1990",
    "680 TO 731: Week Number in 1991",
    "732 TO 783: Week Number in 1992",
    "784 TO 835: Week Number in 1993",
    "836 TO 887: Week Number in 1994",
    "888 TO 940: Week Number in 1995",
    "941 TO 992: Week Number in 1996",
    "993 TO 1044: Week Number in 1997",
    "1045 TO 1096: Week Number in 1998",
    "1097 TO 1148: Week Number in 1999",
    "1149 TO 1201: Week Number in 2000",
    "1202 TO 1253: Week Number in 2001",
    "1254 TO 1305: Week Number in 2002",
    "1306 TO 1357: Week number in 2003",
    "1358 TO 1409: Week number in 2004",
    "1410 TO 1461: Week number in 2005",
    "1462 TO 1514: Week number in 2006",
    "1515 TO 1566: Week number in 2007",
    "1567 TO 1618: Week number in 2008",
    "1619 TO 1670: Week number in 2009",
    "1671 TO 1722: Week number in 2010",
    "1723 TO 1775: Week number in 2011",
    "1776 TO 1827: Week number in 2012",
    "1828 TO 1879: Week number in 2013",
    "1880 TO 1931: Week number in 2014",
    "1932 TO 1983: Week number in 2015",
    "1984 TO 2035: Week number in 2016",
    "2036 TO 2088: Week number in 2017"
  )
)

week_conversions <-
week_conversion_raw %>%
  # separate into a week range and a year
  tidyr::separate(col = "week_var_raw",
           into = c("range", "year"),
           sep = ":") %>%
  # separate the range into start and end
  # this produces a
  tidyr::separate(col = "range",
           into = c("week_start", "week_end"),
           sep = " TO ") %>%
  dplyr::mutate(year = dplyr::case_when(
    week_start == "0" ~ "1978",
    # leave as is
    week_start != "0" ~ year
  )) %>%
  dplyr::mutate(year = as.integer(readr::parse_number(year)),
         week_start = readr::parse_integer(week_start),
         week_end = readr::parse_integer(week_end))

return(week_conversions)
}
