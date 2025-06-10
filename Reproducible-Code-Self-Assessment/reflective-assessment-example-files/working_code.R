library(tidyverse)
library(geosphere)

dv <- function(lat1, lon1, lat2, lon2) {
  d <- distVincentyEllipsoid(c(lat1, lon1), c(lat2, lon2))
  miles <- d/1609.344 
  return(miles)
}
dv <- Vectorize(dv)

landmarks <- read_csv('data/cbus_landmarks.csv')
cbus_airbnb <- read_csv('data/columbus_listings.csv')
cbus_airbnb <- cbus_airbnb %>% mutate(price_float = as.numeric(str_replace_all(price, "[$,]","")))

airbnb_lat_lng <- cbus_airbnb %>% select('id', 'latitude', 'longitude')
landmarks[['zipper']] = 1 
airbnb_lat_lng[['zipper']] = 1 

loc_pairs <- left_join(airbnb_lat_lng, landmarks, join_by(zipper == zipper), suffix = c("_listing", "_landmark"), relationship = "many-to-many")
distances <- loc_pairs %>% mutate(distance = dv(latitude_listing, longitude_listing, latitude_landmark, longitude_landmark)) 
nearest <- distances %>% group_by(id) %>% arrange(distance) %>% summarise(nearest_landmark=first(landmark), distance=first(distance))
rejoined <- cbus_airbnb %>% left_join(nearest, join_by(id == id)) %>% select(nearest_landmark, distance, price_float)

ggplot(rejoined, aes(x = distance, y = price_float, color = nearest_landmark)) + geom_point() + geom_smooth(method = "lm", color = "black")