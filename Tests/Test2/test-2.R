### COMP120 - Practical test 2
## =================================
## Please enter your student id number and name below
## Student ID: 5120768
## Student Name: Son Hoang Nguyen (Alex)
## =================================

## You will need to load the following libraries (i.e., run the following lines of code)
library(tidyverse)
library(rvest)
library(randomForest)

## For each question write your answer in the placeholders provided below.



# Question 1
products <- read_html("products.html") %>% 
  html_node("body > table") %>% 
  html_table(fill=TRUE) %>% 
  as.tibble()

products



# Question 2
products <- products %>% 
  separate(combined_code, into = c("product_code", "product_name"), sep = ":")

products



# Question 3
customers <- read_csv("customers.csv")
sales <- read_csv("sales.csv")

output1 <- customers %>% full_join(sales) %>% left_join(products)

output1

# Question 4
output2 <- output1 %>% 
  select(customer_name, product_code, price) %>% 
  filter(!is.na(price)) %>% 
  pivot_wider(names_from = product_code,
              values_from = price)




# Question 5
output3 <- output1 %>% 
  filter(!is.na(product_code)) %>% 
  group_by(product_code,product_name) %>% 
  summarise(count=n())




# Question 6
houses <- read_csv("house_prices.csv")
houses

#6a
f <- price ~ bedrooms + bathrooms + sqft_living
train_data <- houses # use 100% data to train

mod1 <- lm(f, train_data)

summary(mod1)$r.square # display R-square statistic regression model

#6b
f <- price ~ bedrooms + bathrooms + sqft_living + sqft_lot
train_data <- houses # use 100% data to train

mod2 <- randomForest(f, train_data)

mean(mod2$rsq) # display R-square statistic for randomForest model


#6c
# R-square value for regression model mod1 is around 0.5084
# R-square value for randomForest model mod2 is around 0.5351

# We can see that randomForest model mod2 did a better job at modelling how price changes based on varibles
#  because R-square value of model2 is higher!


#6d
#construct test data
test_data = data.frame(bedrooms=4,
                       bathrooms=2,
                       sqft_living=1000,
                       sqft_lot=5000)

predict(mod2, test_data) #predict house price using mod2 (the better model)




# Question 7
# Code to create players tibble
players <- tribble(~player_id, ~first_name, ~last_name, ~country,
                   "1001", "Adam", "Walker", "New Zealand",
                   "1002", "Ben", "Taylor", "Australia",
                   "1003", "Chris", "Hanson", "South Africa",
                   "1004", "Dorothy", "Cooper", "England",
                   "1005", "Emma" , "Minsky", "Poland",
                   "1006", "Florence", "Evans", "Italy"
)


# Code to create matches tibble
matches <- tribble(~player1, ~player2, ~winner_id, ~prize_id,
                   "1001", "1002", "1002", 1,
                   "1002", "1003", "1002", 2,
                   "1001", "1003", "1003", 3,
                   "1004", "1006", "1004", 4,
                   "1004", "1005", "1005", 5)

# Code to create prizes tibble
prizes <- tribble(~prize_id, ~amount,
                  1, 1000,
                  2, 1500,
                  3, 1000,
                  4, 2000,
                  5, 3000)


# Code to create trophies tibble
trophies <- tribble(~"Adam Walker", ~"Ben Taylor", ~"Chris Hanson", ~"Dorothy Cooper", ~"Emma Minsky", ~"Florence Evans",
                    0,4,3,1,17,0)


# Write code for question 7 

#reshape and transform trophies table to easily combine tables
trophies <- trophies %>% 
  pivot_longer(c("Adam Walker", "Ben Taylor", "Chris Hanson", 
                 "Dorothy Cooper", "Emma Minsky", "Florence Evans"),
               names_to = "player_names",
               values_to = "trophy_amount") %>% 
  separate(player_names, into = c("first_name", "last_name"))


#a) creating the tibble
money_and_trophy <- 
players %>% 
  left_join(matches, by = c("player_id" = "winner_id")) %>% 
  left_join(prizes) %>% 
  left_join(trophies, by = c("first_name", "last_name")) %>% 
  select(player_id, first_name, last_name, amount, trophy_amount) %>% 
  mutate(amount = ifelse(is.na(amount), 0, amount)) %>% 
  group_by(player_id,first_name, last_name) %>% 
  summarise(total_prize = sum(amount),
            total_trophy = sum(trophy_amount))

money_and_trophy
  


#b) creating the visualisation
money_and_trophy %>% 
  mutate(full_name = str_c(first_name, last_name, sep = " ")) %>%  # combine first name and last name
  ggplot(aes(x = reorder(full_name, total_prize), y=total_prize))+ # reorder based on total prize order
    geom_bar(stat = "identity")+
    xlab("Player")+
    ylab("Prize money")+
    ggtitle("Prize money won at Dunedin Meadows")+ 
    theme(plot.title = element_text(hjust = 0.5)) # center title



