library(tidyverse)
library(Imap)
library(geosphere)

haversine_distance <- function(lat1, lon1, lat2, lon2) {
  R <- 3958.8  # Earth radius in miles
  
  # Convert degrees to radians
  to_rad <- function(deg) deg * pi / 180
  
  dlat <- to_rad(lat2 - lat1)
  dlon <- to_rad(lon2 - lon1)
  
  lat1 <- to_rad(lat1)
  lat2 <- to_rad(lat2)
  
  a <- sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlon / 2)^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  
  R * c
}

landmarks <- read_csv('/Users/codeboss/projects/p1/data/cbus_landmarks.csv')
cbus_airbnb <- read_csv('/Users/codeboss/projects/p1/data/Columbus_listings.csv')
cbus_airbnb <- cbus_airbnb %>% mutate(price_float = as.numeric(str_replace_all(price, "[$,]","")))

airbnb_lat_lng <- cbus_airbnb %>% select('id', 'latitude', 'longitude')
landmarks[['zipper']] = 1 
airbnb_lat_lng[['zipper']] = 1 


loc_pairs <- left_join(airbnb_lat_lng, landmarks, join_by(zipper == zipper), suffix = c("_listing", "_landmark"), relationship = "many-to-many")

distances <- loc_pairs %>% mutate(distance = gdist(long1, lat1, long2, lat2, units="miles"))

# you can try this one, but is it the same? 
# distances <- loc_pairs %>% mutate(distance = haversine_distance(long1, lat1, long2, lat2))

nearest <- distances %>% group_by(id) %>% arrange(distance) %>% summarise(nearest_landmark=first(landmark), distance=first(distance))

rejoined <- cbus_airbnb %>% left_join(nearest, join_by(id == id)) %>% select(nearest_landmark, distance, price_float)

ggplot(rejoined, aes(x = distance, y = price_float, color = nearest_landmark)) + geom_point() + labs(x = "Distance", y = "Price", title = "Distance and Price Comparison") + geom_smooth(method = "lm", color = "blue")