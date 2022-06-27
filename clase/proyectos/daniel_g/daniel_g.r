###################################################################
#######              PROYECTO DANIEL GARCÍA                 #######
################        MODELOS LINEALES       ####################
###################################################################

#### Librerías ####

library(tidyverse)

readr::read_csv("MAEA/Primer Semestre/Modelos lineales/R Modelos Lineales/student_data.csv")

#### Estdística descriptiva ####

# Creamos la variable promedio a partir
# de las calificaciones de tres períodos
# llamada meang 

df <- student_data %>%
  mutate(meang = (G1 + G2 + G3)/3)

str(df)
head(df)
summary(df$meang)

# La variable promedio sigue una 
# distribución normal (aparentemente)

hist(df$meang, main = "Histograma de promedio", xlab = "Promedio",
     ylab = "Frecuencia", col = "beige")

# Comparamos el promedio por sexo
# Sorpresa, los hombres tienen mejor
# promedio

boxplot(formula = meang ~ sex, data = df, 
        main = "Promedio por sexo", xlab = "Sexo",
        ylab = "Promedio", col = c("red", "blue")) 

# Comparamos el promedio por educación 
# de la madre, en 0 (sin educación) sólo
# hay tres observaciones (así que chiste)
# Pero en el nivel 4 (educación superior)
# se observa una mayor media, aunque 
# con gran dispersión

boxplot(formula = meang ~ Medu, data = df, 
        main = "Promedio por educación de la madre", xlab = "Educación",
        ylab = "Promedio", col = c("gray", "blue", "green", "yellow", "red"))

plot(x = df$Medu, y = df$meang,  
     pch = 19, main = "Promedio-Educación de la madre",
     xlab = "Educación", ylab = "Promedio")

# Comparamos el promedio por trabajo 
# de la madre, en health se observa una
# media más alta

boxplot(formula = meang ~ Mjob, data = df, 
        main = "Promedio por trabajo de la madre", xlab = "Trabajo",
        ylab = "Promedio", col = c("gray", "blue", "green", "yellow", "red"))

# Comparamos el promedio por tiempo de
# de estudio semanal, parece que los 
# que estudian más de 10 horas (4) 
# tienen mayor promedio

boxplot(formula = meang ~ studytime, data = df, 
        main = "Promedio por tiempo de estudio semanal", xlab = "Tiempo",
        ylab = "Promedio", col = c("blue", "green", "yellow", "red"))
     
# Comparamos el promedio por las materias
# reprobadas anteriormente, los más aplicados
# (0) tienen mayor promedio, aunque mayor dispersión

boxplot(formula = meang ~ failures, data = df, 
        main = "Promedio por materias reprobadas", xlab = "Materias reprobadas",
        ylab = "Promedio", col = c("blue", "green", "yellow", "red"))

# Comparamos el promedio por el apoyo escolar adicional
# parece que los que no reciben apoyo tienen 
# mayor promedio, quizá porque son muy capaces 
# y no requieren ayuda

boxplot(formula = meang ~ schoolsup, data = df, 
        main = "Promedio por apoyo escolar", xlab = "Apoyo",
        ylab = "Promedio", col = c("beige", "skyblue"))

# Igual al anterior, pero con apoyo familiar adicional

boxplot(formula = meang ~ famsup, data = df, 
        main = "Promedio por apoyo familiar", xlab = "Apoyo",
        ylab = "Promedio", col = c("beige", "skyblue"))

# Comparamos el promedio por el deseo de 
# ir a la universidad, parece que los más
# motivados obtienen mayor promedio

boxplot(formula = meang ~ higher, data = df, 
        main = "Promedio por deseo de ir a universidad", xlab = "Universidad",
        ylab = "Promedio", col = c("beige", "skyblue"))

# Comparamos el promedio por condición de
# relación amorosa, no se observa gran diferencia

boxplot(formula = meang ~ romantic, data = df, 
        main = "Promedio por condición de relación amorosa", xlab = "Condición",
        ylab = "Promedio", col = c("beige", "skyblue"))

# Comparamos el promedio por condición de 
# salir con amigos, parece que los que menos 
# salen (1 y 2) tienen mayor promedio

boxplot(formula = meang ~ goout, data = df, 
        main = "Promedio por condición de salir con amigos", xlab = "Condición",
        ylab = "Promedio", col = c("gray", "blue", "green", "yellow", "red"))

