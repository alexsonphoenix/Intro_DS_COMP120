### This is the demo file corresponding to Trump's Tweet Analysis presented in Lecture 16.
library(tidyverse)
library(lubridate)

# Reading data into a tibble
trump_tweets_tbl <- read_csv("trump_tweets.csv")
trump_tweets_tbl

str(trump_tweets_tbl)
#trump_tweets_tbl$statusSource

summary(trump_tweets_tbl$created)

# Selecting four columns of interest and creating a new column called source that contains whether the tweet came from Android phone or iPhone
tweets <- trump_tweets_tbl %>%
  select(id, statusSource, text, created) %>%
  filter(str_detect(statusSource,  "iPhone")|str_detect(statusSource,  "Android")) %>%
  mutate(source = ifelse(str_detect(statusSource, "iPhone"), "iPhone", "Android"))

# Plot of tweets counts from iPhone vs. Android phone
ggplot(tweets) + 
  geom_bar(aes(source, fill = source)) +
  ggtitle("Tweet counts from Android phone vs. iPhone")

# Creating results grouped by hour and summarized based on counts
tweets_by_hour <- tweets %>% 
    group_by(source, hour = hour(with_tz(created, "EST"))) %>%
    summarize(count = n())

# Visualizing counts of tweets by hour from the two phones
ggplot(tweets_by_hour) +
  geom_line(aes(x = hour, y = count, col = source)) + 
  ggtitle("Tweet patterns from two phones at different times of the day")

# Tweets with quote counts
tweet_quote_counts <- tweets %>%
  mutate(quote_status = ifelse(str_detect(text, '^"'), "Quote" , "No Quote")) %>%
  count(source, quote_status)

# Visualisation of quote vs. no quote counts from the two phones
ggplot(tweet_quote_counts) +
  geom_bar(aes(x = source, y = n, fill = quote_status), stat = "identity", position = "dodge") +
  xlab("Phones used") + 
  ylab("Counts of tweets") + 
  ggtitle("Quotes vs. No Quotes")

# Trump's picture tweet counts
tweet_picture_counts <- tweets %>%
  filter(!str_detect(text, '^"')) %>%
  count(source,
        picture = ifelse(str_detect(text, "t\\.co"),
                         "Picture/link", "No picture/link"))

# Visualisation of tweets counts with picture vs. no-picture (from two phones)
ggplot(tweet_picture_counts, aes(source, n, fill = picture)) +
  geom_bar(stat = "identity", position = "dodge") +
  ylab("Number of tweets") +
  ggtitle("Tweets from phones with/without pictures")

