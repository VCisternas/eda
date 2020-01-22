
# 3

a.3 <- rep(seq(3),3)


# 4

a.4 <- qnorm(0.99)

# 5

a.5 

obs <- rnorm(100, mean = 50, sd = 16)

obs <- sort(obs)

fun <- ecdf(obs)


x <- seq(100)
f <- pnorm(x, mean = 50, sd = 16)

plot(fun, verticals = FALSE, pch = ".")
lines(f, type = 'l', col = "red") # to do: add these 2 curves to each others plot

# 6

diff.med <- function(x){
  d <- median(x) - mean(x)
  return(d)  
}

# part a
x1 <- rnorm(n = 10000, mean = 50, sd = 16)
loe <- diff.med(x1)
loe

# part b
x2 <- rlnorm(10000,1,2)
loeb <- diff.med(x2)
loeb

hist(x2, breaks = 100, xlim = c(0,200), col = "blue")




# 7

Sim.V <- function(alpha, Nsim){
  X <- rnorm(Nsim, mean = 0, sd = 1)
  V <- exp(X) + 2 * X**2
  q <- quantile(V, probs = alpha)
  return(q)  
}

Sim.V(0.99, 100000)
