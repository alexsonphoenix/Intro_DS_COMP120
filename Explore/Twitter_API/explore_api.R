install.packages("twitteR")
library(twitteR)
library(tidyverse)

setup_twitter_oauth(consumer_key = "#",
                    consumer_secret = "#",
                    access_token = "#",
                    access_secret = "#")

tweets <- userTimeline("Alexsonphoenix", n=3200)
my_tweets <- as_tibble(map_df(tweets, as.data.frame))

str(my_tweets)
