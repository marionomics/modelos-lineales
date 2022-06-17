#####un proyecto simple que permite ver lo efecto y la espectativas de trabajar en lo niveles de gobierno

library(foreign) 
setwd("D:/Modlin")   ###aqui va la carpeta 
df<-read.csv("gobierno.csv")
library(dplyr)
library(skimr)
skim(df)

install.packages("ggcorrplot")
library(ggcorrplot)

library(devtools)
library ()

corr_selected <- df %>% 
  select(tno_cve, sexo, sueldo_issste, antig) %>% 
  cor(use = "pairwise") %>% 
  round(1)

ggcorrplot(corr_selected, type = "lower", lab = T, show.legend = F)

round(cor(df[c(1,3,4,5)]),2)


##El objetivo es encontrar la mejor forma de modelar a traves de la tranformacion de
##nuestro valor dependiente que en este caso es la variable continua salario

head(df)
####primero converitmo el salario mensual a salario diario
boxplot(df$sueldo_issste~df$antig, main="BoxPlot Antiguedad")
df$sdia<-df$sueldo_issste/30
summary(df$sdia)


library(ggplot2)
porcentajes <- as.numeric(round(((prop.table(table(df$sexo)))*100),2))
porcentajes
pie(porcentajes, c("Hombres", "Mujeres"),
    main = "Proporcion de la data respecto al sexo")

hist(df$antig, main="funcionarios por antiguedad")
table (df$nombramiento)

ggplot(df, aes(x=antig, y=sdia)) + 
  geom_point()

hist(df$sdia, main="frecuencia de funcionarios segun salario")

modelo <- lm(sdia ~ antig,
              data = df)

summary(modelo)

modelo <- lm(sdia ~ sexo,
             data = df)

summary(modelo)

modelo <- lm(sdia ~ nombramiento,
             data = df)

summary(modelo)

df$ldia<-log(df$sdia)
hist(df$ldia)
summary(df$sdia)
summary(df$ldia)

modelolant <- lm(ldia ~ antig,
             data = df)

summary(modelolant)

modelolsexo <- lm(ldia ~ sexo,
             data = df)

summary(modelolsexo)

modelolnom <- lm(ldia ~ nombramiento,
             data = df)

summary(modelolnom)

ggplot(df, aes(x=antig, y=sdia)) + 
  geom_point()

df$p1<-265.08276 + (3.48974*(df$antig))
df$p2<-exp(5.4693225 + (0.0070209*df$anti))
head(df)
c1<-sum(((df$sdia-df$p1)/100)^2)
summary(c1)
c2<-sum(((df$sdia-df$p2)/100)^2)
summary(c2)

sum(df$p2)

modelo_as<-lm(ldia ~ antig+sexo,
                 data = df)
modelo_largo<-lm(ldia ~ antig+sexo+nombramiento,
                 data = df)
summary(modelo_largo)

anova(modelo_as, modelo_largo)
anova(modelolant, modelo_largo )

library (stargazer)
stargazer(modelolant, modelo_as, modelo_largo,type = "text")


plot(modelo_largo)
