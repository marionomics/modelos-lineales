library(tidyverse)


ml <- lapply(
  1:1000,
  function(x) tibble(
    x = 9*rnorm(10000),
    u = 36*rnorm(10000),
    y = 3 + 2*x + u) %>%
    lm(y~x,.)
)


as_tibble(t(sapply(ml, coef))) %>%
  summary()

as_tibble(t(sapply(ml, coef))) %>%
  ggplot()+
  geom_histogram(aes(x), binwidth = 0.01)
