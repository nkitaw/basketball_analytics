#Installing package and bringing in library

devtools::install_github("abresler/nbastatR")

library(nbastatR)

#Usage TS% Graphs

first_table <- bref_players_stats(seasons = 2020, tables = c("advanced", "totals"),
                   include_all_nba = F, nest_data = FALSE,
                   assign_to_environment = TRUE, widen_data = TRUE, join_data = TRUE,
                   return_message = TRUE)




second_table <- first_table %>% select( namePlayer, slugPosition, slugTeamBREF, pctTrueShooting, pctUSG, minutesTotals) %>%
                                          filter(minutesTotals >= 100) 

write_xlsx(x = second_table, path = "usage.xlsx", col_names = TRUE)
