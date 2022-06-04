# Se crean las variables para la base de datos 
gender <- rbinom(n = 10000, size = 1, prob = .5)
ability <- rnorm(n = 10000)
discrimination <- gender
occupation <- 1 + ability*2 + gender*0 - discrimination *2 + rnorm(10000)
wage <- 1 - discrimination + occupation + ability + rnorm(10000)

# Se crea el data.frame con las variables anteriores
datos <- data.frame(gender, ability, discrimination, occupation, wage)

View(datos)

# Se crean los modelos con las variables del data.frame 
modelo1 <- lm(wage ~ gender, datos)
summary(modelo1)
modelo2 <- lm(wage ~ gender + occupation, datos)
summary(modelo2)
modelo3 <- lm(wage ~ gender + occupation + ability, datos)
summary(modelo3)
