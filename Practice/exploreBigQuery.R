install.packages("bigrquery")
library(bigrquery)

# Store the project id
projectid = 'first-project-bigquery-281008'

# Set your query
sql <- "SELECT * 
        FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
        LIMIT 10"

# Run the query and store the data in a dataframe
df <- query_exec(sql, projectid, use_legacy_sql = FALSE)

# Print the query result
df
