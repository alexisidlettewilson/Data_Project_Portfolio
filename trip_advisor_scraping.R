install.packages("tidyverse")
install.packages("rebus")
install.packages("lubridate")

library(tidyverse)
library(rebus)
library(lubridate)
library(stringr)
library(rvest)

url="http://fun4firstcoastkids.com/calendar/eventsbyday/2018/10/29/-"
getHTML <- read_html(url)
HTMLnodes <- html_nodes(getHTML,'.ev_link_row')
titles <- as.data.frame(html_text(HTMLnodes))
head(titles)

HTMLnodesTime <- html_nodes(getHTML,'.f4us_time')
eventTime <- as.data.frame(html_text(HTMLnodesTime))
head(eventTime)

HTMLnodesCost <- html_nodes(getHTML, '.f4us_cost')
eventCost <- as.data.frame(html_text(HTMLnodesCost))
head(eventCost)

## unresolved
events102918 <- cbind(titles, eventTime, eventCost)
head(events102918)


