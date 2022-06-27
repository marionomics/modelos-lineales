hola
Modelo:

Variable dependiente: Linfocitos en sangre medidos en los pacientes afectados por síndrome de insuficiencia respiratoria aguda relacionado a neumonía por COVID 19 admitidos en el 
Hospital General 450 Durango entre abril de 2020 y febrero de 2021

Variables independientes:

- Neutrofilos
- Edad del paciente
- Género


Resultados del modelo

- Se puede apreciar una relación positiva y significativa entre neutrofilos y linfocitos; mientras que para la edad la relación es negativa y significativa. 
- El género masculino tiene menor cantidad de linfocitos en comparación al género femenino


Supuestos del modelo de mínimos cuadrados ordinarios.

1. Residuales contra ajustados (p1.png)

Se puede apreciar que los valores están dispersos de manera aleatoria alrededor de la línea horizontal; 
además, la linea del ajuste polinomial (linea azul) está al margen de la linea roja, lo cual sugiere que no hay relación entre los valores
esperaods y los residuales (salvo para valores predichos por debajo de 6.5, lo cual puede deberse a que hay pocas observaciones en este rango)

2. Normal Q-Q (p2-1.png y p2-2.png)

Se aprecia una distribución aproximadamente normal de los residuales, salvo en las colas de la distribución. 
Lo cual sugiere una presencia de algunos valores atípicos (outliers). No obstante, todavía es posible realizar inferencia estadística con una distribución así.

3. Scale-location (p3.png)

Dado que el polinomio de regresión (linea roja) es aproximadamente horizontal, y además los valores se esparcen de manera aleatoria (sin patrón evidente) al rededor de la misma, se puede concluir que no hay heterocedasticidad presente en el modelo

4. Residuales vs leverage (p4.png)

Dado que ninguna observación se encuentra fuera de las curvas de contorno para las distancias de Cook con valores de 1 y 0.5, no existen observaciones que influencien de manera significativa los parámetros del modelo
