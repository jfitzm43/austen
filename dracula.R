library(tidytext)
library(dplyr)

## sentiments
## get_sentiments('nrc')
## get_sentiments('bing')
## get_sentiments('afinn')

nrc<-get_sentiments('nrc')

nrc_fear<-nrc%>%
            filter(sentiment=='fear')
