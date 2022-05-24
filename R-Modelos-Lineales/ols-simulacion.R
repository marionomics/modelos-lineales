
set.seed(42)

df <- data.frame(x = rnorm(10000),
           u = rnorm(10000))
df$y <- 5.5*df$x + rnorm(10000)*12


head(df)


regresion <- lm(y ~ x, data = df)

summary(regresion)


df$ygorro <- predict(regresion)
df$ugorro <- resid(regresion)

sd(df$y)
sd(df$ygorro)




library(ggplot2)

ggplot(data = df, aes(x = x, y = y))+
  geom_point(alpha = 0.2, size = .5)+
  geom_smooth()
