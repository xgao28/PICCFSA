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

# Define parameters for the simulation
num_rows <- 1000  # Total number of events to simulate

# Generate simulated data
simulated_data <- data.frame(
  OBJECTID = 1:num_rows,
  EVENT_ID = sample(1000000:27000000, num_rows, replace = FALSE),
  EVENT_DATE = as.Date("2014-01-01") + sample(0:3000, num_rows, replace = TRUE)
)
simulated_data <- simulated_data %>% 
  mutate(EVENT_YEAR = year(EVENT_DATE),
         EVENT_MONTH = month(EVENT_DATE, label = TRUE, abbr = FALSE),
         EVENT_DOW = wday(EVENT_DATE, label = TRUE, abbr = FALSE),  # Day of week
         EVENT_HOUR = sample(0:23, num_rows, replace = TRUE),  # Random hour
         EVENT_TYPE = sample(c("Suicide-related", "Overdose", "Person in Crisis"), num_rows, replace = TRUE),
         HOOD_158 = sample(1:174, num_rows, replace = TRUE)) %>% 
  mutate(NEIGHBOURHOOD_158 = paste("Neighborhood", HOOD_158))

# Print the first few rows of the simulated data to check
print(head(simulated_data))

# Save the simulated dataset to a CSV file
write.csv(simulated_data, "data/raw_data/simulated_piccfsa.csv", row.names = FALSE)
