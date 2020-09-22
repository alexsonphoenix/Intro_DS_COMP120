### Part B Test 1 - COMP120
### Name: Son Nguyen Hoang (Alex)
### StudentID: 5120768


#1.	Create a numeric vector called numbers that contains values: 55, 60, 65, 70, 75. 
#Use two ways to create this vector: using c() and seq() functions.
numbers <- c(55, 60, 65, 70, 75)
numbers <- seq(55,75,5)
numbers

#2.	Create a logical vector called has_bike that contains values: TRUE, FALSE, FALSE, TRUE, TRUE. 
#These values represent whether five students who were surveyed have a bike. 
#What would be the result of sum(has_bike)? What does this sum() function do in this case?

has_bike <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
sum(has_bike) # =3 
#sum() function in this case add up the TRUE elements. Because TRUE is encoded as 1, and FALSE is encoded as 0.


#3.	Create a character vector called grades that contains values: A+, A, A-, B+, B, B-, C+, C, C-, D, E. 
#What does length(grades) return?
grades <- c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "E")
length(grades)


#4.	Assume you have the following vector:
A <- c(5, 98, 50, 45, 29, 67, 95, 42, 18, 20)
#a)	What are the outputs of the following lines of code?  In plain English, explain what each line does (in just one sentence).
A > 25 #returns a logical vector, element is TRUE if it is greater than 25, otherwise FALSE.
A < 75 #returns a logical vector, element is TRUE if it is less than 75, otherwise FALSE.
A == 50 #returns a logical vector, element is TRUE if it is equal to 50, otherwise FALSE.
(A <= 50) & (A >= 25) #returns a logical vector, element is TRUE if it is greater or equal to 25 and less than or equal to 50, otherwise FALSE.
(A == 50) | (A == 95) #returns a logical vector, element is TRUE if it is equal to either 50 or 95, otherwise FALSE.



#5.	Create a character vector named loan_risk_types containing names of three values: high, med and low. 
#Print the second element in this vector. Modify the second element of this vector to medium. 
#Create another vector named additional_risk_types with two values: extreme and very low. 
#Combine the contents of the second vector to the first vector. Print the contents of the first vector.
loan_risk_types <- c("high","med","low")
loan_risk_types[2]
loan_risk_types[2] <- "medium"
loan_risk_types

additional_risk_types <- c("extreme", "very low")

loan_risk_types <- c(loan_risk_types, additional_risk_types)
loan_risk_types




#6.	Create the following matrix and answer the following questions below.
mat <- matrix(data = c(2, 1, 4, 5, 3, 7, 9, 4, 3, 0, 10, 6), ncol = 3)
#a.	Print the value in the last column of the first row.
mat[1,ncol(mat)]
#b.	Modify the value in the second row, third column to 100.
mat[1,3] <- 100
mat



#7.	The value of the vector in A (from question 4) is now modified as follows:
A <- c(A, NA, 5, NA)
#a)	Print the elements of A. How many elements does A contain (use a command)?
A
length(A)

#b)	Print the number of elements in A that contain NA (i.e., missing values). 
#   Hint: use sum() and is.na(). is.finite() can also be used instead of is.na(). 
sum(is.na(A))


#c)	Print the number of elements in A that do not contain NA (i.e., missing values). 
#   Hint: use sum() and is.na(). is.finite() can also be used instead of is.na(). 
#   For this you should also use the logical NOT operator given by the exclamation mark symbol !.
#   Note that the not operator takes each element of the vector and gives the opposite logical value. 
#   If the logical value is TRUE, then it returns FALSE. If the logical value is FALSE, it will return TRUE. 
#   For example, the code !is.na(10) return TRUE. The code !is.na(c(10, 20, NA)) returns TRUE, TRUE and FALSE.
sum(!is.na(A))


#8.	Write a for loop that prints all elements in vector A that are greater than 50. 
#   Reinitialize the values of vector A as given below.
A <- c(5, 98, 50, 45, 29, 67, 95, 42, 18, 20)
#Now, practice two versions of the for loop:
for(i in A) {
  if (i > 50) {
    print(i)
  }
}

