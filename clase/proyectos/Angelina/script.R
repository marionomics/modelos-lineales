################################################################################
# Final Proyect: Linear Models
# Dataset: CO2 emission by vehicles
#     How much CO2 is emitted depending on car features?
# by: Angelina López
################################################################################

library(openxlsx)
library(dplyr)
library(nortest)
library(EnvStats)
library(moments)

data <- read.csv('Modelos Lineales/proyecto/CO2 Emissions_Canada.csv')
head(data)


# DataSet Description:
#     This data contains the CO2 emissions of diferent vehicle models. Variables included are
#     - Maker
#     - Model
#     - Vehicle Class
#     - Engine Size
#     - Number of Cylinders
#     - Transmission model
#     - Fuel type used during test
#     - Fuel Consumption at City in Liters per 100 km
#     - Fuel Consumption at Highway in Liters per 100 km
#     - Total Fuel Consumption in Liters per 100 km
#     - CO2 Emissions in grams per Kilometer


summary(data)

# Histograms of CO2 emissions and Total Fuel Consumption
ggplot(data = data,
       aes(x=CO2.Emissions.g.km.))+
  geom_histogram(color='red')

ggplot(data = data,
       aes(x=Fuel.Consumption.Comb..L.100.km.))+
  geom_histogram(color='blue')

# Scatter plot Total Fuel Consumption vs CO2 emissions 
#     Identified by Fuel Type
ggplot(data = data,
       aes(x=Fuel.Consumption.Comb..L.100.km., 
           y=CO2.Emissions.g.km.,
           color=Fuel.Type))+
  geom_point()+
  scale_x_continuous("Fuel Consumption L/100km")+
  scale_y_continuous("CO2 Emissions g/km")+
  theme_light()

# Boxplot CO2 Emission by number of cylinders
data %>% 
  ggplot(aes(x=as.character(Cylinders)))+
  geom_boxplot(aes(y=CO2.Emissions.g.km.),color=rainbow(8, s=0.5,v=.6))+
  scale_x_discrete("Cylinder")+
  scale_y_continuous("CO2 Emissions g/km")+
  theme_light()
  
# Boxplot Fuel Consumption by number of cylinders
data %>% 
  ggplot(aes(x=as.character(Cylinders)))+
  geom_boxplot(aes(y=Fuel.Consumption.Comb..L.100.km.),color=rainbow(8, s=0.5,v=.6))+
  scale_x_discrete("Cylinder")+
  scale_y_continuous("Fuel Consumption L/100km")+
  theme_light()

# Boxplot Fuel Consumption by fuel type
data %>% 
  ggplot(aes(x=Fuel.Type))+
  geom_boxplot(aes(y=Fuel.Consumption.Comb..L.100.km.),color=rainbow(5, s=0.5,v=.6))+
  scale_x_discrete("Fuel Type")+
  scale_y_continuous("Fuel Consumption L/100km")+
  theme_light()

# Boxplot CO2 Emission by fuel type
data %>% 
  ggplot(aes(x=Fuel.Type))+
  geom_boxplot(aes(y=CO2.Emissions.g.km.),color=rainbow(5, s=0.5,v=.6))+
  scale_x_discrete("Fuel Type")+
  scale_y_continuous("CO2 Emissions g/km.")+
  theme_light()


# Anderson Darling Normality Test for continous Variables: p<<0.05 data Not Normal
ad.test(data$CO2.Emissions.g.km.)

ad.test(data$Fuel.Consumption.Comb..L.100.km.)

###################################################################################
# Trying to normalize data

# Log transformation: Not working
log(data$CO2.Emissions.g.km.) %>% 
  ad.test()

log(data$Fuel.Consumption.Comb..L.100.km.) %>% 
  ad.test()

# Boxcox transformation with default parameters: Not working also 
a<-boxcox(data$CO2.Emissions.g.km.)
ad.test(a$data)

#Trying to determinate data distribution
# Empirical distribution
hist(data$CO2.Emissions.g.km.,freq = FALSE,
     main = "Histogram and Empirical Density Function", 
     ylab = "Density",
     xlab = "CO2 Emissions g/km")
lines(density(data$CO2.Emissions.g.km.),col='red',lwd=2)

plot(ecdf(data$CO2.Emissions.g.km.), lw=2,
     main="Empirical Cumulative Density Function", 
     xlab="CO2 Emissions g/km",col="blue")

