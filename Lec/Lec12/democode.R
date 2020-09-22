# Lecture 12 on reshaping data - spread, gather, separate and unite
library("tidyverse")

# Examples of tidy and untidy data are presented below.
# Note the lecture covers only table1, table2, table3 and table4a.
table1 #Tidy data - one column per variable, one observation per row, one value in a cell
table2 #Untidy - because an observation is spread across two rows (1999 data for Afghanistan is in two rows)
table3 #Untidy - one of the columns has values that should be in two columns (rate column which has cases/population)
table4a #Untidy - two of the columns are actually values (years - 1999 and 2000), these two columns must be folded into a 'year' column and the values recorded into a new column called 'cases'
table4b #Untidy - columns are years (same as above - 1999 and 2000), these two columns must be folded into a 'year' column and the values recorded into a new column called 'cases'

# Motivation for tidy data - It makes data manipulation easy! The following are examples. Only the first two covered in the lecture.
table1 %>% mutate(rate = cases/population)
table1 %>% group_by(country) %>% summarize(total_cases = sum(cases))
table1 %>% group_by(country) %>% summarize(sum(cases), mean(population))

# Example of gather()
?gather
table4a #The data in table4a demonstrates the need for gather. Two columns 1999 and 2000 are in fact values for the variable called 'Year'. So, they must be gathered into a new variable called Year. The corresponding values will need to be collected in a new variable called "cases". These can be achieved using the gather() function.
table4a %>% gather(`1999`,`2000`, key = "year", value = "cases")

?spread
# Example of spread()
table2 # The problem with data in table2 is that the same observation is spread across two rows (1999 observation for Afghanistan is spread into two rows). This can be fixed by spreading "cases" and "population" as separate columns using the spread() function. 
table2 %>% spread(key = type, value = count)

# Recently added functions that are alternatives to gather and spread functions

# Example of pivot_longer
table4a
table4a %>% 
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "cases")

# Example of pivot_wider
table2
table2 %>% 
  pivot_wider(names_from = "year", values_from = "count")

# Example of separate()
table3 #table3 has a column called rate that is made up of two column values with / in the middle. The columns can be separated using separate()
table3 %>% separate(rate, into = c("cases","population"), sep = "/")

# Example of unite()
table5 #table5 has two columns centry and year that can be combined to make a year column (with 4 digits). These columns can be combined using unite()
table5 %>%  unite(new, century, year, sep = "")



