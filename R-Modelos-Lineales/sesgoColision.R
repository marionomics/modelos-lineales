library(tidyverse)

# creating variables
#set.seed()
female <- rbinom(10000,1,0.5)
ability<- rnorm(10000)
discrimination <- female
occupation <- ability*2 + female*0 - discrimination*2 + rnorm(10000)
wage <- 1- discrimination + occupation + ability + rnorm(10000)

#DataBase
db <- data.frame(female,ability,discrimination,occupation,wage)

#model 1
model1 <- lm(wage~female,data = db)
summary(model1)

#model 2
model2 <- lm(wage~female+occupation,data = db)
summary(model2)

#model 3
model3 <- lm(wage~female+occupation+ability,data = db)
summary(model3)