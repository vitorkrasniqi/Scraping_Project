tbl_article <- read_csv("data/tbl_article.csv")
tbl_article <- as.data.frame(tbl_article)





tbl_article_aggregated <-  sqldf("select publish_date, count(ID) as count_articles 
            from tbl_article
            group by publish_date
            ")





tbl_article_aggregated <- as.data.frame(tbl_article_aggregated)
tbl_article_aggregated$publish_date <- as.Date(tbl_article_aggregated$publish_date ,  "%d.%m.%Y")
tbl_article_aggregated
str(tbl_article_aggregated )


# Usual area chart
plot_count_articles <- tbl_article_aggregated  %>%
  ggplot( aes(x=publish_date, y=count_articles)) +
  geom_area(fill="#69b3a2", alpha=0.5) +
  geom_line(color="#69b3a2") +
  ylab("Number of corona posts per day") +
  theme_ipsum()

# Turn it interactive with ggplotly
plot_count_articles <- ggplotly(plot_count_articles )
plot_count_articles