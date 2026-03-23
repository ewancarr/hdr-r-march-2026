# Purrr example

library(tidyverse)
library(broom)
library(tinytable)

tidy(lm(flipper_len ~ body_mass, data = penguins))

fit_a_model <- function(the_data, ...) {
  lm(flipper_len ~ body_mass, data = the_data) |>
    tidy(conf.int = TRUE) |>
    filter(term == "body_mass")
}

tbl <- penguins |>
  group_split(species) |>
  map(fit_a_model) |>
  list_rbind()

tbl$species <- unique(penguins$species)

tbl |>
  select(species, 
         estimate,
         low = conf.low,
         high = conf.high) |>
  tt() |>
  format_tt(digits = 1)
