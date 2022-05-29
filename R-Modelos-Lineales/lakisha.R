# AER Lakisha
library(tidyverse)
#library(dplyr)

df <- foreign::read.dta("../data/lakisha/lakisha_aer.dta")

str(df)
head(df)

df$call %>%
  mean()

table(df$call, df$race) %>%
  prop.table(2)
?prop.table


c(0.06447639, 0.09650924) %>%
  mean()

#############################

modelo <- lm(call ~ race,
             data = df)
summary(modelo)

library(ggplot2)
df %>%
  ggplot()+
  geom_density(aes(x = call, color = race))

table(df$call, df$race) %>%
  as.data.frame() %>%
  ggplot(aes(x = Var1))+
  geom_bar(stat = "identity", 
           aes(y = Freq, fill = Var2),
           position = "dodge")+
  labs(x = "Callback", y = "Frequency",
       fill = "Race")+
  theme_light()

#########################################
# Los resultados de una regresión cambian incluyendo covariables

table(df[df$sex == "m",]$call,
 df[df$sex == "m",]$race) %>%
  prop.table(2)

table(df[df$sex == "f",]$call,
      df[df$sex == "f",]$race) %>%
  prop.table(2)


modelo2 <- lm(call ~ race + sex,
              data = df)
summary(modelo2)

library(stargazer)
stargazer(modelo, modelo2, type = "text")
stargazer(modelo, modelo2)


