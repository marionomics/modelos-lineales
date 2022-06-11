# Assumption testing script
# Mario A. Garcia Meza
# June 2022

# Libraries
library(dplyr)

# The model
str(mtcars)
model <- lm(mpg ~ wt + disp + qsec, data = mtcars)
summary(model)

par(mfrow = c(2,2))

plot(model)



hacer_grafica <- function(grafico, name_of_file){
    grafico
    png(filename = gsub(" ", "", paste("R-Modelos-Lineales/assumption_tests/img/",name_of_file,".png")))
    file.show(gsub(" ", "", paste("R-Modelos-Lineales/assumption_tests/img/",name_of_file,".png")))
    dev.off()
}
# -----------------------------------

hacer_grafica(modelo = model, "plot2", 1)

(plot(model$fitted.values,
    model$model$mgp)) %>%
    hacer_grafica("plot2")

# Normalidad en los residuales
hist(model$residuals)
plot(model, 2)
MASS::studres(model) %>%
    shapiro.test()

# Prueba de Heterocedasticidad

plot(model, 3)

lmtest::gqtest(model)
lmtest::gqtest(model, 
            order.by = ~disp + hp,
                data = mtcars)


# Breusch-Pagan

lmtest::bptest(model)

# Autocorrelacion 

acf(mtcars, lag.max = 15, plot = TRUE)

# Colinealidad
head(mtcars)
matriz_corr <- cor(mtcars %>%
    select(mpg, wt, qsec, disp))

corrplot::corrplot(matriz_corr)


# Multicolinealidad
car::vif(model)
# Si alguna de estas sale demasiado alta, podria haber