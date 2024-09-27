# Purpose: Simulates the data similar to the expected dataset. 
# Author: Xinxiang Gao
# Date: 23 September 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT

# Load necessary libraries
library(tidyverse)
library(lubridate)

# Set a seed for reproducibility
set.seed(690)

num_rows <- 1000  # Total number of events to simulate

# Generate simulated data
simulated_data <- data.frame(
  objectid = 1:num_rows,
  event_id = sample(1000000:27000000, num_rows, replace = FALSE),
  event_date = as.Date("2014-01-01") + sample(0:3000, num_rows, replace = TRUE)
  ) %>% 
  mutate(event_year = year(event_date),
         event_month = month(event_date, label = TRUE, abbr = FALSE),
         event_dow = wday(event_date, label = TRUE, abbr = FALSE),  # Day of week
         event_hour = sample(0:23, num_rows, replace = TRUE),  
         event_type = sample(c("Suicide-related", "Overdose", "Person in Crisis"), num_rows, replace = TRUE),
         hood_158 = sample(1:174, num_rows, replace = TRUE)) %>% 
  mutate(neighbourhood_158 = paste("Neighborhood", hood_158))

# Print the first few rows of the simulated data to check
print(head(simulated_data))

# Save the simulated dataset to a CSV file
write.csv(simulated_data, "data/raw_data/simulated_piccfsa.csv", row.names = FALSE)

