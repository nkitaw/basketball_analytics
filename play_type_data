install.packages("devtools")
install.packages("rvest")
install.packages("tidyverse")
devtools::install_github("abresler/nbastatR")
install.packages("standardize")
library(tidyverse)
library(nbastatR)
library(ggplot2)
library(standardize)
library(scales)


data_a <- synergy(seasons = 2019, result_types = c("player"),
                  season_types = c("Regular Season"), set_types = c("offensive"
                  ), categories = c("Transition", "Isolation",
                                    "PRBallHandler", "PRRollman", "Postup", "Spotup", "Handoff", "Cut",
                                    "OffScreen", "OffRebound", "Misc"), results = 500,
                  assign_to_environment = TRUE, return_wide = F, nest_data = F,
                  return_message = TRUE)

#Isolation Table

isolation <- data_a[[5]][[2]]  
isolation <- as_tibble(isolation) 
isolation_a <- isolation %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

isolation_b <- filter(isolation_a, gp >=20 & possPerGame >=.8)

isolation_c <- isolation_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame), ppp_pct = percent_rank(ppp), play_type = "Isolation") %>%
    select(-c(poss,gp))




#Transition Table
transition <- data_a[[5]][[1]]  
transition <- as_tibble(transition)
transition_a <- transition %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

transition_b <- filter(transition_a, gp >=20 & possPerGame >=1)

transition_c <- transition_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame), ppp_pct = percent_rank(ppp), play_type = "Transition") %>%
  select(-c(poss,gp))



#Pick and Roll Ball Handler
pnroll_ballhandler <- data_a[[5]][[3]]  
pnroll_ballhandler <- as_tibble(pnroll_ballhandler)
pnroll_ballhandler_a <- pnroll_ballhandler %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

pnroll_ballhandler_b <- filter(pnroll_ballhandler_a, gp >=20 & possPerGame >=1)

pnroll_ballhandler_c <- pnroll_ballhandler_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Pick and Roll Ballhandler") %>%
  select(-c(poss,gp))

#Pick and Roll Rollman
pnroll_rollman <- data_a[[5]][[4]]  
pnroll_rollman <- as_tibble(pnroll_rollman)
pnroll_rollman_a <- pnroll_rollman %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

pnroll_rollman_b <- filter(pnroll_rollman_a, gp >=20 & possPerGame >=1)

pnroll_rollman_c <- pnroll_rollman_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Pick and Roll Rollman") %>%
  select(-c(poss,gp))

#Postup
postup <- data_a[[5]][[5]]  
postup <- as_tibble(postup)
postup_a <- postup %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

postup_b <- filter(postup_a, gp >=20 & possPerGame >=1)

postup_c <- postup_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Postup") %>%
  select(-c(poss,gp))

#Spotup
spotup <- data_a[[5]][[6]]  
spotup <- as_tibble(spotup)
spotup_a <- spotup %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

spotup_b <- filter(spotup_a, gp >=20 & possPerGame >=1)

spotup_c <- spotup_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Spotup") %>%
  select(-c(poss,gp))


#Handoff
handoff <- data_a[[5]][[7]]  
handoff <- as_tibble(handoff)
handoff_a <- handoff %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

handoff_b <- filter(handoff_a, gp >=20 & possPerGame >=1)

handoff_c <- handoff_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Handoff") %>%
  select(-c(poss,gp))


#Cut
cut <- data_a[[5]][[8]]  
cut <- as_tibble(cut)
cut_a <- cut %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

cut_b <- filter(cut_a, gp >=20 & possPerGame >=1)

cut_c <- cut_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Cut") %>%
  select(-c(poss,gp))

#OffScreen
offscreen <- data_a[[5]][[9]]  
offscreen <- as_tibble(offscreen)
offscreen_a <- offscreen %>% select(namePlayer, groupPosition, slugTeam, gp, poss, ppp, possPerGame) %>% 
  mutate_at(vars(ppp, possPerGame), funs(round(., 2))) 

offscreen_b <- filter(offscreen_a, gp >=20 & possPerGame >=1)

offscreen_c <- offscreen_b %>% arrange(desc(possPerGame)) %>% 
  mutate(poss_pct = percent_rank(possPerGame),ppp_pct = percent_rank(ppp), play_type = "Off Screen") %>%
  select(-c(poss,gp))



############
#Filter on Sixer Players
isolation_sixers <- filter(isolation_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
transition_sixers <- filter(transition_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
pnroll_ballhandler_sixers <- filter(pnroll_ballhandler_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
pnroll_rollman_sixers <- filter(pnroll_rollman_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
postup_sixers <- filter(postup_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
spotup_sixers <-filter(spotup_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
handoff_sixers <- filter(handoff_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
cut_sixers <- filter(cut_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")
offscreen_sixers <- filter(offscreen_c, namePlayer == "Josh Richardson" | namePlayer == "Joel Embiid" | namePlayer == "Ben Simmons" | namePlayer == "Al Horford" | namePlayer == "Tobias Harris")


#Bind rows
final_sixers <- bind_rows(isolation_sixers, transition_sixers, pnroll_ballhandler_sixers, pnroll_rollman_sixers, postup_sixers,
                          spotup_sixers, handoff_sixers, cut_sixers, offscreen_sixers)


#Final all data 
final_all <- bind_rows(isolation_c, transition_c, pnroll_ballhandler_c, pnroll_rollman_c, postup_c,
                       spotup_c, handoff_c, cut_c, offscreen_c)

install.packages("writexl")
library(writexl)

write_xlsx(x = final_all, path = "final.xlsx", col_names = TRUE)
