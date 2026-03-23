# Data manipulation
# Monday, Mar 9, 2026

library(tidyverse)
library(conflicted)
conflicts_prefer(
  dplyr::filter,
  dplyr::across
)

data(starwars)
head(starwars)
nrow(starwars)
ncol(starwars)
colnames(starwars)
View(starwars)

big_messy_dataset <- read_csv(...)

# Section 1. Descriptives

big_messy_dataset |>
  select(...)

reg_data <- big_messy_dataset |>
  select

d1 <- starwars |>
  select(birth_year, homeworld)

d2 <- starwars |>
  select(hair_color)

d3 <- starwars |>
  select(films, mass)

d <- list(d1, d2, d3)
saveRDS(d, file = "clean.rds")

## Then later...

d <- readRDS("clean.rds")

mini_data

starwars |>
  select(starts_with("h"), ends_with("e"))

select(starwars, birth_year, homeworld)

starwars |>
  select(yob = birth_year, homeworld)

starwars |>
  rename(yob = birth_year)

starwars |>
  filter(mass > 100)

starwars |>
  arrange(name)


# From the starwars data frame:

# 1. Select the columns height, mass,
# gender, and species.

starwars |>
  select(height, mass, gender, species)

# 2. Filter to select rows with height less
# than 191 and with species equal to "Human"

starwars |>
  select(height, mass, gender, species) |>
  filter(
    height < 191,
    species == "Human"
  )

# 3. Sort the result by height.

starwars |>
  select(height, mass, gender, species) |>
  filter(
    height < 191,
    species == "Human"
  ) |>
  arrange(height) |>
  glimpse()


my_data <-
  data.frame(x = 1:5, y = letters[1:5])


my_data$new_col <- "Word"

my_data$new_col <- "A different word"

my_data$x2 <- my_data$x * 20

my_data |>
  mutate(x3 = x2 / 5, x4 = x3 * 2)

mtcars

mtcars$heavy <- mtcars$wt > 3

mtcars |>
  select(wt, heavy)

mtcars <- mtcars |>
  mutate(heavy = wt > 3)

table(mtcars$heavy)

mtcars |>
  mutate(heavy = wt > 3) |>
  count(heavy)

a <- starwars[, 2:4]
b <- starwars[, 9]

bind_cols(a, b)

a <- starwars[1:10, ]
b <- starwars[50:60, ]

bind_rows(a, b)


left_join(dataset_a, dataset_b)


band_members
band_instruments

inner_join(
  band_members,
  band_instruments,
  by = join_by(name)
)

band_members |>
  inner_join(band_instruments)


left_join(
  band_members,
  band_instruments,
  by = join_by(name)
)

right_join(
  band_members,
  band_instruments,
  by = join_by(name)
)

full_join(
  band_members,
  band_instruments,
  by = join_by(name, id, other_key)
)

band_members <-
  band_members |> rename(person = name)


band_members <-
  band_members |>
  full_join(band_instruments, by = join_by(person == name))
