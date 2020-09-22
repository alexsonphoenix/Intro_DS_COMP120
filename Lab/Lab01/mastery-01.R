## COMP120 - Semester 1, 2020: Mastery task 1

# Complete the following details
#==============================
# Student ID: 5120768
# Name: Son Hoang Nguyen
#==============================

## There are 15 short exercises to complete. The instructions for these exercises
## are given below. Write your answer below the instructions for 
## each question. Note that many exercises have sub-parts. Make sure you
## provide answers for all the sub-parts.

## EX. 1
## Install the nycflights13 package - you'll be using this package
## later in the semester, so we might as well install it now. This package contains
## data for all flights that departed from New York city airports in 2013. Also, write the 
## command for loading the package.
install.packages("nycflights13")
library(nycflights13)
flights


## EX. 2 Perform calculation that computes the radius, and the total surface area
## of a hemisphere whose base area is 25. These variables should be called radius and total_surface_area respectively. 
## Before performing the calculations, watch this video to get an overview 
## of computing total surface area of a hemisphere - https://www.youtube.com/watch?v=oRKzxO8K4dk. 
## Note that R has a built-in constant named pi, which can be used to compute total_surface_area.


# Knowning base area = pi r ^2 = 25
radius <- sqrt(25/pi)
#The surface area of a sphere of radius r is 4 pi r^2
total_surface_area <-  4*pi*radius^2



## EX. 3
## Using the radius variable in the question above, compute the volume of a sphere (i.e., the sphere has the same
## value of radius as that of the hemisphere indicated in the previous question),
## and store it in a variable called volume. Hint: Search the internet for the formula to compute the volume of a sphere. 
## Finally, print the volume variable you have created.

# Volume of a hemisphere: V = (2/3)??r^3
volume <- (2/3)*pi*radius^3


## EX. 4
## Assuming a radius of 3, compute the volume of a sphere and store it in a variable called volume_2. 
## Then, print the difference between the volumes of the two spheres (volume_2 and volume). 
## Also, write a comment stating which of the two spheres has the largest volume.
volume_2 <- (2/3)*pi*3^3

# The second sphere with radius of 3 has larger volume
print(cat("the difference between the volumes of the two spheres (volume_2 and volume) is ", volume_2 - volume))


## EX. 5
## Using both the colon operator and the sequence function create values between 20 and -20 (i.e., 20, 19, 18 ... -18, -19, -20) 
## and store them in two variables (seq_1 and seq_2 respectively). 
## Then, compute the number of elements stored in seq_1 and store it in a variable called len_seq_1.
seq_1 <- -20:20
len_seq_1 <- length(seq_1)
seq_2 <- seq(-20,20,1)

## Modify seq_1 to contain values between 0 to 1. Note: the number of elements in the sequence 
seq_1 <- seq(0,1,length.out = len_seq_1)
## should be the same as len_seq_1. Hint: You are expected to use the sequence function 
## for this purpose - you'll need to figure out the right amount to increment.

## Then, explain using a comment when a sequence function (i.e. seq()) would be preferred over the colon operator (:).
# We should use seq() function in case we want to specify the length of the sequence by passing a parameter length.out, the colon operator (:) assume we want a step of 1, which may not be what we want.

## Finally, compute the elementwise sum of seq_1 and seq_2 and store the result in seq_3.
seq_3 <- seq_1 + seq_2



## EX. 6
## Assume there are 100 students in a class. Write code to generate 100 random numbers 
## with mean of 75 and standard deviation of 9 and save them in a variable called final_marks. 
final_marks <- rnorm(100, mean=75, sd=9)
## Then, write code (and appropropriate comments) to perform the following tasks:
## a) Store the average mark in a variable called average_mark and also print value stored in average_mark.
average_mark <- mean(final_marks)
## b) Store the difference between the top mark and the lowest mark in a variable called difference and also print its value.
difference <- max(final_marks) - min(final_marks)


## EX. 7
## Write code to perform the following tasks:
## Save the sentence THE FIVE BOXING WIZARDS JUMP QUICKLY in a variable called pangram.
pangram <- 'THE FIVE BOXING WIZARDS JUMP QUICKLY'
## Then, save your first name in a variable called first_name.
first_name <- 'Son'
## Now, by going through the sentence (i.e., pangram) manually, identify the first word 
## that contains the first letter of your first name. Write a comment that identifies the word.
# S