# Comparamos el promedio por condición de
# salud, parece que los que tienen peor salud
# (1) tienen mayor promedio, quizá encuentren
# refugio en los libros

boxplot(formula = meang ~ health, data = df, 
        main = "Promedio por condición de salud", xlab = "Salud",
        ylab = "Promedio", col = c("gray", "blue", "green", "yellow", "red"))

# Finalmente (ahora sí la útlima), comparamos
# los histogramas de frecuencia de las calificaciones
# de los tres períodos, parecen normales

par(mfrow = c(2,2))
hist(df$meang, main = "Histograma de promedio", xlab = "Promedio",
     ylab = "Frecuencia", col = "beige")
hist(df$G1, main = "Histograma de período 1", xlab = "Calificaciones",
     ylab = "Frecuencia", col = "red")
hist(df$G2, main = "Histograma de período 2", xlab = "Calificaciones",
     ylab = "Frecuencia", col = "blue")
hist(df$G3, main = "Histograma de período 3", xlab = "Calificaciones",
     ylab = "Frecuencia", col = "green")

par(mfrow = c(1,1))

#### Modelo ####

# Model1: Promedio de los 3 períodos explícado por el sexo
# la educación de la madre, el trabajo de la madre,
# tiempo de estudio semanal, materias reprobadas anteriormente,
# apoyo escolar, apoyo familiar, deseo de ir a la universidad,
# condición de relación romántica, condición de salir con sus amigos
# y condición de salud.

model1 <- lm(meang ~ sex + Medu + Mjob + studytime + 
               failures + schoolsup + famsup + higher + 
               romantic + goout + health, data = df)

# Media de los residuales = 0

summary(model1$residuals)

# Histograma de los residuales, aparentemente normal

hist(model1$residuals, main = "Residuales del Modelo", xlab = "Residuales",
     ylab = "Frecuencia", col = "beige")

# Suma de los residuales = 0

sum(model1$residuals)

# El sexo masculino y mayor educación de la madre 
# (menos significativa) están asociados promedios más altos

# Las variables de materias reprobadas, sí recibe 
# apoyo escolar, sí recibe apoyo familiar 
# (menos significativa) y mayor salida con amigos están 
# asociadas con promedios más bajos

# La condición de salud tiene relación negativa con 
# el promedio, aunque es poco significativa y
# el trabajo de la madre en salud y como maestra
# tienen relación positiva pero poco significativa

# Finalmente tiempo de estudio semanal tiene relación 
# positiva pero, menos significativa

summary(model1)

stargazer::stargazer(model1, type = "text")

# Supuesto de linealidad. Los residuaes se distribuyen
# alrededor de la línea horizontal, señal de que existe
# relación lineal

plot(model1,1)

# Supuesto de Normalidad de los residuales. Los residuales
# siguen la línea recta en su mayoría, se cumple el supuesto 

# En la prueba de normalidad de Shapiro, W es mayor a 0.7
# y el p-value 0.05427, por lo que al nivel de significancia
# de 0.05, no se rechaza la H0: los datos provienen de una
# distribución normal

plot(model1,2)

MASS::studres(model1) %>%
  shapiro.test()

# 3 Homocedasticidad de los residuales. Los residuales se
# distribuyen alrededor de la línea sin algún patrón 
# observable, por lo que se cumple el supuesto

# En la prueba Goldfeld, el p-value es mayor a 0.05, por
# lo que no se rechaza H0: Homocedasticidad presente 

plot(model1,3)

lmtest::gqtest(model1) # Que resultados arroja el test

lmtest::bptest(model1)

# 4 Valores atípicos, No se observan valores atípicos

plot(model1,4)

par(mfrow = c(2,2))
plot(model1)

par(mfrow = c(1,1))

# Autocorrelación. No fue posible hacer efectiva
# la prueba de autocorrelación debido a la 
# naturaleza de los datos (categóricos)

acf(student_data, lag.max = 100, plot = TRUE)
?acf

# Colinealidad. Solo con las variables númericas
# del modelo, se observa con mayor detalle 
# que la variable failures tiene relación negativa
# con el promedio

matrix_corr <- cor(df %>% select(meang, Medu, studytime,
                     failures, goout, health))

corrplot::corrplot(matrix_corr)

# Multicolinealidad. Educación y trabajo
# de la madre puede estar correlacionada 
# con otras variables por su valor más alto
# en la prueba

car::vif(model1)
?vif

#-----------------------------------------------------