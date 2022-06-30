#Se pretende crear un modelo que pueda predecir el costo de gastos médicos en base a las variables listadas


##Se cargan librerías
library(ggplot2)
library(foreign)
library(tidyverse)
library(lmtest)
library(caTools)
library(dplyr)
library(corrplot)


setwd("~/Desktop/Maestria/1er semestre/Modelos lineales/Proyecto/Proyecto final")

##Se carga el dataset y se le coloca de nombre data_frame
dframe <- read_csv("insurance.csv")

## Se obtiene un head de la base de datos
head(dframe)


## gráfico de barras de genero 
barplot(table(dframe$sex), ylim = c(0,700), col = c("pink", "lightblue"), 
        main = "Barplot of gender", ylab = "Frequency", xlab = "Gender")

#Se puede observar una frecuencia similar entre los dos generos

## Frecuencia absoluta del genero
table(dframe$sex)

## Frecuencia relativa del genero
round(prop.table(table(dframe$sex))*100, 1)

## Se hacen dataframes separados por sexo

dfmale <- dframe[dframe$sex== "male", ]
dffemale <- dframe[dframe$sex == "female", ]

## Se hace histograma de charges en base al sexo

par(mfrow = c(2,2))
hist(dfmale$charges,main = "Histogram of male charges")
hist(dffemale$charges, main = "Histogram of female charges")
plot(dffemale$charges, main = "Plot of male charges")
plot(dfmale$charges,  main = "Plot of male charges")

#Podemos observar una distribución similar de los datos de la variable charges en relación al genero

## Hacemos un summary de la variable charges y sacamos desviación estandar
summary(dframe$charges)
sd(dframe$charges)

## Hacemos un histograma de la variable charges
hist(x = dframe$charges, main = "Histogram of charges", xlab = "Charges", ylab = "Frequency")


#Podemos ver que la variable charges no sigue una distribución normal



## Se crea variable dicotómica del genero gender.dic donde male = 1, female = 0

dframe$gender.dic <- if_else(dframe$sex == "male", 1, 0)


## se crea variable dicotómica de fumador smoker.dic donde yes = 1, no = 0 
dframe$smoker.dic <- ifelse(dframe$smoker == "yes", 1, 0)

## Se crea variable dummy de las regiones de las personas
dframe$region.dum <- as.numeric(factor(x = dframe$region, labels = c("1","2","3","4")))


## se hacen pruebas de correlación
corr_matrx <- cor(dframe %>% 
                    select(age, gender.dic, bmi, smoker.dic, region.dum))

corrplot(corr_matrx)


## Dividimos el dframe en conjunto de entrenamiento y test

split <- sample.split(Y = dframe$age, SplitRatio = .8)
dframe_training <- subset(x = dframe, subset = split == T)
dframe_testing <- subset(x = dframe, subset = split == F)



## Se crea modelo de regresión con las variables del dframe_training
model1 <- lm(charges ~ age + gender.dic + bmi + children + smoker.dic
             + region.dum, data = dframe_training)

summary(model1)

## utilizamos método AKAIKE para encontrar el mejor modelo 
step(model1, direction = "both")

## Según el método AKAIKE, el mejor modelo es el siguiente

model1 <- lm(formula = charges ~ age + bmi + children + smoker.dic + region.dum, 
             data = dframe_training)

summary(model1)

## Se grafican residuales del modelo para verificar homocedasticidad y normalidad en los residuales
par(mfrow = c(2,2))
plot(model1)



par(mfrow = c(1,1))
hist(model1$residuals, main = "Histogram of residuals")


#Se puede observar que los residuales no siguen el supuesto de linealidad al igual que 
#a primera vista, los residuales no siguen una distribución normal, así que se procede a aplicar shapiro.test para confirmar normalidad.


shapiro.test(model1$residuals)

gqtest(model1)
#Tenemos un p-value <.05 con esto, tenemos evidencia suficiente para rechazar la hipotesis nula, que indica que los residuales siguen una distribución normal. Adicional a esto, la prueba Goldfeld–Quandt arroja que hay homocedasticidad en el modelo.


## Se hacen predicciones usando el conjunto de testing
predictions_model <- as.data.frame(predict(model1, dframe_testing))

## Se hace un data.frame con las predicciones y los datos reales del conjunto
## de testing
versus <- data_frame(predictions_model, dframe_testing$charges)

colnames(versus) <- c("Predictions_charges", "Testing_charges")
head(versus)

## Se grafican ambos datos, las predicciones y los datos del conjunto de testing
plot(versus$Predictions_charges, versus$Testing_charges, col = c("red", "blue"), 
     main = "Predictions vs training", xlab = "Predictions", ylab = "Training")

par(mfrow = c(1,2))
plot(versus$Predictions_charges, main = "Predictions")
plot(versus$Testing_charges, main = "Training")

par(mfrow = c(1,2))
boxplot(versus$Predictions_charges)
boxplot(versus$Testing_charges)



#Se puede observar que el comportamiento de las predicciones y los datos reales del conjunto de testing son muy similares, sin embargo la prueba de normalidad de los residuales indica que el modelo no es ideal para poder hacer predicciones, a pesar de que los datos sean similares entre ambos conjuntos de datos (predicción y testing).