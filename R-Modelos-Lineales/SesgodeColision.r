## carga librería
library(stargazer)
library(tidyverse)

#Genera los datos
dfsc <-data.frame("female"=rbinom(10000,1,0.5),"ability"=rnorm(10000))
dfsc$discriminacion <- dfsc$female
dfsc$ocupacion <- 1 + dfsc$ability*2 + dfsc$female * 0 - dfsc$discriminacion*2  + rnorm(10000)
dfsc$wage <- 1 - dfsc$discriminacion+ dfsc$ocupacion + dfsc$ability  + rnorm(10000)

#Se ejecutan los modelos
modelo1 = lm(wage~female, data = dfsc)
summary(modelo1)
modelo2 = lm(wage~female+ ocupacion, data = dfsc)
modelo3 = lm(wage~female + ocupacion + ability, data = dfsc)
summary(modelo2)
summary(modelo3)
#se muestran todos los modelos para fácil comparación
stargazer (modelo1,modelo2, modelo3, type = "text")
