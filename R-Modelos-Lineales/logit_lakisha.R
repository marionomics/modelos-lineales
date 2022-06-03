# Logit Lakisha
library(tidyverse)

df <- foreign::read.dta("../data/lakisha/lakisha_aer.dta")

head(df)

df %>%
  ggplot(aes(x = yearsexp))+
  geom_density() +
  theme_light()

modelo_logit_lakisha <- glm(call ~ race + yearsexp, 
                    data = df, 
                    family = binomial(link = "logit"))

summary(modelo_logit_lakisha)