#This looks like gamma distribution 
# To estimate the parameters of the gamma distribution that best fits sampled data, 
# the Moments parameter estimation can be used:
#   alpha = E[x]^2 /V[x]
#   beta  = Variance(X, I)/Mean(X, I)
# Also "egamma" fuction from "EnvStats" library

gm<-egamma(data$CO2.Emissions.g.km., method = "mle")

YN= rgamma(length(data$Make),shape = gm$parameters[1], scale =gm$parameters[2])

qqplot(YN, data$CO2.Emissions.g.km., 
       xlab = "Theoretical Quantiles", 
       ylab = "Data Quantiles", 
       main="Q-Q Gamma Distribution")


# Assuming Nomality process should be

################################################################################
# 1st Proposed Model:
#   The target varible is CO2emissions in grams per kilometer
#   Indepedent variables are:
#     -Fuel consumption in liters by every 100km: meassured in highway and city
#     -Number of cilinders: 4, 6, 8
#     -Size of the engine: bigger engines may have higher fuel consuption 
#     -Vehicle Class: sedan, SUV, etc may have different weight 
#     -Transmission: 
#     -Fuel Type
################################################################################

model <- lm(CO2.Emissions.g.km. ~ Fuel.Consumption.Comb..L.100.km.+
               as.character(Cylinders) +
               as.character(Engine.Size.L.) +
               Vehicle.Class +
               Transmission +
               Fuel.Type, data = data)
summary(model)

par(mfrow = c(2,2))
plot(model)

# According to graphs, non of the assumptions are true... 
#   -Residuals plot shows evident paterns 
#   -Q-Q is not linear
#   -Leverage has some observations exactly on 1

# Residuals Normality:
#     Anderson-Darling normality test p<<0.05 Residuals Not normal
hist(model$residuals,
     main='Histogram Residuals',
     xlab='Residuals')

MASS::studres(model) %>%
  ad.test()

# Heterocedasticity test: Exist Heterocedasticity 
#     1st method Goldfeld-Quandt test: compares the variances of 2 residual subset
lmtest::gqtest(model, 
               order.by = ~Fuel.Consumption.Comb..L.100.km.+
                 as.character(Cylinders),
               data = data)

#     2nd method Breusch-Pagan: variance of all residuals
lmtest::bptest(model)

# Autocorrelation  
acf(data, lag.max = 15, plot = TRUE)

# Colinealidad
head(mtcars)
matriz_corr <- cor(mtcars %>%
                     select(mpg, wt, qsec, disp))

corrplot::corrplot(matriz_corr)


# Multicolinealidad
car::vif(model)

################################################################################
# 2nd Proposed Model:
#   The target varible is Fuel consumption in liters by every 100km: meassured in highway and city
#   Indepedent variables are:
#     -Number of cilinders: 4, 6, 8
#     -Size of the engine: bigger engines may have higher fuel consuption 
#     -Vehicle Class: sedan, SUV, etc may have different weight 
#     -Transmission: 
#     -Fuel Type

model2 <- lm(Fuel.Consumption.Comb..L.100.km.~ as.character(Cylinders) +
              as.character(Engine.Size.L.) +
              Vehicle.Class +
              Fuel.Type, data = data)
summary(model2)

par(mfrow = c(2,2))
plot(model2)

# According to graphs, non of the assumptions are true... 
#   -Residuals plot shows evident paterns 
#   -Q-Q is not linear
#   -Leverage has some observations exactly on 1

# Residuals Normality:
#     Anderson-Darling normality test p<<0.05 Residuals Not normal
hist(model$residuals,
     main='Histogram Residuals',
     xlab='Residuals')

MASS::studres(model) %>%
  ad.test()

# Heterocedasticity test: Exist Heterocedasticity 
#     1st method Goldfeld-Quandt test: compares the variances of 2 residual subset
lmtest::gqtest(model, 
               order.by = ~Fuel.Consumption.Comb..L.100.km.+
                 as.character(Cylinders),
               data = data)

#     2nd method Breusch-Pagan: variance of all residuals
lmtest::bptest(model)

# Autocorrelation  
acf(data, lag.max = 15, plot = TRUE)

# Colinealidad
head(mtcars)
matriz_corr <- cor(mtcars %>%
                     select(mpg, wt, qsec, disp))

corrplot::corrplot(matriz_corr)


# Multicolinealidad
car::vif(model)