## Then, using an appropriate function extract that word and store it in a variable called word_name.
word_name <- 'WIZARDS'

## Finally, convert the contents of word_name into lower case and also print the contents of word_name.
word_name <- tolower(word_name)
print(word_name)

## A concrete example: If your name is John, then the word_name will be jump.


## EX. 8
## John Reynolds was born in a leap year. So far, he has celebrated eight birthdays including the one he celebrated this year.
## Write code to calculate the age and the birth year of John.
## Save the results in variables called age and birth_year, respectively. Also, print the two variables.
## To help you with this task, you have been given three variables (see below).
## You are expected to use appropriate variables given below to compute the new variables age and birth_year.

no_of_birthdays <- 8 # Represents the number of birthdays John has had so far
leap_year_occurrence <- 4 # Represents how often a leap year happens
current_year <- 2020 # Represents the latest occurrence of a leap year

age <- no_of_birthdays*leap_year_occurrence
birth_year <- current_year - no_of_birthdays*leap_year_occurrence



## EX. 9
## Use appropriate functions to remove variables volume_2 and volume from your environment.
rm(volume)
rm(volume_2)
## Then, call an appropriate function to remove all the remaining variables in your environment.
rm(list=ls())


## EX. 10
## Create a vector called heights containing following values: 145, 187, 167, 123, 95.
heights <- c(145,187,167,123,95)
## Write code that sorts and prints the heights vector in ascending order and store it in a variable called sorted_asc.
sorted_asc <- sort(x = heights, decreasing = FALSE)
print(sorted_asc)

## Write code that sorts and prints the heights vector in descending order and store it in a variable called sorted_desc.
sorted_desc <- sort(x = heights, decreasing = TRUE)
print(sorted_desc)

## Hint: Use the function described here: https://www.datamentor.io/r-programming/examples/sort-vector/
## Having created sorted_asc and sorted_desc, execute the following line of code and describe what it does (as a comment).

#elementwise substraction: showing the difference between the corresponding oposite value to its order
sorted_asc - sorted_desc


## EX. 11
# The equation A equals B-cubed plus seven times B plus 25 is written in code as follows:
A <-  B^3 + 7*B + 25 

## Now, assume that you are given two equations described in plain English as given below: 
## Y equals X-squared plus seven times X.
## Z equals five times Y plus 50.
## Using the equations above write code that computes and displays the value of Z, given X = 5.
myfunc <- function(x){
  Y <-  x^2 + 7*x
  Z <- 5*Y + 50
  Z
}
myfunc(5)



## EX. 12
## Assume that you have a message (a sequence of characters) stored in a variable called welcome_msg.
welcome_msg <- "Welcome to COMP120!"
## Write code to print the length of the welcome message (i.e., the number of characters in the message). Hint: See https://data-hacks.com/r-nchar-function
nchar(welcome_msg)  


## EX. 13
## Assume that there exist two vectors as shown below.
vector1 <- c(100, 200, 300, 400)
vector2 <- c(1, 2)
## Having executed the two lines of code above, excute the following lines of code.
sum <- vector1 + vector2
sum
## Using a comment describe how the output is computed.
# for each element in vector1, for each element of vector2 add to element in vector1, exit

## Hint: See the recycling rule described in https://www.r-tutor.com/r-introduction/vector/vector-arithmetics


## EX. 14
## Assume the following line of code is given to you.
statement <- "The journey of a 1000 miles starts with a single step"
## Write a line of code that splits this sentence into individual words (e.g. "The" and "journey") 
## and stores it in a variable called split_statement.
split_statement <- strsplit(statement, " ")
## Print the contents of split_statement.
split_statement


## EX. 15
## Save examplescript.R provided in your current working directory.
## Write code to run examplescript.R. 
source("examplescript.R")
## Note: If your code is correct, then a graph will be displayed. 
## You are not expected to understand how the graph is produced (i.e., the contents of examplescript.R). 
## You will learn about that in the lectures to come.
