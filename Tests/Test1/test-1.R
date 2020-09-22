### COMP120 - Practical test 1
## Please enter your student id number and name below
## Student ID: 5120768
## Student Name: Son Hoang Nguyen

## You will need to load the following libraries (i.e., run the following lines of code)
library(tidyverse)
library(lubridate)

## For each question write your answer in the placeholders provided below.


# Question 1 on writing single commands
cat_names <- c("Fuzzy", "Bubbly", "Daisy", "Aldo", "Jasper")
cat_ages <- c(7, 5, 4, 9, 2)
cat_genders <- c("Male", "Female", "Female", "Male", "Male")
cat_owners <- c("Jay", "Nathan", "Ruth", "Nathan", "Sandra")

# Question 1a
mean(cat_ages)

# Question 1b
#print the names of all cat owners who own male cats 
cat_owners[cat_genders=="Male"] 

# Question 1c
#print the name(s) of all female cats that are 4 years or older 
cat_names[cat_genders=="Female" & cat_ages>=4] 

# Question 2 on writing a function
#function to compute Body Mass Index (BMI) 
compute_BMI <- function(height,weight){
  return(weight/(height*height))
}
compute_BMI(1.75, 75) #Test
compute_BMI(c(1.75, 1.85), c(75, 85)) #Test



# Question 3 - provide answers to all the parts of the question (a-g) below
# Question 3a
growth_tbl <- read_csv("scales.csv", na=c("!!","??","###"))

# Question 3b
growth_tbl <- growth_tbl %>% 
  mutate(Date = dmy(Date)) #convert chr column to date type

# Question 3c
growth_tbl <- growth_tbl %>% 
  mutate(Height = Height/100) #convert cm to m

# Question 3d
growth_tbl <- growth_tbl %>% 
  mutate(BMI = compute_BMI(Height,Weight))

# Question 3e
growth_tbl <- growth_tbl %>% 
  mutate(BMI_Class = cut(x = BMI,
                         breaks = c(0,17,24,29,39,Inf),
                         include.lowest = FALSE, #do not include 0 minute
                         right = FALSE,
                         ordered_result = TRUE,
                         labels = c("Underweight","Healthy","Overweight","Obese","Extremely Obese")))

# Question 3f
growth_tbl  <- growth_tbl %>% 
  filter(!is.na(Weight)) #filter out na values containing rows

#sum(is.na(growth_tbl)) #check if anything left

# Question 3g
growth_tbl %>% 
  ggplot(mapping = aes(x=Date, y=Weight))+
    geom_point(aes(col=BMI_Class))+
    geom_smooth()+
    xlab("Date")+
    ylab("Weight in Kilograms")+
    ggtitle("Weight Over Time")



# Question 4 - the question that uses the gapminder data
gapminder <- read_csv("gapminder_data.csv") #load datafile because I could'nt install the library
gapminder
summary(gapminder) #first look the data

gapminder  <- gapminder %>%  
  mutate(lifeExpInWeeks = lifeExp*52) #create new column lifeExpInWeeks

oceania <- gapminder %>%  
  filter(continent == "Oceania"& year<2000) %>%  #We're only interested in Oceania countries before the year 2000
  select(country, continent, year, lifeExp,lifeExpInWeeks) %>% 
  arrange(desc(country))

oceania %>% 
  ggplot(mapping = aes(x=lifeExpInWeeks, y=country))+
    geom_boxplot(aes(fill=country))+
    ggtitle("Life expectancy in New Zealand and Australia from 1952 to 1997")+
    xlab("Life Expectancy (in weeks)")+
    ylab("Country")




