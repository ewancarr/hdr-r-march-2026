# Mini project
# Monday, Mar 23, 2026

library(tidyverse)
library(here)
library(janitor)
library(readxl)

read_xls(here("data", "hospital-admissions-rates-borough.xls"),
         sheet = "2014-15")

read_xlsx(here("data", "Population_exceeding_LAEI2016.xlsx"))


install.packages("janitor")

# \\Network\data

setwd("...")

here::i_am("\\\\Network\\data")

?read_xls

pak::pak("readxl")
install.packages("readxl")

# xls
# xlsx
# read_xlsx
# read_xls

data |>
  mutate(code = na_if(code, "")) |>
  drop_na(code)

mtcars |>
  slice_head(n = -1)

mtcars[-1, ]

# START OF PRACTICAL SOLUTIONS #


# Q1.1

ha <- read_xls(here("data", "hospital-admissions-rates-borough.xls"),
  sheet = "2014-15"
) |>
  clean_names() |>
  select(code,
    borough = area,
    ha_rate = indirectly_age_and_sex_standardised_rate_per_100_000
  )

pm25 <- read_xlsx(here("data", "Population_exceeding_LAEI2016.xlsx"),
  sheet = "Population_Weighted_Avg_PM2.5",
  range = "A7:B39",
  col_names = c("borough", "pm25")
)

no2 <- read_xlsx(
  here("data", "Population_exceeding_LAEI2016.xlsx"),
  "Population_exceeding_NO2",
  range = "A6:C39"
) |>
  clean_names() |>
  select(borough, no2 = laei_2016)


# Q1.2

ignore <- c(
  "Inner London",
  "Outer London",
  "North East",
  "North West",
  "Yorkshire and the Humber",
  "East Midlands",
  "West Midlands",
  "East of England",
  "London",
  "South East",
  "South West",
  "England"
)

ha <- ha |>
  drop_na(code, borough) |>
  filter(!(borough %in% ignore)) |>
  select(-code)

pm25 <- pm25 |>
  mutate(
    borough = str_replace(borough, "Upon", "upon"),
    borough = str_replace(borough, "Of", "of")
  )

no2 <- no2 |>
  mutate(
    borough = str_replace(borough, "&", "and")
  )

# Q1.3

ha |>
  full_join(pm25, by = join_by(borough)) |>
  full_join(no2, by = join_by(borough))














































