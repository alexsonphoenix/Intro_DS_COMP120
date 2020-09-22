install.packages("twitteR")
library(twitteR)
library(tidyverse)

setup_twitter_oauth(consumer_key = "jNQTETGDKIwr7LSClARr5wMH7",
                    consumer_secret = "Da8ORuc7hl5lPQA282aMTENGVEPFaPCVH6UEKJysCWJ7XDtCGm",
                    access_token = "859271553753554944-1ZF9KwYZbCrh7HrMM3JtBlU6am9rmZ4",
                    access_secret = "KeWT2WJEHjY13GC2BfEZtehD7MFXfobUhS6oh94ePu9k6")

tweets <- userTimeline("Alexsonphoenix", n=3200)
my_tweets <- as_tibble(map_df(tweets, as.data.frame))

str(my_tweets)
