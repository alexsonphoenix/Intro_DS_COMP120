### COMP120 - Mastery Tasks 05
#==============================
# Student ID: 5120768 
# Name: Son Hoang Nguyen
#==============================
# Your code for the mastery task should be provided below. 
#Make sure you write comments about what your code does for each of the steps
#(steps 2-6 oulined in the mastery task description) in this mastery. 
# Not writing good comments will attract a penalty of 5% (0.15 out of 3). Writing good
# comments improves the readability of the code (i.e., anyone who looks at your solution at a later point in time will understand your code better - including yourself!)

## Code for the first question should be provided below. Note there are several steps for this question. Provide code
## for each step in the placeholder provided below.
library(tidyverse)
library(lubridate)
  # Step 2
  # Load csv file BloodPressure into bp tibble
  bp <- read_csv("BloodPressure.csv", na = c("TH","TL"))
  
  
  # Step 3
  # convert character type column MeasurementDate into date time type column.
  bp$MeasurementDate <- dmy_hm(bp$MeasurementDate)
  
  
  # Step 4
  # Replace some values contain character, and convert the whole column into numeric type
  bp$Pulse <- str_replace(bp$Pulse," EST","")
  bp$Pulse <- as.numeric(bp$Pulse)
  bp
  
  # Step 5
  # Create SYS.Class, DIA.CLass columns based on value of the existing SYS and DIA columns, and another Rating column
  bp <-  mutate(bp,
            SYS.Class = cut(SYS, breaks = c(0,90,120,140,Inf), right = FALSE, 
                                    labels = c("Low", "Normal", "Elevated", "High")),
            DIA.Class = cut(DIA, breaks = c(0,60,80,90,Inf), right = FALSE,
                            labels = c("Low", "Normal", "Elevated", "High")),
            Rating = factor(ifelse((SYS.Class=="High"|DIA.Class=="High"), "High", "Normal"))
        )
  bp
  
  
  # Step 6
  #restrict the data frame to rows with a MeasurementDate before the 1st of December 2017 
  filtered_data <- bp %>% 
                    filter(as_date(MeasurementDate) < dmy("01-12-2017"))
  
  
  # Step 7
  ggplot(data = filtered_data, aes(x = MeasurementDate, y = Pulse)) + 
    geom_linerange(aes(ymin = DIA, ymax = SYS, colour = Rating)) + 
    geom_point() + 
    xlab("Measurement date")
  

## Code for the second question should be provided below.

  # Q2a
  # display all rows where the value in the SYS column is greater than or 
  # equal to 100 and the value for DIA column is greater than 75
  filtered_data %>% 
    filter(SYS>=100 & DIA >75) %>% 
    arrange(desc(Pulse))



  # Q2b
  #display values of just two columns (MeasurementDate and Rating) 
  #where the value of Rating is High
  filtered_data %>% 
    mutate(newcol = as_date(MeasurementDate)) %>% 
    select(newcol, Rating) %>% 
    filter(Rating == "High")
  
  #Note: I tried to use as_date() function inside select(), but it did not work, 
  #       so I created a new column using mutate().
  

