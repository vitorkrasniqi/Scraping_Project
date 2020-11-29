
library(tidyverse)
library(rvest)
library(here)
library(robotstxt)
library(readr)
library(sqldf)
library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)
library(rtweet)

# Sys.sleep(2)



rbt <- robotstxt::get_robotstxt("https://www.watson.ch/Coronavirus")
rbt

rbt_path_allowed <- robotstxt::paths_allowed("https://www.watson.ch/Coronavirus")
rbt_path_allowed