for(i in 1:length(A)) {
  if (A[i] > 50) {
    print(A[i])
  }
}


#9.	Write a for loop that prints the count of all elements in A (from Q8) that are greater than 50
count <- 0
for(i in A) {
  if (i > 50) {
    count <- count+1
  }
}
count


#10.	Write a for loop that prints the sum of all elements in A (from Q8) that are greater than 50.
sum_A_g_50 <- 0
for (i in A) {
  if (i>50) {
    sum_A_g_50 <- sum_A_g_50 + i
  }
}
sum_A_g_50


#11.	Write a very simple function called find_greatest_num that computes the largest of two numbers that are 
#provided as arguments (a and b). When the function is called with arguments 10 and 20, it should return 20.
find_greatest_num <- function(a,b){
  if (a>=b) { 
    return(a)
  }else{
    return(b)
  }
}

find_greatest_num(10,20)


#12.	Write a function called compute_squared_results that takes three arguments, a, b and c and returns the 
#result of the following computation (a2 + b2 + (c2/ a2)).  Test the function by passing arguments 10, 20 and 30
#which should produce 509. 
compute_squared_results <- function(a,b,c){
  a**2 +b**2+(c**2/a**2)
}

compute_squared_results(10,20,30)



#13.	Write a function called compute_risk that takes one argument, the amount_requested. If the amount requested 
#is less than 10000, then the risk_type is low. If the value is between 10000 and less than 25000, the risk_type
#is medium. Otherwise, the risk_type is high. Given an amount, the function should return whether the risk_type 
#is low, medium or high. Test this function by calling compute_risk(100) and compute_risk(100000). 
#Check whether these functions produce expected results.
compute_risk <- function(amount_requested){
  if (amount_requested < 10000) {
    return("low")
  }
  else if(amount_requested>=10000 && amount_requested<25000){
    return("medium")
  }
  else{
    return("high")
  }
}

compute_risk(100)
compute_risk(100000)



#14.	Let us assume you have the following vector representing ages of 10 students. Create another vector called 
#can_vote that identifies whether they can participate in voting (TRUE if age greater than or equal to 18, 
#FALSE otherwise). Use the ifelse() function to create the can_vote vector.
ages <- sample(1:50, 10)
can_vote <- ifelse(ages>=18, TRUE, FALSE)
can_vote


#15.	Do analysis on the file runners.csv
#runners <- read_csv("runners.csv", na = c("!!!","??"))
runners <- read_csv("runners.csv", na = "!!!")

#a.	Examine the file and identify which values need to be converted to NAs in the last two columns. 
#Any value for Sex that is not an alphabet (i.e., other than F or M in this dataset) should be converted to an NA.
#Also, any additional strings that appear in the TimeInSeconds column must be removed, but the numerical values 
#that appear along with strings must be retained (e.g. 1900 seconds which should be converted to 1900). 
#Finally, the TimeInSeconds column must be converted to a numeric column (Hint: use as_numeric()).
runners <- mutate(runners, Sex = ifelse(Sex=="F"|Sex=="M", Sex, NA))
runners <- mutate(runners, TimeInSeconds = ifelse(str_length(TimeInSeconds) == 4, TimeInSeconds, str_replace(TimeInSeconds," seconds","")))
runners <- mutate(runners, TimeInSeconds = as.numeric(TimeInSeconds))


#b.	The Date column should be converted as a date-time data type. 
library(lubridate)
runners <- runners %>% 
  mutate(Date = dmy_hm(Date))

#c.	The Sex column contains two values, F and M. Modify these values with Female and Male respectively. 
#   Hint: ifelse() or str_replace() functions can be useful here.
runners <- runners %>% 
  mutate(Sex = ifelse(Sex=="F", "Female", "Male"))

#d.	After cleaning up, store the data in runners_tbl (a tibble).
runners_tbl <- runners

#e.	Now, filter the runners_tbl to contain only rows of data that do not contain NAs in two columns: Sex and TimeInSeconds.
#Hint: !is.na() function may be useful here. For example, !is.na(Sex) returns all elements in the Sex column that are not NAs.
runners_tbl <- runners_tbl %>% 
  filter(!is.na(Sex) & !is.na(TimeInSeconds))

