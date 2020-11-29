page<- (1:38)
urls <- list()


for (i in 1:length(tbl_article$link)) {
  url<- tbl_article$link[i]
  urls[[i]] <- url
}




tbl_1 <- list()
titles <- list()
publish_date <- list()
j <- 1

for (j in seq_along(urls)) {
  Sys.sleep(2)
  tbl_1[[j]] <-  tbl_article$link[j] %>%  read_html() %>% 
    html_nodes('.maintitle') %>% html_text()
  titles[[j]] <- tbl_1[[j]][1]
  
  
  tbl_1[[j]] <-  tbl_article$link[j] %>%  read_html() %>% 
    html_nodes('.publish_date') %>% html_text()
  publish_date[[j]] <-  paste( substring(tbl_1[[j]], 1, 8)  ,"20", sep = "")
 
  j <- j+1                    
}


# titles <- titles[1:10]
# publish_date <- publish_date[1:10]
# tbl_article <- tbl_article[1:10, ]
# view(tbl_article)


# 
# > length(titles)
# [1] 1154
# > length(publish_date)
# [1] 1154

# > titles[1154]
# [[1]]
# [1] "Parlament genehmigt SwissCovid – so schnell soll die Corona-Warn-App starten"
# 
# > tbl_article[1154]
# Error in `[.data.frame`(tbl_article, 1154) : undefined columns selected
# > tbl_article$link[1154]
# [1] "https://www.watson.ch/digital/schweiz/257660600-schweizer-parlament-genehmigt-swisscovid-so-schnell-soll-app-starten"
# > 


tbl_article <- head(tbl_article, 1154)
tbl_article <- as.data.frame(tbl_article)



titles <- unlist(titles)
publish_date <- unlist(publish_date)

tbl_article$title <-  titles
tbl_article$publish_date <- publish_date
str(tbl_article)

write.csv(tbl_article,"/home/vitor/Documents/Uni/Scraping_Project/data/tbl_article.csv", row.names = TRUE)



#after some hours I just got the half


