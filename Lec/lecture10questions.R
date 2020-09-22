library(lubridate)
?parse_date_time

parse_date_time("04/08/2020 1:58pm", orders = "d/m/Y H:M%p")
parse_date_time("04-08-2020 13:58:00", orders = "d/m/Y H:M:S")
parse_date_time("04/08/20 13:58", orders = "d/m/y H:M")
parse_date_time("4th August 2020 13:58", orders = "d m Y H:M")
parse_date_time("08/04/20 1:58:00 PM", orders = "m/d/y H:M:S %p")






# Practice Questions taken from Lecture 10, Data Wrangling (I), Data Manipulation Functions
library("tidyverse")
library(nycflights13)

# 1. Print the flight number (flight) and arrival delay (arr_delay) of all flights that had an arrival delay of 120 minutes or more.

flights %>%
  select(arr_delay) %>%
  filter(arr_delay >= 120)

# 2. Print the flight number (flight), arrival delay (arr_delay) and departure delay (dep_delay) of flights that had an arrival delay of 120 minutes or more, but did not depart late.

flights %>%
  select(arr_delay, dep_delay) %>%
  filter(arr_delay >= 120 & dep_delay <= 0)

# 3. Print the flight number (flight), arrival delay (arr_delay) and departure delay (dep_delay) of flights that had an arrival delay of 120 minutes or more, but did not depart late, sorted by descending order of arrival delay.

flights %>%
  select(arr_delay, dep_delay) %>%
  filter(arr_delay >= 120 & dep_delay <= 0) %>%
  arrange(desc(arr_delay))

# 4. Print the flight number (flight), arrival delay (arr_delay) and departure delay (dep_delay) of flights that had an arrival delay of 120 minutes or more, but did not depart late, sorted by descending order of arrival delay. Finally, create a scatter plot of arr_delay vs. dep_delay.

flights %>%
  select(arr_delay, dep_delay) %>%
  filter(arr_delay >= 120 & dep_delay <= 0) %>%
  ggplot() +
    geom_point(aes(dep_delay, arr_delay)) +
    xlab("Departure delay") +
    ylab("Arrival delay")

# 5. Display all details of flights that flew to Houston (IAH or HOU). Hint: use dest column.

flights %>%
  filter(dest == "IAH" | dest == "HOU")

# 6. Display all details of flights that were operated by United Airlines (UA), that had air time greater than 120 minutes. Hint: use carrier and air_time columns.

flights %>%
  filter(carrier == "UA") %>%
  filter(air_time > 120)

flights %>% 
  select(-(year:arr_time))

# could also be written as

flights %>%
  filter(carrier == "UA" & air_time > 120)

# 7. Print the tail number and the air time of all flights sorted based on descending order of air time.

flights %>%
  select(tailnum, air_time) %>%
  arrange(desc(air_time))

# 8. Add a new column called air_time_hours that has air_time in hours.

mod_flights <- flights %>%
  mutate(
    air_time_hours = air_time / 60)

# to check if it's worked...

mod_flights %>%
  select(air_time_hours, everything())

# 9. After answering the previous question, print three columns: flight number (flight), air_time and air_time_hours, where the air_time_hours is greater than 4 hours.

mod_flights %>%
  select(flight, air_time, air_time_hours) %>%
  filter(air_time_hours > 4)

# 10. Combine the code for 8 and 9 into one.

flights %>%
  mutate(air_time_hours = air_time / 60) %>%
  select(flight, air_time, air_time_hours) %>%
  filter(air_time_hours > 4)
