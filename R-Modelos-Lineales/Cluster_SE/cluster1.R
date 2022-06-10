# Libraries
library(mvtnorm)

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


create_cluster()
