# Purpose: Cleans the raw data after download
# Author: Xinxiang Gao
# Date: 23 September 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT

# read in the raw data
data <- read.csv("data/raw_data/raw_piccfsa.csv")

# removed unnecessary columns
data_1 <- data %>% janitor::clean_names() %>% 
  select(-x_id, -hood_140, -neighbourhood_140)

# Factor day of week and month for correct ordering
data_1$event_dow <- factor(data_1$event_dow, 
                         levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

month_levels <- c("January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December")

data_1$event_month <- factor(data_1$event_month, levels = month_levels)
  
# outoput as processed data
write.csv(data_1, "data/analysis_data/piccfsa.csv", row.names = F)
  
