### COMP120 - Mastery Tasks 04
#==============================
# Student ID: Son Hoang Nguyen
# Name: 5120768
#==============================
# Make sure you write comments about what your code does above each block of code.
# Not writing good comments for each code block will attract a penalty of 5% (0.15 out of 3). 
library(tidyverse)
spiral <- read_csv("spiral.csv")

# Exercise 1 - Code for the Base R plot
## plot a scatter plot of x and y, color each point by the varible group
with(spiral, plot(x,y,
                  pch=19,
                  col=ifelse(group == "A", "orange", "purple")))

legend("topleft",title="Group",
       ## the legend position - the top-left corner,
       c("A", "B"), ## the legend text
       pch=19, ## point style to use for the legend (solid dots)
       col=c("orange", "purple"), ## the colours to use for each dot
       ## in the legend
       bty="n" ## don't display a box around legend
)


# Exercise 2a - Code for the scatter plot of student grades vs. tutorial marks in INFO204
## load file into tibble
info.204 <- read_tsv("INFO204-2017-results-mod.tsv", na="?")
info.204$Gender <- factor(info.204$Gender, 
                          levels=c("F", "M", "U"), 
                          labels=c("Female", "Male", "Unspecified")) ##specify gender as a factor varible
info.204$Grade <- ordered(info.204$Grade, 
                          levels=c("E", "D", 
                                   "C-", "C", "C+",
                                   "B-", "B", "B+", 
                                   "A-", "A", "A+")) ## specify that grade has orders

## using ggplot, specify x=Grade, y=Tutorials, geom_point() creates scatter plot
ggplot(data = info.204, aes(Grade, Tutorials))+
  geom_point(aes(colour=Internal))+
  ggtitle("Were Tutorials Effective in INFO204 in 2017")

# Exercise 2b - Provide the answer the question "Were tutorials effective in INFO204
# in 2017?" in the form a comment below
## from the chart, we can observe that those who did well on Tutorials tend to have better grades
## a cluster of those who did badly in Tutorials (Tutorials mark below 2), tend to have bad grades at the end.
## There is a moderately positive corelation between Tutorials marks and final grades.



# Exercise 3 - Code for the box plot
ggplot(data = iris)+ ## use iris data
  geom_boxplot(mapping = aes(Species, Petal.Width, col=Species))+ #use boxplot geom, x=Species, y=Petal Width, color differently by Species
  ggtitle("Boxplot of petal width of three iris species") #title




# Exercise 4 - Code for the plot with multiple geoms
## use iris data, map x=sepal length, y=petal length,  color data point, and line by Species
ggplot(data = iris, aes(Sepal.Length, Petal.Length,color=Species))+
  geom_point()+
  geom_smooth()+
  ggtitle("A scatter and line plot of Sepal length vs. Petal length") # title
  



# Exercise 5
corona_df <- read_csv("coronavirus_dataset.csv")
stat(corona_df)

#5a - Code for the plot that shows the total number of cases in each DHB. 
dhb_br <- ggplot(data = corona_df)+
            geom_bar(mapping = aes(DHB))+
            xlab("District Health Boards (DHBs)")+
            ylab("infection count")+
            ggtitle("Coronavirus infections per District Health Board(DHB)")

dhb_br + coord_flip()



#5b - Code for the plot that shows coronavirus infection counts per age group across New Zealand.
corona_df$Age_group <- factor(corona_df$Age_group, 
                              levels = c("<1", "1 to 4", "5 to 9", "10 to 14", 
                                         "15 to 19", "20 to 29" ,"30 to 39", 
                                         "40 to 49", "50 to 59", "60 to 69", "70+")).
ggplot(data = corona_df)+
  geom_bar(mapping = aes(Age_group))+
  ggtitle("Coronavirus infection counts per age group")+
  ylab("Infection count")+
  xlab("Age groups")


#5c - Code for the plot showing the counts of confirmed and probable cases across New Zealand split for each sex (male and female).
corona_df$Overseas_travel <- factor(corona_df$Overseas_travel, 
                                    levels=c("Yes", "No", "NA"), 
                                    labels=c("Yes", "No", "Unspecified"))
ggplot(data = corona_df)+
  geom_bar(mapping = aes(Status, 
                         fill=Overseas_travel), position = 'dodge')+
  ggtitle("Status counts based on whether a case traveled overseas")+
  ylab("Count")+
  xlab("Status")+
  theme(legend.position="bottom") ## legend is set at the bottom






