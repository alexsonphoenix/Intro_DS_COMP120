library(tidyverse)

gender <- c("U", "M", "M", "F", "U", "F", "F", "F", "M", "F")
age <- c(25, 18, 31, 19, 21, 23, 18, 19, 19, 23)
A <- tibble(gender=factor(gender, 
                          levels=c("U", "F", "M"),
                          labels=c("Unspecified", "Female","Male")),
            age=age)
A

A %>% summarise(MeanAge=mean(age), Count=n())

mean(A$age)
length(A$age)

# Where the summarise() function becomes truly interesting is when it is used in conjunction with the group_by() 
A %>% group_by(gender) %>% summarise(MeanAge=mean(age), Count=n())


ggplot(data = tibble(num = 1:100, val =sin(1:100))) +
  geom_point(mapping = aes(num,val))

# RESHAPING:
temperature <- read_csv("weather.csv")
temperature

temperature %>% ggplot(aes(x=Year)) + 
  geom_smooth(aes(y=Auckland, colour=factor(1))) +
  geom_smooth(aes(y=Christchurch, colour=factor(2))) +  
  geom_smooth(aes(y=Dunedin, colour=factor(3))) +
  geom_smooth(aes(y=Wellington, colour=factor(4))) + 
  ylab("Temperature") +
  scale_color_discrete(name="City", 
                       labels=c("Auckland", "Christchurch", 
                                "Dunedin", "Wellington"))

temperature %>% 
  gather(c(Auckland, Wellington, Christchurch, Dunedin), 
         key = "City", value = "Temperature")

temperature %>% gather(-Year, key = "City", value = "Temperature")

temperature %>% 
  pivot_longer(c(Auckland, Wellington, Christchurch, Dunedin), 
               names_to = "city",
               values_to = "Tem") %>% 
  arrange(city)


temperature %>% gather(-Year, key="City", value = "Temperature") %>%
  ggplot(aes(x=Year, y=Temperature, colour=City)) + geom_smooth()



employment <- read_csv("employment.csv")
employment

employment %>% spread(key = Category, value = Rate)

employment %>% spread(Category, Rate) %>% 
  ggplot(aes(x=Year, y=Unemployment, colour=Sex)) + 
    geom_line() +
    ggtitle("Unemployment Rate by gender over a time period")


## separate function
table3
table3 %>% 
  separate(rate, into = c("cases","population"), sep = "/")

## unite function
table5
table5 %>% 
  unite(combined, century, year, sep="") %>% 
  separate(rate, into = c("cases", "population"), sep = "/")


