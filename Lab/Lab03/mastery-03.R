### COMP 120 - Mastery Tasks 3
#==============================
# Student ID: 5120768
# Name: Son Hoang Nguyen
#==============================
## Complete the exercises below. Where there is an instruction in angle
## brackets, it is asking you to replace that instruction with appropriate
## R code. The code can be one or more lines.

## THIS FUNCTION IS USED IN SOME OF THE EXERCISES. YOU ARE EXPECTED TO CALL IT,
## BUT NOT COMPLETELY UNDERSTAND ITS DETAILS. ESSENTIALLY, IT TAKES A MARK FROM
## 0 TO 100 AND CONVERTS IT TO THE EQUIVALENT LETTER GRADE FOR OTAGO UNIVERSITY.
## DO NOT MODIFY THIS FUNCTION
assign.grade <- function(final.mark) {
  ## the cut function takes a vector x and assigns each value in the vector to a category based
  ## upon the supplied break boundaries
  cut(x=final.mark,
      breaks=c(0, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 100), ## grade boundaries
      include.lowest=TRUE, ## make it possible that a student can have a mark of zero!
      right=FALSE,         ## is the split on the grade boundary defined on the lowest or highest value?
      ordered_result=TRUE, ## are the categories ordinal? (They're grades, so they have a rank, so yes!)
      labels=c("E", "D", "C-", "C", "C+", "B-", "B", "B+", "A-", "A", "A+")
  )
}

## EXERCISE 1:
## Create a named list (called my.details) that contains two elements: name (your first name); and usercode (your
## student user code). Then, after the list has been created (i.e., using a separate line of code), add a vector element (using the c() function)
## called papers that contains the paper codes of the papers that you are taking this semester.
## Then, print out the contents of this list using the str() function.
## Write code to print the usercode stored in the list using the numerical indexing approach (hint: use [[]] syntax with the correct index).
## Write code to produce the same output as the question above using the [[]] syntax by passing the element name.
## Write code to print the name stored in the list using the $ operator.
## Write code to print the paper code of the first paper in the list.
my.details <- list(name="Son", usercode=5120768)
my.details$papers <- c("COMP120", "BSNS113", "ACCT102")
str(my.details$papers)
my.details[[2]]
my.details[["usercode"]]
my.details$name
my.details$papers[1]



## EXERCISE 2:
## There is a built-in function in R called is.finite. Run the following code, and write the result (using comments that start with #)
## and also a short description of what it does. Note: NA and NaN should be familiar from lectures.
## Inf and -Inf represent positive and negative infinity values (e.g. 1/0 gives Inf and -1/0 gives -Inf). 
tests <- c(8, 17, 999, NA, 4, Inf, -Inf, NaN) 
is.finite(tests) 
## TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE
## result is a logical vector containing values that are TRUE if it is a number, and FALSE if it is Infinite numbers or Not Available or Not A Number values


## EXERCISE 3:
## There is another built-in function in R called ifelse. It is important not to confuse this function with
## the if (...) { ... } else { ... } programming construct that we looked at last week. Given the code below
## write down the result and a brief description of what this function does (using comments). Note this function
## was also discussed in lecture 6. 
i <- seq(1,100,10)
## 1 11 21 31 41 51 61 71 81 91
## i is a linearly spaced by 10 sequence start from 1 and end at 91
ifelse(i < 50, i - 1, i + 1) 
## 0 10 20 30 40 52 62 72 82 92
## if an element in the sequence is less than 50, take 1 away from that element, else add 1 to that element


## EXERCISE 4:
## Combine the four supplied vectors below (vect1 to vect4) to create a data frame called my.df (i.e., each vector becomes a column in my.df). Then,
## print out the second column of the third and forth rows (in one command). Also, write code to
## print all the values in the fifth row. Then, modify the value in the last row, last column to 10000.
## Create a new data frame called second.df that has one row of data with the following values for the four vectors: vect1 = 11, vect2 = "Male", vect3 = 150 and vect4 = 1011.
## Add the contents of second.df to my.df using an appropriate function.
## Print the contents of the my.df
## Print the number of rows in my.df
## Print the column names in my.df
## Convert my.df (which is a data frame) to tibble named my.tbl. 
## Comment whether vect2 is an ordered or an unordered factor. 
vect1 <- seq(10) 
vect2 <- factor(rep(1:2, 5), levels=1:2, labels=c("Male","Female")) 
vect3 <- round(rnorm(10, mean=100, sd=10)) 
vect4 <- 1001:1010 

my.df <- data.frame(vect1,vect2,vect3,vect4)
my.df[c(3,4),2]
my.df[5,]
my.df[nrow(my.df), ncol(my.df)] <- 10000

second.df <- data.frame(vect1 = 11, vect2 = "Male", vect3 = 150, vect4 = 1011)
my.df <- rbind(my.df, second.df)
my.df
nrow(my.df)
colnames(my.df)

my.tbl <- as.tibble(my.df)

#test vect2
str(my.tbl$vect2)
my.tbl$vect2[1]>my.tbl$vect2[2]
# vect2 is not an ordered factor


## EXERCISE 5:
## Using a comment describe the main difference between a list and a data frame.
## Using a comment describe the main difference between a vector and a data frame.
## If you were to create a data structure that stores details about coronavirus patients with the following details: (patient_identifier, age, gender, severity), 
## which of the two data structures in R (list, data frame) might suit the best? Note: patients can have one of three values for severity (i.e., high, medium, low).
## Create a variable called corona_patients (using the data structure you identified for the question above) by inventing appropriate values for two patients (i.e., you can create your own values for patient_identifer, age, gender and severity).
## Print the contents of the corona_patients variable.

