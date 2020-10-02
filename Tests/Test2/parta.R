cases_data <- tibble(
  country_id = 1:4,
  name = c("NZ", "AU", "Italy", "US"),
  cases_count = c(12314,1244,5155,1555),
  population = c(12415,515,5,5135),
  region = c("Oceania", "Oceania", "Europe", "America")
)
cases_data

cases_data %>% 
  summarise(ave = mean(cases_count),
            aver = mean(population))

cases_data %>% 
  mutate(colony = c("Y", "Y", "N", "Y")) %>% 
  group_by(colony) %>% 
  summarise(total_cases = sum(cases_count))

cases_data %>% 
  select(-region) %>%
  filter(name == c("NZ","AU")) %>% 
  gather(cases_count, population, key = "vari", value = "count") %>% 
  spread(key=vari, value=count) %>% 
  
