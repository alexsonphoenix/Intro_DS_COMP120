### COMP120 - Mastery Tasks 08
#==============================
# Student ID: 5120768
# Name:Son Hoang Nguyen (Alex)
#==============================
# Your code for the mastery task should be provided below.
# Make sure you write comments about what your code does for each block of code that you write.

#install and load libraries
install.packages("rvest")
library(rvest)
library(tidyverse)

#Code for scraping the data from https://en.wikipedia.org/wiki/List_of_lakes_of_New_Zealand and also cleaning it

wikipedia.page <- "https://en.wikipedia.org/wiki/List_of_lakes_of_New_Zealand"
page   <- read_html(wikipedia.page)

#convert html node into dataframe then convert it to tibble
lakes <- page %>%
          html_node("#mw-content-text > div.mw-parser-output > table:nth-child(18)") %>% 
          html_table(fill = TRUE) %>% 
          as.tibble()

#assign new names for columns
colnames(lakes) <- c("Rank", "Name", "SurfaceArea", "Region", "Notes")

#mutate Rank, and Name column
lakes <- lakes %>% mutate(
  Rank=as.numeric(str_replace_all(Rank, "=", ""))
)

#remove the row that does not contain details about a lake.  
lakes <- lakes[!is.na(lakes$Rank),]

#extract the first set of digits corresponding to surface area in square kilometres 
lakes$SurfaceArea <- str_extract(lakes$SurfaceArea, "\\d*")

#convert SurfaceArea to numeric data type column
lakes <- lakes %>% mutate(
  SurfaceArea=as.numeric(SurfaceArea)
)

#view the final tibble
lakes



#Code for the first visualisation
lakes %>% 
  group_by(Region) %>% #group by region
  summarise(n=n()) %>% #count number of lake in a region
  ggplot(aes(reorder(Region,n),n)) +
    geom_col() + # visualise the distribution of categorical varible (its count)
    ggtitle("Counts of lakes by region")+
    xlab("Regions")+
    ylab("Counts of Lakes")+
    coord_flip()





#Code for the second visualisation
lakes %>% 
  select(Name,Region,SurfaceArea) %>% #select columns of interest
  mutate(Name_Region = str_c(Name,Region,sep = " ")) %>%  # create a new column containing both Name and Region
  arrange(desc(SurfaceArea)) %>%  #arange by descending order SurfaceArea
  head(4) %>% # take the top 4 SurfaceArea lakes
  ggplot(aes(x=reorder(Name_Region,desc(SurfaceArea)),y=SurfaceArea)) +
    geom_bar(stat = "identity")+ # barplot to visualise the distribution of categorical varible (its count)
    ggtitle("Top four lakes by surface area")+
    xlab("Lake name and region")+
    ylab("Surface Area")




#Code for scraping the data from https://www.worldometers.info/gdp/gdp-by-country/ and also cleaning it
worldometers.page <- "https://www.worldometers.info/gdp/gdp-by-country/"
page   <- read_html(worldometers.page)

#convert html node into dataframe then convert it to tibble
countries <- page %>%
  html_node("#example2") %>% 
  html_table(fill = TRUE) %>% 
  as.tibble()

#We are only interested in data for five columns (the first three columns and columns five and six) out of a total of eight columns
countries <- countries[c(1,2,3,5,6)]

#assign new names for columns
colnames(countries) <- c("Rank", "Country", "GDP", "GDP_growth", "Population")



# new tibble name
GDPbyCountry <- countries

#clean thecolumns by removing comma (,), dollar sign ($), and the percent (%) symbols.
GDPbyCountry$GDP <- str_replace_all(GDPbyCountry$GDP, ",|\\$|%", "" )
GDPbyCountry$GDP_growth <- str_replace_all(GDPbyCountry$GDP_growth, "%", "")
GDPbyCountry$Population <- str_replace_all(GDPbyCountry$Population, ",", "" )

#Convert 3 columns into numeric datatype
GDPbyCountry <- GDPbyCountry %>%
  mutate(GDP=as.numeric(GDP),
         GDP_growth=as.numeric(GDP_growth),
         Population=as.numeric(Population))
  


#Code for the third visualisation
GDPbyCountry %>% 
  select(Population,GDP_growth,Country) %>% # select columns of interest
  arrange(desc(Population)) %>% #arrange rows in order of descending population
  head(5) %>% # take top 5 populous countries
  ggplot(aes(x=Population,y=GDP_growth))+
    geom_point(color="red", size=3)+  #scatter plot to visualize relationship between two continuous varibles
    geom_text(aes(label = Country), nudge_y = 0.15) + #Add country name to each point
    ggtitle("GDP growth rate of top-5 populous nations")+ #title
    xlab("Population")+
    ylab("GDP growth rate")

  
  




