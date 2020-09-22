library(tidyverse)

## LIST
my.list <- list(paper="COMP 120", year=2019, data=rnorm(50))
str(my.list)

empty.list <- list()
empty.list$X <- "New Element"
empty.list

my.list$data <- rnorm(10)
my.list$sequence <- seq(0, 1, 0.2)
my.list

my.list$year <- NULL
my.list$data <- NULL
my.list

my.list[[1]]
my.list[[2]][3]
my.list[["paper"]]


## DATA FEAME
new.df <- data.frame(id=rep(seq(5), times=2), value=rnorm(10),
                     constant=1)
new.df

#drop column
new.df$constant <- NULL

#create columns
new.df$value <- rnorm(10)
new.df$other <- sample(1:1000, 10) # samples 10 values from 1:1000

new.df[c(1,3,5), ] ## notice the comma! Nothing AFTER the comma is
## shorthand for "all columns"
new.df[ , c(1,3)]  ## notice the comma! Nothing BEFORE the comma is
## shorthand for "all rows"
new.df[c(1, 10), c(2, 3)]

new.df["other"]
new.df$other
new.df[3]

new.df[seq(0,nrow(new.df),2),]

## Loading and Writing 
INFO204 <- read_delim("INFO204-2017.tsv", delim="\t", na="?")
INFO204

write_delim(INFO204, "INFO204-revised.tsv", delim="\t", na="?")
write_csv(INFO204,"INFO204-CSV.csv", na="?")
write_tsv(INFO204,"INFO204-TSV.tsv", na="?")

marital_status <- c('single', 'married', 'separated', 'divorced', 'widowed')
marital_status_factor <- factor(marital_status)
str(marital_status_factor)
