library(tidyverse)

A <- tibble(
  key=c("A", "B", "C", "D"),
  avalue=c(123, 321, 213, 132)
)
A
B <- tibble(
  key=c("A", "D", "E"),
  bvalue=c(987, 789, 911)
)
B
A %>% inner_join(B)

A %>% left_join(B)

A %>% right_join(B)

A %>% full_join(B)



subject <- tibble(
  id=c("1234", "2341", "4321"),
  age=c(25, 35, 75)
)

trial <- tibble(
  id=c("1234", "4321", "1234", "4321", "1234", "4321", 
       "1234", "4321", "1234", "4321"),
  run=c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5),
  reaction=c(97, 137, 106, 138, 103, 152, 102, 148, 111, 153)
)

subject %>% inner_join(trial)

subject %>% inner_join(trial) %>% pivot_wider(names_from = run, values_from = reaction)

subject %>% left_join(trial)

subject %>% left_join(trial %>% pivot_wider(names_from = run, values_from = reaction))

subject %>% semi_join(trial)

subject %>% anti_join(trial)
