head(mtcars)
?mtcars
model <- lm(formula = mpg ~ wt + qsec + am,
    data = mtcars)
summary(model)


lmtest::gqtest(model)
lmtest::gqtest(model, 
            order.by = ~disp + hp,
                data = mtcars)

