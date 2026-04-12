library(tidyverse)
library(mlbplotR)
library(ggplot2)
library(dplyr)
library(gghighlight)

#HLDSInWinvsLoss = HLDSInWinvsLoss[-31, ]

# HLDSInWinLoss = HLDSInWinLoss %>%
#   rename(
#     HLD_L = HLD_in_L,
#     HLD_W = HLD_in_W)

HLDSInWinvsLoss_Final_NoAv = HLDSInWinvsLoss_Sheet1_1_[-31, ]

teams_colors_logos <- mlbplotR::load_mlb_teams() |> 
  dplyr::filter(!team_abbr %in% c("AL", "NL", "MLB")) |> 
  dplyr::mutate(
    a = rep(1:6, 5),
    b = sort(rep(1:5, 6), decreasing = TRUE),
    # Keep alpha == 1 for teams that have an "A"
    alpha = ifelse(grepl("A", team_abbr), 1, 0.75),
    # Set teams that have an "E" to black & white
    color = ifelse(grepl("E", team_abbr), "b/w", NA) 
  )

HLDSInWinvsLoss_Final_NoAv
HLDbyWinsGraph = ggplot(HLDSInWinvsLoss_Final_NoAv, aes(x = Totals, y = W)) + 
  geom_point() +
  mlbplotR::geom_mlb_logos(aes(team_abbr = Team), width = 0.075, alpha = 0.7) +
  labs(
    title = "Total Holds Recorded vs Wins (2025 MLB Regular Season)",
    caption = "Data from Baseball Reference with StatHead",
    x = "Total Holds",
    y = "Wins") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE, linetype = 2)


  
  


