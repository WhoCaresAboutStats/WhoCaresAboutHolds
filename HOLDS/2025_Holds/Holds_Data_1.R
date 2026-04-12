library(tidyverse)
library(dplyr)
library(mlbplotR)
library(ggplot2)

# average_row = X2025_Holds_DS1 %>%
#   summarize(across(where(is.numeric), mean, na.rm = TRUE), .groups = 'drop') %>%
#   mutate(Player = "Average") # Add a label for the new row
# 
# fangraphs_leaderboards_1_ = read_csv("fangraphs-leaderboards (1).csv")
# 
# fangraphs_leaderboards_QHLD = fangraphs_leaderboards_1_ %>%
#   filter(HLD >= 5)
# fangraphs_leaderboards_QHLD
# 
# average_fg = fangraphs_leaderboards_QHLD %>%
#   summarize(across(where(is.numeric), mean, na.rm = TRUE), .groups = 'drop') %>%
#   mutate(Name = "Average")
# 
# fangraphs_leaderboards_QHLD = fangraphs_leaderboards_QHLD %>%
#   mutate(WHIP = (H + BB) / IP)
# fangraphs_leaderboards_QHLD

teams_colors_logos <- mlbplotR::load_mlb_teams() |> 
  dplyr::filter(!team_abbr %in% c("AL", "NL", "MLB")) |> 
  dplyr::mutate(
    a = rep(1:6, 5),
    b = sort(rep(1:5, 6), decreasing = TRUE)
  )
teams_colors_logos

ggplot2::ggplot(teams_colors_logos, aes(x = a, y = b)) +
  mlbplotR::geom_mlb_logos(aes(team_abbr = team_abbr), width = 0.075) +
  ggplot2::geom_label(aes(label = team_abbr), nudge_y = -0.35, alpha = 0.5) +
  ggplot2::theme_void() 

