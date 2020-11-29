page<- (1:38)
urls <- vector(mode = "list", length = 38)
for (i in 1:length(page)) {
  url<- paste0("https://www.watson.ch/Coronavirus/?page=",page[i])
  urls[[i]] <- url
}



tbl <- list()
j <- 1

for (j in seq_along(urls)) {
  Sys.sleep(2)
  tbl[[j]] <-  urls[[j]] %>%  read_html() %>% 
    html_nodes(css ='.teaserlink') %>% html_attr('href' , default = "NoLInk" )
  j <- j+1                  
}
tbl




link <- tbl
link<- unlist(link)
link <- as.data.frame(link)
link <- link %>% filter(!str_detect(link, "^h"))
link <- paste("https://www.watson.ch" ,link$link, sep = "")


tbl_article <- as.data.frame(link )
tbl_article$ID <- seq.int((1 : length(link)))
tbl_article$link <- as.character(tbl_article$link)

str(tbl_article)
view(tbl_article)









































