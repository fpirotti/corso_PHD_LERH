#' grab some raster data from online files
#' Here we learn to wrangle strings coming from HTML
#' We need the RCurl package for this, which allows to deal with HTML
require("RCurl") 
#' below the url with the data - remember the final "/" 
url<-"https://www.cirgeo.unipd.it/shared/tmp/corsoPHD/worldClim/"
result <- getURL(url,verbose=TRUE,ftp.use.epsv=TRUE, dirlistonly = TRUE)
print(result)
#' OMG what is this?? It is HTML, i.e. XML which is a tagged language.
#'  we need another package 
library(XML)
links <-  grep(".tif$", getHTMLLinks(result), value=T)

download.file( file.path(url, links[[1]]), destfile = links[[1]] )

myFirstRaster <- terra::rast( links[[1]] )
summary(myFirstRaster)
plot(myFirstRaster)
hist(myFirstRaster)
