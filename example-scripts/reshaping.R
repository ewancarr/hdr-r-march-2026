library(tidyverse)

relig_income |>
  pivot_longer(
    cols = -religion,
    names_to = "names",
    values_to = "count"
  )

relig_income |>
  pivot_longer(
    cols = `<$10k`:`>150k`,
    names_to = "names",
    values_to = "count"
  )


billboard |>
  pivot_longer(
    cols = wk1:wk76,
    names_to = "week",
    values_to = "position"
  ) |>
  mutate(
    week = parse_number(week)
  ) |>
  drop_na(position)


longer <- billboard |>
  pivot_longer(
    cols = wk1:wk76,
    names_to = "week",
    values_to = "position",
    values_drop_na = TRUE,
    names_transform = parse_number
  )

longer |>
  mutate(week = paste0("wk", week)) |>
  pivot_wider(
    names_from = week,
    values_from = position
  )

read_csv("data.csv", na = c("", "NA", "..", "Missing"), )

d <- data.frame(
  id = paste0("p", 1:26),
  value = sample(c("Present", "Missing"), 26, replace = TRUE)
)

d |>
  mutate(
    value_fixed = na_if(value, "Missing")
  )
