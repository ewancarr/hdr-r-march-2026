# ggplot2 Practical
# Monday, Mar 23, 2026

library(tidyverse)

# 1. Load the tidyverse package and the starwars dataset.
data(starwars)

# 2. Create a scatterplot of mass (x-axis) against height (y-axis).
colnames(starwars)

starwars |>
  filter(is.na(mass) | is.na(height))

starwars |>
  drop_na(mass, height) |>
  ggplot() +
  aes(x = mass,
      y = height) +
  geom_point()

# 3. Remove the outlying point and redraw the plot.

starwars |>
  drop_na(mass, height) |>
  filter(mass < 1000) |>
  ggplot() +
  aes(x = mass,
      y = height) +
  geom_point()

# 4. Colour the points by homeworld.

starwars |>
  drop_na(mass, height) |>
  filter(mass < 1000) |>
  ggplot() +
  aes(x = mass,
      y = height,
      fill = homeworld) +
  geom_()

# 5. Add a line-of-best-fit.

starwars |>
  drop_na(mass, height) |>
  filter(mass < 1000) |>
  ggplot() +
  aes(x = mass,
      y = height
  ) +
  geom_point(aes(colour = homeworld)) +
  geom_smooth(method = "lm")

starwars |>
  filter(mass < 1000) |>
  ggplot() +
  aes(x = mass,
      fill = homeworld) +
  geom_histogram()


starwars |>
  filter(mass < 1000) |>
  ggplot() +
  aes(x = mass,
      colour = homeworld) +
  geom_histogram()

mtcars |>
  ggplot() +
  aes(x = wt, y = mpg) +
  geom_point(aes(color = factor(cyl))) +
  geom_smooth(method = "lm") +
  facet_wrap(~ am)


















