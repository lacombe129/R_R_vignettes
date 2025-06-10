library(geosphere)

dv <- function(lat1, lon1, lat2, lon2) {
  d <- distVincentyEllipsoid(c(lat1, lon1), c(lat2, lon2))
  miles <- d/1609.344 
  return(miles)
}
dv <- Vectorize(dv)