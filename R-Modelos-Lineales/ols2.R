library(tidyverse)

set.seed(42)

tabla <- tibble(x = 9*rnorm(10),
                    u = 36*rnorm(10),
                    y = 3 + 2*x + u,
                yhat = predict(lm(y~x)),
                uhat = residuals(lm(y~x)))
tabla
colSums(tabla)

tabla %>%
  mutate(xuhat = x * uhat) %>%
  mutate(yhatuhat = yhat * uhat) %>%
  colSums()


colSums(mutate(tabla, xuhat = x * uhat))
