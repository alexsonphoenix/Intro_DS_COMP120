install.packages("rvest")
library(rvest)
library(tidyverse)

doc <- read_html("simple-document.html")
e <- html_node(doc,"#MyHeading")

html_text(e, trim = TRUE)

read_html("simple-document.html") %>% 
  html_node("#MyHeading") %>% html_text(trim=TRUE)



##

wikipedia.page <- 
  "https://en.wikipedia.org/wiki/List_of_cities_in_New_Zealand"
page   <- read_html(wikipedia.page)
cities <- page %>%
  html_node("#mw-content-text > div.mw-parser-output > table:nth-child(35)") %>%
  html_table(fill=TRUE)


cities


colnames(cities) <- c("Rank", "Name", "Population", "Area", 
                      "Density", "Notes")
cities <- cities %>% mutate(
  Name=factor(Name, levels=Name),
  Population=as.numeric(str_replace_all(Population, ",", "")),
  Area=as.numeric(str_replace_all(Area, ",", "")),
  Density=Population / Area
) %>% select(Name, Population, Density)


cities %>% ggplot(aes(x=Name, y=Population)) + 
  geom_bar(stat="identity") +
  ggtitle("Population Counts by Urban Area") +
  theme(axis.text.x = element_text(angle=90, hjust=1), 
        axis.title.x = element_blank(), 
        plot.title = element_text(hjust = 0.5))



## councils

city_councils <- page %>%
  html_node("#mw-content-text > div.mw-parser-output > table:nth-child(44)") %>%
  html_table(fill=TRUE)

city_councils

colnames(city_councils) <- c("Rank", "Council", "Population", "First_proclaimed")
city_councils <- city_councils %>% mutate(
  Council=factor(Council, levels=Council),
  Population=as.numeric(str_replace_all(Population, ",", "")),
  First_proclaimed=as.numeric(First_proclaimed)
)

city_councils

ggplot(data = city_councils, aes(x = reorder(Council, First_proclaimed), y = First_proclaimed)) +
  geom_point() +
  geom_text(aes(label = First_proclaimed), nudge_y = 2) +
  ggtitle("Year of proclaimation of New Zealand cities") +
  ylab("Year") +
  theme(axis.text.x=element_text(angle=90, hjust=1), 
        axis.title.x=element_blank(), 
        plot.title = element_text(hjust = 0.5))




