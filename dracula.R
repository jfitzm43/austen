library(tidytext)
library(dplyr)
library(gutenbergr)
library(wordcloud)

## sentiments
## get_sentiments('nrc')
## unique(nrc$sentiment)
## get_sentiments('bing')
## get_sentiments('afinn')

nrc<-get_sentiments('nrc')

nrc_fear<-nrc%>%
            filter(sentiment=='fear')

dracula<-gutenberg_download(345)

dracula_words<-dracula%>%
                  unnest_tokens(word,text)

dracula_fear_words<-inner_join(nrc_fear,dracula_words)

dfw_freq<-dracula_fear_words%>%
                        group_by(word)%>%
                        summarize(count=n())

wordcloud(dfw_freq$word,dfw_freq$count,min.freq=5)