# List can contain different data types, be different lengths, or even other lists themselves. Data Frame contains only one datatype in a column, every column must have the same length.
# A vector has 1 dimension while a data frame has 2(rows and columns)

#Data Frame would be the best suit data structure to store details about coronavirus patients
corona_patients <- data.frame(patient_identifier=1, age=25, gender="M", severity="high")
corona_patients
  

## EXERCISE 6
## Using a comment describe at least two differences between the data structures data frame and tibble.
## Write code that creates a data frame called employee_df using the following vectors.
name <- c("John Doe","Peter Gynn","Julie Hope")
salary <- c(53000, 89000, 47000)
startdate <- as.Date(c("2010-11-1","2008-3-25","2007-3-14"))
## Write code that converts the data frame (i.e., employee_df) into a tibble called to employee_tbl.
## Write code that prints the column names of the newly created tibble.
## Write code that prints the second element of the name column in the employee_tbl.
## Write code that adds a fourth employee to employee_tbl. The new employee is Christine Smith who started the job on 2020-7-10 (which represents 10th July 2020). Her salary is 120000. 
## Note that for the question above the start date should be created using as.Date("2020-7-10"). This function converts characters (i.e., "2020-7-10") into a date. To add the new row to the tibble, you are expected to use the appropriate bind function (rbind() or cbind()) which works for tibbles too.
## Write code that adds a new column to the employee_tbl called gender. The genders of the four employees are Male, Male, Female, Female. Note: you are expected to use the appropriate bind function (rbind() or cbind()).
## Assume that one of the employees, Peter Gynn quit on 15th July 2020. A new column must be added to represent the end date. Write code to create a new column in the employee_tbl for this purpose (called enddate) containing the end date for Peter. Assign NA values for those who are still on the job.
## Finally, print the contents of the tibble.

#data frame vs tibble: tibbles are essentially just a data frame, tibbles have useful improvements, mostly in printing, where they provide additional information about columns and truncate output to make it easier to read 
employee_df <- data.frame(name,salary,startdate)
employee_tbl <- as.tibble(employee_df)
colnames(employee_tbl)
new_employee <- data.frame(name="Christine Smith",salary=120000,startdate=as.Date(c("2020-7-10")))
employee_tbl <- rbind(employee_tbl, new_employee)
employee_tbl$gender <- c('Male', 'Male', 'Female', 'Female')
employee_tbl$enddate <- as.Date(c(NA,"2020-7-15",NA,NA))
employee_tbl



## EXERCISE 7:
## Complete the function below. This function will take in a vector of marks for an assignment. For any of
## the marks that are missing (i.e., NA values), the function replaces them with 0, and then returns the vector of actual marks
## awarded for that assignment. Test your code by calling actual.marks(c(100, NA, 80, 40)) which should return a vector containing values: 100, 0, 80, 40. 
## Hint: One approach is to use the replace_na function (use ?replace_na() from Console window to get help). For example, replace_na(c(100,NA), 500) replaces NA to 500. Another approach is to use a combination of ifelse() and is.na() functions.
## Yet another approach is to write a loop that replaces every NA to a zero. There are many more approaches to achieve this! You are free to choose any one of these.
actual.marks <- function(raw.marks) {
  raw.marks[is.na(raw.marks)] <- 0
  raw.marks
}
actual.marks(c(100, NA, 80, 40))



## EXERCISE 8:
## Load the INFO 204 marks for 2017 from the file given to you (and assign it to a tibble called info204). Rather than using
## the read_delim() function, use the appropriate helper function to read the file. Remember to convert any missing values to NAs. 
info204 <- read_tsv("INFO204-2017.tsv", na = '?')
info204


## EXERCISE 9:
## Modify the info204 tibble (created above) by adding an additional column, called final.mark. This will equal the total
## marks for assessment of each student (note there are five assessments - A1, A2, A3, Tutorials and Exam). Remember to use the actual.marks function to account for situations
## where a given student did not submit work (missing values). Then, create another column, called grade, that is the result
## of calling the assign.grade function using the final.mark column as its argument 
info204$final.mark <- actual.marks(info204$A1) + actual.marks(info204$A2) +actual.marks(info204$A3) + actual.marks(info204$Tutorials) + actual.marks(info204$Exam)
info204$grade <- assign.grade(info204$final.mark)


## EXERCISE 10:
## After completing the exercise above, add another column to the info204 tibble (created above) called award.nominee.
## This column should have the value TRUE if a student is nominated for an excellence award, otherwise FALSE.
## Nominees of excellence award are those whose grades are A+. You are expected to use ifelse function for this purpose.
## Then, write code that computes and prints the total number of students nominated for the award. 
info204$award.nominee <- ifelse(info204$grade=="A+",TRUE,FALSE)
sum(info204$award.nominee)


## EXERCISE 11:
## Save the info204 tibble to a CSV file. The name of the file should be info204-processed.csv 
write_csv(info204,"info204-processed.csv")


## EXERCISE 12: Load the CSV file you created as a part of the previous exercise
## and store it in a tibble called info204.processed. 
## Write code that prints the total number of columns in the tibble. 
## Write code that prints the row names in the tibble. 
## Write code that prints the maximum final mark scored in the class. 
## Write code that prints the average of assignment 1 (A1) in the class. Remember to use the actual.marks function to account for
## situations where a given student did not submit work (missing values). 
info204.processed <- read_csv("info204-processed.csv")
ncol(info204.processed)
rownames(info204.processed)
max(info204.processed$final.mark)
mean(actual.marks(info204.processed$A1))
