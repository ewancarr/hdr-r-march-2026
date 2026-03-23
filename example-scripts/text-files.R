library(data.table)
library(vroom)
# Loading text files quickly

set.seed(123)

n <- 5e6  # 5 million rows

dat <- tibble(
  id        = 1:n,
  group     = sample(LETTERS[1:10], n, replace = TRUE),
  x1        = rnorm(n),
  x2        = runif(n),
  x3        = sample(1:1000, n, replace = TRUE),
  flag      = sample(c(TRUE, FALSE), n, replace = TRUE),
  date      = sample(seq.Date(as.Date("2020-01-01"), as.Date("2024-12-31"), by = "day"),
                     n, replace = TRUE),
  text_code = sample(sprintf("code_%05d", 1:5000), n, replace = TRUE)
)

file <- tempfile(fileext = ".csv")

system.time({
  fwrite(dat, file)
})

file.info(file)$size / 1024^3 

library(bench)
library(data.table)
library(vroom)

bench::mark(
  read.table = read.table(file),
  read_delim = read_delim(file),
  fread = fread(file, showProgress = FALSE),
  vroom = vroom(file, delim = ",", show_col_types = FALSE, progress = FALSE),
  iterations = 5,
  check = FALSE
)[, c("expression", "min", "median", "itr/sec", "mem_alloc")]





