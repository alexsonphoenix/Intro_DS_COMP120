a <- 1
b <- "1"
c <- "one"
d <- 5 > 3
typeof(a)
typeof(b)
typeof(c)
typeof(d)
typeof(NA)

as.numeric(a)
as.numeric(b)
as.numeric(c)
as.numeric(d)

typeof(as.numeric(a))
typeof(as.numeric(b))
typeof(as.numeric(c))
typeof(as.numeric(d))


distance <- "125km"
time <- "1.5hr"
speed <- distance / time

as.numeric(distance)


library(stringr)
distance <- str_replace(distance, "km", "")
str_split(distance, "km")

time <- str_replace(time, "hr", "")

as.numeric(distance) / as.numeric(time)



library(lubridate)
battle.of.hastings <- dmy("14-10-1066")
battle.of.hastings

battle.of.hastings <- parse_date_time("14-Oct-1066 09:00", 
                                      orders="d-b-Y H:M")
battle.of.hastings

as_date(battle.of.hastings)


library(tidyverse)
challenge_df <- read_csv("challenge_solution.csv")
challenge_df$time <- parse_date_time(challenge_df$time, 
                                     orders="d-m-Y H:M")
challenge_df %>% 
  mutate(diff = time -dmy_hm("19/3/2019 10:00")) %>% 
  ggplot()+
    geom_point(mapping = aes(x=num,y=diff), color='blue')+
    xlab("Student number")+
    ylab("Time taken in minutes")



gender <- c("M", "U", "F", "F", "M", "U")

factor(gender)
factor(gender, levels=c("U", "F", "M"))
factor(gender, levels=c("U", "F", "M"),
       labels=c("Unspecified", "Female", "Male"))

ages <- c(26, 41, 16, 9, 44, 43, 49, 23, 29, 3)
cut(ages, breaks=c(0, 12, 19, Inf),
    labels=c("Preteen", "Teenager", "Adult"))

marks <- c(96, 41, 61, 56, 47, 73, 66, 28, 35, 83,50)
marks_cut <- cut(marks, breaks = c(0,49,74,89,100),
                 labels = c("Fail", "Pass", "Merit", "Excellent"))
marks_cut


rm(list = ls())

## data manipulation
age <- c(28, 3, 8, 48, 14, 2, 32, 42, 16, 28)
gender <- c("U", "M", "F", "U", "F", "F", "U", "F", "F", "U")
people <- tibble(age=age, gender=gender)

people %>% 
  mutate(gender=factor(gender, levels=c("U", "M", "F")), 
         Target.Demographic=age < 20 & age > 12)

people %>% 
  filter(age < 20 & age > 12)

people %>% 
  filter(age < 20 & age > 12) %>% 
  mutate(gender=factor(gender, levels=c("U", "F", "M"),
                       labels=c("Unspecified", "Female", "Male")))





