### COMP120 - Mastery Tasks 06
#==============================
# Student ID: Son Hoang Nguyen
# Name: 5120768 
#==============================
# Fill your details above. Your code for the mastery task should be provided below.
# Make sure you write comments about what your code does for each of the steps outlined in the mastery task description.
# Also, make sure you've included the code to load appropriate libaries (e.g. tidyverse and lubridate).

library(tidyverse)
library(lubridate)

# Step 1
bp = read_csv("BloodPressure-modified.csv") # load file into bp tibble.
bp$MeasurementDate <- dmy_hm(bp$MeasurementDate) # convert character column to datetime column.

bp
# Step 2
bp <- bp %>% 
  select(MeasurementDate, SYS, DIA, Pulse) #  keep just the MeasurementDate, SYS, DIA, and Pulse columns


# Step 3
bp <- bp %>% 
  filter(!is.na(Pulse)) # keep only the rows where the value in the Pulse column is not NA


# Step 4
bp.perday <- bp %>%   # Create a new data frame called bp.perday 
                mutate(MeasurementDate = as_date(MeasurementDate)) %>%  # remove the time component from MeasurementDate
                group_by(MeasurementDate) %>% # group_by date
                summarise(SYS = mean(SYS), # summarising the result and computing the mean of the SYS, DIA and Pulse 
                          DIA = mean(DIA),
                          Pulse = mean(Pulse))
bp.perday

# Step 5
bp.perday <- bp.perday %>% 
  mutate(Rating = ifelse(SYS>130|DIA>85, "High", "Normal")) # Create a Rating column based on values of SYS and DIA columns


# Step 6
bp.perday %>% 
  ggplot(aes(x=MeasurementDate, y=Pulse)) + #map the x, and y axis
    geom_linerange(aes(ymin = DIA, ymax = SYS, colour = Rating)) + # graph the verticle line based on a range between DIA, and SYS, color differently by Rating
    geom_point() +  # graph the points geom object
    xlab("Measurement date")


# Step 7
bp.gathered <- bp.perday %>% # Create a new tibble to store long format blood pressure data per day
  pivot_longer(c(DIA,Pulse,SYS), names_to="Stat",values_to="Reading") # gather 3 columns into 1 column

bp.gathered

bp.gathered %>% 
    ggplot(mapping = aes(x=MeasurementDate,y=Reading)) +  # map the x, y axis
      geom_point(aes(color=Stat))+ #graph the geom point object
      geom_smooth(aes(color=Stat))+ #graph the smooth line object
      xlab("Date")
           

