# Purpose: Cleans the raw data after download
# Author: Xinxiang Gao
# Date: 23 September 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT


data <- read.csv("data/raw_data/raw_piccfsa.csv")

data_1 <- data %>% janitor::clean_names() %>% 
  select(-x_id, -hood_140, -neighbourhood_140)
  
write.csv(data_1, "data/analysis_data/piccfsa.csv", row.names = F)
  
