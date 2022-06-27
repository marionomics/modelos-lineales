library(tidyverse)
library(stargazer)

set.seed(42)

# Creamos variable de género femenino
female <- rbinom(10000, 1, 0.5)

# Creamos variable aleatoria de habilidad
ability <- rnorm(10000)

# Las colocamos en un Data.frame
df <- data.frame(female, ability);df

# Creamos variables de discriminación, ocupación y salario para el modelo
df$discrimination = df$female
df$occupation = 1 + df$ability * 2 + df$female * 0 - df$discrimination * 2 + rnorm(10000)
df$wage = 1 - df$discrimination + df$occupation + df$ability + rnorm(10000)

head(df)

# Creamos modelos single y multi
modelo1 <- lm(wage ~ female, 
              data = df)

modelo2 = lm(wage ~ female + occupation, 
             data = df)

modelo3 = lm(wage ~ female + occupation + ability, 
             data = df)

# Resumen de modelos en Stargazer
stargazer(modelo1, modelo2, modelo3, type = "text")
