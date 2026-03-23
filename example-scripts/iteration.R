
sqrt(c(2, 3, 5, 1))

lapply(c(2, 3, 5, 1), sqrt)

library(tidyverse)

x <- c(3, 1, 5, 2, 1)

map(x, sqrt)
map_dbl(x, sqrt)

function(x) {
  
}

x
map_int(x, \(i) {
  i + 2
  })
