## COMP120 - Semester 2, Mastery task 2

# Complete the following details
#==============================
# Student ID: 5120768
# Name: Son Hoang Nguyen
#==============================

### This mastery task evaluates your understanding of the following concepts: 
### data structures (vector and matrix), branching, loops and functions.
### There are five questions in this week's mastery task. You will need to provide
### a brief comment for your solution and also the working code in the appropriate
### sections below. For sub-questions, add a comment just above the solution to 
### indicate the sub-question number (e.g. #2a and #2b).




## Solution to question 1
age   <- c(25, 30, 22, 40, 33, 24)
sex   <- c("M", "F", "M", "F", "U", "U")

#apply function mean() to vector age with filter by sex
mean(age[sex=="M"])
mean(age[sex=="F"])
mean(age[sex=="U"])

tapply(age, sex=="M", mean)


## Solution to question 2
A <- c(1, 10, 2, 9, 3, 8, 4, 7, 5, 6)

#2a. A!=10 returns a logical vector in which elements not equal 10 are TRUE
A!=10

#2b. A[A==10] is vector indexing, it looks for an element in vector A which has value of 10
A[A==10]

#2c.	Write a single line of code that prints whether the value of each element in A that is greater than or equal to 8. 
A[A>=8]

#2d.	Write a single line of code that prints the total number of elements in A that are less than 5
sum(A<5)

#2e. appends five elements 
A <- c(A, 14, 19, 23, 25, 99)
A

#2f. prints the elements whose index is odd 
A[seq(1,15,2)]





## Solution to question 3
#3a. Create sequence contains all odd numbers (whole numbers) that are less than 24
odd12 <-  seq(1,24,2)

#3b.	Using odd12, create a 3 by 4 matrix (i.e., 3 rows and 4 columns) 
odd_matrix <- matrix(data=odd12, nrow = 3, ncol = 4)

#3c. Print the average of all values of the matrix. 
mean(odd_matrix)

#3d.	Replace all values in the third row by log(-5). 
odd_matrix[3,] <- log(-5)

#3e.	Replace the value in the second row, second column by a NA. 
odd_matrix[2,] <- NA

#3f.	Write code that checks whether each element in the matrix is a NaN
is.nan(odd_matrix)

#3h.	Print all the values in the first column.
odd_matrix[,1]

#3i.	Print the value stored in the second element of the fourth column.
odd_matrix[,4][2]




## Solution to question 4
count_elements <- function(V,T){
  length(V[V>T])
}

count_elements(c(97, 48, 26, 57, 64), 50)



## Solution to question 5
fizzbuzz <- function(num){
  if ((num%%3 == 0) & (num%%5 == 0)) {
    return("fizzbuzz")
  }
  else if(num%%3 == 0){
    return("fizz")
  }
  else if(num%%5 == 0){
    return("buzz")
  }
  else{
    return(num)
  }
}

fizzbuzz(1)
fizzbuzz(3)
fizzbuzz(5)
fizzbuzz(15)
fizzbuzz(120)
