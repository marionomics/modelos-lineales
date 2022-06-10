# Valor esperado y varianza de un dado justo

dado <- 1:6

# nuestra solucion

# Valor esperado
(1+2+3+4+5+6)/6
sum(dado)/length(dado)
mean(dado)

# Varianza
varianza <- function(x){
  valor_esperado <- mean(x)
  dif2 <- (x - mean(x))^2
  return(mean(dif2))
}
varianza(dado)

# resultado de R
mean(dado)
var(dado)
sd(dado)
