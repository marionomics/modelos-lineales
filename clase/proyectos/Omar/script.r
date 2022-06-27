install.packages("tidyverse")  
library(tidyverse) # Para gráficas y manipulación de datos
theme_set(theme_minimal()) # Usamos el tema minimalista de ggplot

datos = read_csv("datos(1).csv") %>% 
  mutate(LINFOCITOS = parse_number(LINFOCITOS), # Convertir a valores numéricos la columna de linfocitos
         GENERO = as_factor(GENERO)) # Convertir a factor la variable de género

view(datos) # visualizar la data
summary(datos)  # Resumen de la data

modelo = lm(log(LINFOCITOS)~log(NEUTROFILOS)+EDAD+GENERO, # Usamos transformación logarítmica
            data = datos)

modelo # Se realiza el modelo

hist(modelo$residuals) # Historial del Modelo

aov(modelo) # Anova del modelo

plot(modelo) # Graficar el modelo

summary(modelo) # Resumen del modelo

### 1. Residuales vs ajustados

res_vs_adj = tibble(esperados = fitted(modelo),
                    residuales = rstandard(modelo)) %>% 
  ggplot(aes(esperados, residuales))+
  geom_point()+
  geom_smooth(se = FALSE)+ # Linea de ajuste lineal entre residuales y 
  geom_hline(yintercept = 0, # Linea horizontal
             color = "red",
             lty = "dashed")+
  labs(title = "Gráfica de residuales vs esperados",
       x = "Valores esperados",
       y = "Residuales estandarizados")
png("p1.png",
    width = 600,
    height = 300)

res_vs_adj # Gráfica de residuales vs esperados

dev.off()

### 2. Normal Q-Q 

qqnormal = tibble(residuales = rstandard(modelo)) %>% 
  ggplot(aes(sample = residuales))+
  geom_qq()+
  geom_qq_line(color = "red", 
               size = 1,
               lty = "dashed")+
  labs(x = "Cuantiles teóricos",
       y = "Residuales estandarizados",
       title = "Gráfica Normal Q-Q")

png("p2-1.png",
    width = 600,
    height = 300)

qqnormal  # Grafica QQ- Normal

dev.off()

densres = tibble(residuales = rstandard(modelo)) %>% 
  ggplot(aes(residuales))+
  geom_density(color = "blue",
               fill = "blue",
               alpha = 0.5)+
  labs(x = "Residuales estandarizados",
       y = "Densidad",
       title = "Gráfica de función de densidad para los residuales")

png("p2-2.png",
    width = 600,
    height = 300)

densres # Gráfica de densidad para los residuales

dev.off()

shapiro.test(resid(modelo)) # Prueba Shapiro de normalidad

### 3. Scale-Location

scaleloc = tibble(esperados = fitted(modelo),
                  residuales_sqrt = sqrt(abs(rstandard(modelo)))) %>% 
  ggplot(aes(esperados, residuales_sqrt))+
  geom_point()+
  geom_smooth(se = FALSE, color = "red")+ # Linea de ajuste lineal entre residuales y 
  labs(title = "Gráfica scale-location",
       y = "sqrt(abs(residuales estandarizados))",
       x = "Valores esperados")

scaleloc # Gráfica scale-location 

dev.off()

install.packages("lmtest")  # Pruebas de heterocedasticidad y correlación
library(lmtest)

lmtest::gqtest(modelo) 

lmtest::bptest(modelo)


### 4. Residuales vs leverage

#### Funciones para calcular las curvas de contorno para la distancia de Cook (valores por defecto en R son de 1 y 0.5)

cd_cont_pos = function(leverage, level, model) {sqrt(level*length(coef(model))*(1-leverage)/leverage)} 
cd_cont_neg = function(leverage, level, model) {-cd_cont_pos(leverage, level, model)}

reslev = tibble(residuales = rstandard(modelo),
                leverage = hatvalues(modelo)) %>% 
  ggplot(aes(leverage, residuales))+
  geom_point()+ 
  geom_smooth(se = FALSE, color = "red")+ # Curva polinomial de regresión 
  stat_function(fun = cd_cont_pos, args = list(level = 0.5, model = modelo), xlim = c(0, 0.25), lty = 2, colour = "red") + # Curva de contorno de la distancia cook = 0.5 
  stat_function(fun = cd_cont_neg, args = list(level = 0.5, model = modelo), xlim = c(0, 0.25), lty = 2, colour = "red") + # Curva de contorno de la distancia cook = -0.5
  stat_function(fun = cd_cont_pos, args = list(level = 1, model = modelo), xlim = c(0, 0.25), lty = 2, colour = "red") + #  Curva de contorno de la distancia cook = 1
  stat_function(fun = cd_cont_neg, args = list(level = 1, model = modelo), xlim = c(0, 0.25), lty = 2, colour = "red") + # Curva de contorno de la distancia cook = -1
  scale_y_continuous(limits = c(-4,4)) + # Para que la gráfica solo muestre el eje y entre -4 y 4
  labs(title = "Residuales vs leverage",
       x = "Leverage",
       y = "Residuales estandarizados")

#### Para usar r base (sin ggplot), se puede usar la funcion plot(modelo, which = 5)

png("p4.png",
    width = 600,
    height = 300)
reslev
dev.off()