#f.	Using the mutate function, add a new column called TimeInMinutes which contains the value of running time 
#   stored in minutes. Hint: You will need to divide TimeInSeconds by 60.
runners_tbl <- runners_tbl %>% 
  mutate(TimeInMinutes = TimeInSeconds/60)



#g.	Add a new column called RunClassification that shows the classification of the 5km run as specified in the 
#table below. For example, if a runner has taken less than or equal to 20 minutes to complete their run, 
#then their RunClassification will be Tier-I. Hint: Use the cut function to create this column.
runners_tbl <- runners_tbl %>% 
  mutate(RunClassification = cut(x = TimeInMinutes,
                                 breaks = c(0,20,25,30,35,Inf),
                                 include.lowest = FALSE, #do not include 0 minute
                                 right = FALSE,
                                 ordered_result = TRUE,
                                 labels = c("Tier-I","Tier-II","Tier-III","Tier-IV","Tier-V")))


runners_tbl
# Creating plots
runners_tbl %>% 
  ggplot()+
    geom_point(aes(x=Date, y=TimeInMinutes, color=Sex))+
    ggtitle("Running Time by Sex")+
    xlab("Date")+
    ylab("Running Time in Minutes")


runners_tbl %>% 
  ggplot(aes(RunClassification))+
    geom_bar(aes(fill=Sex))+
    ggtitle("Run classification by Sex")+
    xlab("Run Classification in tiers")+
    ylab("Count")


runners_tbl %>% 
  ggplot(aes(x=Sex,y = TimeInMinutes))+
    geom_boxplot(aes(fill=Sex))+
      ggtitle("Box plot of running time in minutes split by sex")+
      xlab("Sex")+
      ylab("Time in Minutes")



#16.	Do you know how to create other plot types covered in the course – line, smooth and histogram? 
#Also, do you know how to create a plot with multiple geoms? For example, a plot may show scattered 
#data points and a smooth line (i.e., the one that uses geom_point and geom_smooth functions)? 

#Yes I do


#17.
#a.	Print the details (all columns) of all female runners sorted based on descending order of running time in minutes.
runners_tbl %>% 
  filter(Sex == "Female") %>% 
  arrange(desc(TimeInMinutes))

#b.	Print Sex and running time in seconds of runners who belong to Tier-I runners.
runners_tbl %>% 
  filter(RunClassification == "Tier-I")

#c.	The Date column in runners_tbl is a date-time data type. Modify this column into a date column using as_date() 
#function (hint: using mutate()). Then, present the results by descending order of date. 
#Store the results in a new tibble called runners_tbl_mod.
runners_tbl_mod <- runners_tbl %>% 
  mutate(Date = as_date(Date)) %>% 
  arrange(desc(Date))


#d.	Using runners_tbl_mod obtained (see previous question), 
#print the date and sex of runners, who are in either of the two tiers – Tier-IV or Tier-V.
runners_tbl_mod %>% 
  filter(RunClassification == "Tier-IV"|RunClassification=="Tier-V") %>% 
  select(Date, Sex)



#18.	Using flights dataset (introduced in lecture 9), write code to create the plot shown on the next page. The plot shows the counts of all flights that satisfied three conditions:
#a.	Arrived ahead of time (arr_delay is less than 0 minutes), 
#b.	The origin of the flight was the JFK airport in New York,
#c.	Had air_time greater than 360 minutes.
library(nycflights13)
flights %>% 
  filter(arr_delay < 0, origin=="JFK", air_time > 360) %>% 
  ggplot(aes(x = dest))+
    geom_bar()+
    ggtitle("Count flights per destination")+
    xlab("Destination")+
    ylab("Count")

#19
?starwars
starwars %>% 
  filter(species=="Human" | species=="Droid") %>% 
  ggplot(aes(y=eye_color))+
    geom_bar(aes(fill=species))+
    ggtitle("Count of Starwar characters by eye color and species")+
    ylab("Eye colour")


