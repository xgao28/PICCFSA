# Purpose: Downloads the data from opendatatoronto API. 
# Source: https://open.toronto.ca/dataset/persons-in-crisis-calls-for-service-attended/
# Author: Xinxiang Gao
# Date: 23 September 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT


library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("persons-in-crisis-calls-for-service-attended")

# get all resources for this package
resources <- list_package_resources("persons-in-crisis-calls-for-service-attended")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
write.csv(data, "data/raw_data/raw_piccfsa.csv",  row.names = F)

