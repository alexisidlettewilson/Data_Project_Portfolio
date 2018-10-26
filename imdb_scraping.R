## rvest package
require(rvest)
url <- 'https://www.imdb.com/chart/top'

##read html from the page
pagehtml <- read_html(url)

##use css selectors to pull data elements
rankTitle_html <- html_nodes(pagehtml, '.titleColumn')
rankTitle <- html_text(rankTitle_html)
head(rankTitle)

rank_html <- html_nodes(pagehtml, '.imdbRating')
rank <- html_text(rank_html)
head(rank)

##combine the two result sets
chartTop <- as.data.frame(cbind(rankTitle, rank))
head(chartTop)
class(chartTop)
str(chartTop)

## remove line breaks
## plot data
