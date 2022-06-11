# Acordeón para revisar supuestos en MCO

En este texto explicaremos como hacer las pruebas de los supuestos del modelo de mínimos cuadrados ordinarios.

```
model <- lm(mpg ~ wt + disp + qsec, data = mtcars)
summary(model)

par(mfrow = c(2,2))
plot(model)
```

1. **Residuales vs Valores Ajustados.**. Se usan para revisar el supuesto de linealidad. Si los residuales están dispersos alrededor de la línea horizontal sin algún patrón específico (lo mejor sería que la línea roja sea horizontal), es un buen indicador de que existe una relación lineal.
2. **Normal Q-Q**. Se usa para revisar el supuesto de normalidad de los residuales. Si la mayoría de los residuales siguen la línea recta, entonces se cumple con el supuesto.
3. **Scale-Location**. Se usa para revisar homocedasticidad de los residuales. Si los residuales están dispersos sin un patrón visible, entonces se cumple el supuesto.
4. **Residuales vs Leverage**. Se usa para identificar valores atípicos. Los valores atípicos se encuentran fuera de la línea punteada.


## Relación lineal

Revisamos los valores observados contra la prediccion