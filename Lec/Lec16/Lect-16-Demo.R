library(tidyverse)
#library(stringr)
install.packages("htmlwidgets")
library(htmltools)

x <- "Handling text data is fun!"
x <- c("Handling", "Text", "data", "is", "fun!")

s <- "Data Science is an exciting field!"
s
s <- 'To put a "quote" inside a string, use single string'
s
writeLines(s)

# str_length() shows the number of characters
s <- "Data Science is an exciting field!"
str_length(s)

# str_c() combines strings
str_c("Data","Science")
str_c("Data","Science", sep = " ")

#str_sub extracts part of a string (substring)
x <- c("Banana", "Apple", "Pear")
str_sub(x, 3, 5)
str_sub(x, 1, 6)

# Trimming and sorting
str_trim(" Hello World ")
str_trim(" Hello World ", side = "left")
str_trim(" Hello World ", side = "right")

str_sort(x)
str_sort(x, decreasing = TRUE)

## Basics of regular expression
x <- c("Banana", "Apple", "Pear")
str_view(x, "an")
str_view(x, "e")
str_view_all(x, "a")

str_view(x, ".a.")
str_view(x, "^A")
str_view(x, "r$")
str_view(x, "^A...e$")

x <- c("COMP 120", "36 students")
str_view(x, "\\d")
str_view_all(x, "\\d")
str_view_all(x, "\\s")
str_view_all(x, "[ABC]")
str_view_all(x, "[^ABC]")

# Detecting the presence of patterns
x <- c("Banana", "Apple", "Pear")
str_detect(x, "e")
str_detect(x, "^B")
sum(str_detect(x, "[pP]"))
mean(str_detect(x, "[LMNOP]"))

# Extracting substrings with patterns
x <- c("Banana", "Apple", "Pear")
str_subset(x, "a")
str_extract(x, "[aeiou]")
str_extract_all(x, "[aeiou]")