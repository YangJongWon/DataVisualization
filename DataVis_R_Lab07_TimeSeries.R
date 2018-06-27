# Library
# install.packages("dygraphs")
library(dygraphs)
library(dplyr)
library(xts)          # To make the convertion data-frame / xts format

# Create data + verify it is date format + change them to xts format:
data=data.frame(time=seq(from=Sys.Date()-40, to=Sys.Date(), by=1 ), value=runif(41))
str(data$time)
data=xts(x = data$value, order.by = data$time)

# Default = line plot --> See chart #316

# Add points
dygraph(data) %>%
  dyOptions( drawPoints = TRUE, pointSize = 4 )


########### 2번째 
# Libraries
library(dygraphs)
library(xts) # To make the convertion data-frame / xts format

# Format 2: time is represented by a date.
data=data.frame(time=seq(from=Sys.Date()-40, to=Sys.Date(), by=1 ), value=runif(41))

# Your time column MUST be a time format!, check it out with str()
str(data)

# Then you can create the xts format, and thus use dygraph
don=xts(x = data$value, order.by = data$time)
dygraph(don)

### 3번째 
# Libraries
library(dygraphs)
library(xts) # To make the convertion data-frame / xts format

# Format 3: Several variables for each date
data=data.frame(time=seq(from=Sys.Date()-40, to=Sys.Date(), by=1 ), value1=runif(41), value2=runif(41)+0.7)
# Then you can create the xts format:
don=xts( x=data[,-1], order.by=data$time)
dygraph(don)