rt <- search_tweets(
  "rstats community", n = 1000, include_rts = FALSE, 
)

rt$text



watson_tweets <- get_timeline("watson_news", n = 3200)
ts_plot(watson_tweets , "days")


usr <- lookup_users("watson_news")
usr$user_id
usr$profile_url


all_tweets <-  get_timeline("watson_news", n = 3200)
all_tweets$text
tbl_article$title



# Prototyp
a <- dplyr::filter(all_tweets , grepl(tbl_article$title[1000],text, fixed=TRUE))

tweets_merge <- list()
tweets_merged <- list()
j <- 1

for (j in 1:length(tbl_article$title))  {
  
  tweets_merge[[j]] <- as.data.frame(dplyr::filter(all_tweets , grepl(tbl_article$title[j],  text, fixed=TRUE)) )[1:5]

  
  
  j <- j+1     
}



Data_<- bind_rows(tweets_merge, .id = "column_label")








