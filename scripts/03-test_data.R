# Purpose: Test and validate the simulated data 
# Author: Xinxiang Gao
# Date: 26 September 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT

library(tidyverse)
library(lubridate)

data <- read.csv("data/raw_data/simulated_piccfsa.csv")

# date in range
start_time <- as_date("2014-01-01")
end_time <- as_date("2024-06-30")
test_date_range <- all(data$EVENT_DATE >= start_time & data$EVENT_DATE <= end_time)

# months are correctly generated
month_levels <- c("January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December")
test_month_range <- all(data$EVENT_MONTH %in% month_levels)

# day of weeks are correctly generated
dow_levels <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
test_dow_range <- all(data$EVENT_DOW %in% dow_levels)

# types are correctly generated
type_levels <- c("Suicide-related", "Overdose", "Person in Crisis")
test_type_range <- all(data$EVENT_TYPE %in% type_levels)

print(c(test_date_range, test_month_range, test_dow_range, test_type_range))

