set.seed(42)
diccionario <- data.frame(
  "female" = rbinom(10000,1,0.5), 
  "ability" = rnorm(10000) 
)
df<- diccionario
df$discrimination<-df$female
df$ocupation<- 1+(df$ability*2)+df$female-(df$discrimination*2)+rnorm(10000)
df$wage<- df$discrimination+df$ocupation+df$ability+rnorm(10000)
head(df)


modelo1 <- lm(wage~discrimination,data=df)
summary(modelo1)

modelo2 <- lm(wage~discrimination+ocupation,data=df)
summary(modelo2)

modelo3 <- lm(wage~discrimination+ocupation+ability,data=df)
summary(modelo3)

stargazer(modelo1, modelo2, modelo3, type = "text")
