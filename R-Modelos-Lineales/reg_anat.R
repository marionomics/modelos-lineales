# 'https://raw.github.com/scunning1975/mixtape/master/auto.dta'

#df <- haven::read_dta('https://raw.github.com/scunning1975/mixtape/master/auto.dta')
df <- read.csv("../data/cars.csv")
df <- read.csv("https://raw.githubusercontent.com/marionomics/modelos-lineales/main/data/cars.csv")

df$ldiff <- df$length - mean(df$length)

modelo_corto <- lm(price ~ ldiff, data = df)
modelo_largo <- lm(price ~ ldiff +
                     weight + headroom + mpg,
                   data = df)

modelo_corto$coefficients[1]
modelo_largo

df$y_single <- modelo_corto$coefficients[1] + 
  modelo_corto$coefficients[2] * df$ldiff
df$y_multi <- modelo_largo$coefficients[1] + 
  modelo_largo$coefficients[2] * df$ldiff

df %>%
  ggplot()+
  geom_point(aes(x = ldiff, y = price)) + 
  geom_smooth(aes(x = ldiff, y = y_single))+
  geom_smooth(aes(x = ldiff, y = y_multi),
              color = "red")
