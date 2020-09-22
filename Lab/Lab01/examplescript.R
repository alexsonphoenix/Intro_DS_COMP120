## generate a simple X-Y line plot for 
## an arbitrary function
X <- seq(0, 20*pi, 0.5)
Y <- 3 + 0.2*X + sin(X)
plot(X, Y, type="l", col="magenta", xlab="X", ylab="f(X)", main='f(X) = 3 + 0.2X + sin(X)')

