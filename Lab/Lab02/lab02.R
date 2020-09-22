mat <- matrix(data=c(9,2,3,4,5,6),ncol=3)

#Tasks
mat[,3]

mat[2,3] <- 100

mat <- matrix(data=c(9,2,3,4,5,6),ncol=3, byrow = TRUE)

## Other methods of indexing into vectors
X <- seq(25, 30)
X

j <- X>27

X[j]

## Logical tests 
age   <- c(25, 30, 22, 40, 33, 24)
sex   <- c("M", "F", "M", "F", "U", "U")

males <- sex=="M"
mean(age[males])

sum(age[age>25])

sex[age>25]

sum(males) == sum(sex=='M')

#prints the ages of people who are than or equal to 30
age[age<=30]
sum(age<=30)

ages_1 <- c(age, c(90, 35, 75, 89, 98, 100))

ages_2 <- age + c(90, 35, 75, 89, 98, 100)


## Branching
## Looping
sum <- 0
X <- c(5, 1, 4, 3, 2)
for (Xi in X) {
  if(Xi>3){
    sum <- sum + Xi
  }
}
sum

A <- 18
B <- 50
while (A != B) {
  if (A > B) {
    A <- A - B
  } else {
    B <- B - A
  }
  message("A = ", A, " B = ", B)
}


## User-defined Functions
count_numberOf_instances <- function(V,T){
  bools <- V==T
  sum(bools)
}
count_numberOf_instances(c(80, 40, 20, 20), 20)









