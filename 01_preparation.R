library(tidyverse)
library(rvest)
library(here)
library(RSelenium)
library(robotstxt)

Sys.sleep(5)

download.file(url = "https://www.watson.ch/Coronavirus/", 
              destfile = "data/coronavirus.html"
)


robottxt <- get_robotstxt("https://www.watson.ch/Coronavirus/" )
robottxt 
paths_allowed("https://www.watson.ch/Coronavirus/")

