# Libraries
library(mvtnorm)
library(multiwayvcov)
library(dplyr)
library(ggplot2)

create_cluster <- function(rho = 0.5, n = 1000,
n_cluster = 50, param = c(0.1, 0.5)){
    Sigma_i <- matrix(c(1,0,0,1 - rho), ncol = 2)
    values_i <- rmvnorm(n = n, sigma = Sigma_i)
    
    # Cluster level
    cluster_name <- rep(1:n_cluster, each = n/n_cluster)
    Sigma_cl <- matrix(c(1,0,0,rho), ncol = 2)
    values_cl <- rmvnorm(n = n_cluster, sigma = Sigma_cl)
    
    # x compuesta de elementos individuales y en cluster
    x <- values_i[,1] + rep(values_cl[,1], each = n /n_cluster)
    error <- values_i[,2] + rep(values_cl[,2], each = n / n_cluster)

    y <- param[1] + param[2]*x + error
    
    df <- data.frame(x, y, cluster = cluster_name)
    return(df)
}

# Simulate clustered dataset and fit with OLS
cluster_sim <- function(param = c(0.1, 0.5),
                        cluster_robust = FALSE,
                        n = 1000,
                        rho = 0.5,
                        n_cluster = 50){
    df <- create_cluster(param = param, rho = rho)
    model <- lm(y ~ x, data = df)
    b1 <- coef(model)[2]
    if(!cluster_robust){
        Sigma <- vcov(model)
        se <- sqrt(diag(Sigma)[2])
        b1_ci95 <- confint(model)[2,]
    }else{
        Sigma = cluster.vcov(model, ~ cluster)
        se = sqrt(diag(Sigma)[2])
        t_critical <- qt(0.025, df = n -2, lower.tail = FALSE)
        lower  <- b1 - t_critical*se
        upper <- b1 + t_critical * se
        b1_ci95 <- c(lower, upper)
    }
    return(c(b1, se, b1_ci95))
}


# Iterate the simulation
run_cluster_sim <- function(n_sims = 1000,
    param = c(0.1, 0.5),
    cluster_robust = FALSE,
    rho = 0.5){
        # Required packages: mvtnorm, multiwayvcov, dplyr
        df <- replicate(n_sims,
         cluster_sim(cluster_robust = cluster_robust, param = param, rho = rho))
        df <- as.data.frame(t(df))
        names(df) <- c('b1', 'se_b1', 'ci95_lower', 'ci95_upper')
        df <- df %>%
            mutate(id = 1:n(),
                param_caught = ci95_lower <= param[2] & ci95_upper >= param[2])
        return(df)
    }


# Distribucion de los parametros e intervalos de confianza
sim_params <- c(.4, 0)   # beta1 = 0: no effect of x on y
sim_nocluster <- run_cluster_sim(n_sims = 10000, param = sim_params, rho = 0)
hist_nocluster <- ggplot(sim_nocluster, aes(b1)) +
  geom_histogram(color = 'black') +
  geom_vline(xintercept = sim_params[2], color = 'red')
print(hist_nocluster)

ci95_nocluster <- ggplot(sample_n(sim_nocluster, 100),
                        aes(x = reorder(id, b1), y = b1))