install.packages("rvest")
install.packages("tidyverse")
install.packages("janitor")
install.packages("corrplot")

library(tidyverse)  # for data wrangling
library(janitor)  # for data cleaning
library(rvest)      # for web scraping
library(corrplot)   # correlation plots

scrape_stats <- function(season){
  #scrape
  #clean
  return(player_stats)
}

url <- "https://www.basketball-reference.com/leagues/NBA_2017_totals.html"
stats <- url %>% 
  read_html() %>% #read html or xml
  html_table() %>% #parse an html table into a dataframe
  .[[1]]

str(stats)#str function provides summary of stats dataframe
attach(stats)

#All the data is character type. This is because the html table contains the header every 20 lines. 
#So in the next step, we will get rid of this lines and also use the janitor package to do some basic 
#cleaning such as fixing the column names. Additionally, we clean the data by turning the stats to numeric 
#variables and NA to 0.

stats <- stats %>% 
  remove_empty_cols() %>%  #if any exist
  clean_names() %>%        # all column names to lower case and removing "%"
  dplyr::filter(!player=="Player") %>%  #delete headers in data frame, :: is another way to reference a function
  mutate_at(vars(-c(player,tm,pos)),as.numeric) %>% #turn all stat cols to numeric
  mutate_at(vars(-c(player,tm,pos)), funs(replace(., is.na(.), 0))) %>% #turn NA to 0
  as_tibble()
str(stats)

stats <- stats %>% 
  group_by(player) %>% 
  slice(1) %>%
  ungroup()

#################
#Full Function

scrape_stats <- function(season = 2018){
  #total stats
  #scrape
  url <- paste0("https://www.basketball-reference.com/leagues/NBA_",season,"_totals.html")
  stats_tot <- url %>% 
    read_html() %>% 
    html_table() %>% 
    .[[1]]
  
  #clean
  player_stats_tot <- stats_tot %>% 
    remove_empty_cols() %>%
    clean_names() %>% 
    dplyr::filter(!player=="Player") %>%
    mutate_at(vars(-c(player,tm,pos)),as.numeric) %>% 
    mutate_at(vars(-c(player,tm,pos)), funs(replace(., is.na(.), 0))) %>% 
    as_tibble() %>% 
    group_by(player) %>% 
    slice(1) %>% 
    ungroup() %>% 
    select(-rk)
  
  #per minute
  url <- paste0("https://www.basketball-reference.com/leagues/NBA_",season,"_per_minute.html")
  stats_pm <- url %>% 
    read_html() %>% 
    html_table() %>% 
    .[[1]]
  
  player_stats_pm <- stats_pm %>% 
    remove_empty_cols() %>%
    clean_names() %>% 
    dplyr::filter(!player=="Player") %>%
    mutate_at(vars(-c(player,tm,pos)),as.numeric) %>% 
    mutate_at(vars(-c(player,tm,pos)), funs(replace(., is.na(.), 0))) %>% 
    as_tibble() %>% 
    group_by(player) %>% 
    slice(1) %>% 
    ungroup() %>% 
    rename_at(vars(9:29),funs(paste0(.,"_pm"))) %>% 
    select(-rk)
  
  #advanced
  url <- paste0("https://www.basketball-reference.com/leagues/NBA_",season,"_advanced.html")
  stats_adv <- url %>% 
    read_html() %>% 
    html_table() %>% 
    .[[1]]
  
  player_stats_adv <- stats_adv %>% 
    remove_empty_cols() %>%
    clean_names() %>% 
    dplyr::filter(!player=="Player") %>%
    mutate_at(vars(-c(player,tm,pos)),as.numeric) %>% 
    mutate_at(vars(-c(player,tm,pos)), funs(replace(., is.na(.), 0))) %>% 
    as_tibble() %>% 
    group_by(player) %>% 
    slice(1) %>% 
    ungroup() %>% 
    select(-rk)
  
  player_stats <- full_join(player_stats_tot,player_stats_pm,
                            by = c("player", "pos", "age", "tm", "g", "gs", "mp")) %>% 
    full_join(player_stats_adv,
              by = c("player", "pos", "age", "tm", "g", "mp"))
  return(player_stats)
}

a <-scrape_stats(2018)
