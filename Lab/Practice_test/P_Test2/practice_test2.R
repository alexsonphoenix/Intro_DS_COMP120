
library(tidyverse)
library(nycflights13)

# Question 1:
## a. 
flights_mod <- flights %>% 
  mutate(air_time_seconds = air_time*60) %>% #converts air_time in minutes to seconds
  select(year, month, day, flight, air_time, air_time_seconds)

## b.
flights_mod <- flights %>% group_by(flight) %>% 
  summarise(mean_air_time = mean(air_time,na.rm = TRUE))

## c.display the average departure delay and arrival delay for all flights grouped by year, day and month
flights_mod <- flights %>% 
  group_by(year,month, day) %>% 
  summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE),
            mean_dep_delay = mean(dep_delay, na.rm = TRUE))
  
## d., display the counts, and average distance travelled for all destinations arranged by descending order of counts 
flights_mod <- flights %>% 
  group_by(dest) %>% 
  summarise(count = n(),
            average_distance = mean(distance, na.rm = TRUE)) %>% 
  arrange(desc(count))


## e. 
airports %>% rename(dest = faa) %>% inner_join(flights_mod) %>% 
  select(dest, name, count, average_distance) %>% 
  arrange(desc(count))



# Question 2:

## Examine table4a 
table4a_mod <- table4a %>% 
  pivot_longer(c("1999","2000"),
               names_to = "Year",
               values_to = "Cases")

table4a_original <- table4a_mod %>% 
  pivot_wider(names_from = Year,
              values_from = Cases)



# Question 3:
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

## a.
stocks_mod <- stocks %>% 
  pivot_wider(names_from = year,
              values_from = return)


## b.
stocks_mod <- stocks_mod %>% 
  pivot_longer(c('2015','2016'),
               names_to = "year",
               values_to = "return") %>% 
  arrange(year) %>% 
  filter(!is.na(return))


## c.
stocks_mod %>% 
  group_by(qtr) %>% 
  summarise(mean_return = mean(return, na.rm = TRUE))




# Question 4:
doctor <- tibble(
  dcode   = c("d1", "d2"),
  dname    = c("Alice", "Bob")
)

diagnosis <- tibble(
  pid = c("p1", "p2", "p3", "p4"),
  dcode = c("d4", "d1", "d2", "d2"),
  illness = c("Jaundice", "Peptic ulcer", "Conjunctivitis", "Tonsillitis")
)

patient <- tibble(
  pid = c("p1", "p2", "p3", "p4"),
  pname = c("Carol", "Denise", "Ethan", "Farah")
)

## a. 
patient %>% inner_join(diagnosis) %>% inner_join(doctor)

## b.
doctor %>% full_join(diagnosis) %>% left_join(patient) %>% 
  select(-pname)

## c.
patient %>% full_join(diagnosis) %>% left_join(doctor)

## d.
diagnosis %>% semi_join(doctor) # a filtering join, return diagnosis if there are matching key bw diagnosis table and doctor table

## e.
diagnosis %>% anti_join(doctor) # a filtering join, return the diagnosis, which are not matched keys with doctor table.

## f. Code in 5e.



# Question 5.
## Supervised Learning is a machine learning technique that trains statistical models with labeled data
## On the other hand, Unsupervised Learning learns from unlabled data. It figures out patterns from the data itself.

## Supervised Learning are useful to train regression models, decision trees,...
## Unsupervised Learning are utilized to train neural network, clustering,...




# Question 6.
# regressions are often use to make predictions
# classification are often used to classify phenomenons
# clustering are often used to find groups that data clusters to




# Question 7.

## read_html
install.packages("rvest")
library(rvest)

read_html("webpage.html") %>% 
  html_node("#MyHeading") %>% 
  html_text(trim=TRUE)

read_html("simple-document.html") %>% 
  html_node("#MyHeading") %>% 
  html_table(fill=TRUE)

## the cut function takes a vector x and assigns each value in the vector to a category based
## upon the supplied break boundaries
cut(x=final.mark,
    breaks=c(0, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 100), ## grade boundaries
    include.lowest=TRUE, ## make it possible that a student can have a mark of zero!
    right=FALSE,         ## is the split on the grade boundary defined on the lowest or highest value?
    ordered_result=TRUE, ## are the categories ordinal? (They're grades, so they have a rank, so yes!)
    labels=c("E", "D", "C-", "C", "C+", "B-", "B", "B+", "A-", "A", "A+")
)

## add legend
theme(legend.position="bottom") ## legend is set at the bottom


