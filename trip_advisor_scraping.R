install.packages("tidyverse")
install.packages("rebus")
install.packages("lubridate")

library(tidyverse)
library(rebus)
library(lubridate)
library(stringr)
library(rvest)

## studied TripAdvisor.com pages to determine results are grouped by 50
## https://www.tripadvisor.com/VacationRentals-g34438-Reviews-Miami_Florida-Vacation_Rentals.html
##https://www.tripadvisor.com/VacationRentals-g34438-Reviews-oa50-Miami_Florida-Vacation_Rentals.html
## https://www.tripadvisor.com/VacationRentals-g34438-Reviews-oa100-Miami_Florida-Vacation_Rentals.html


url1 <- ("https://www.tripadvisor.com/VacationRentals-g34438-Reviews")
url2 <- ("-Miami_Florida-Vacation_Rentals.html")
urlPages <- c("","oa50","oa100","oa150")

## Find the maximum number of pages
url="https://www.tripadvisor.com/VacationRentals-g34438-Reviews-Miami_Florida-Vacation_Rentals.html"
getHTML <- read_html(url)
HTMLnodes <- html_node(getHTML,'.vr_listing')
results <- html_text(HTMLnodes)
results
class(results)
