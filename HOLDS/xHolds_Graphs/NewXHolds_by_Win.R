library(tidyverse)
library(gganimate)
library(ggtext)
library(mlbplotR)

team_data = read.csv("TeamAdjHolds.csv")

#team_data = team_data[-c(31), ]

Team_Adj_Holds_Plot = ggplot(data = team_data, aes(x = W, y = Adj_Team_Holds)) +
  geom_mlb_logos(
    aes(team_abbr = Team),
    width = 0.075,
    alpha = 0.75) +
  geom_smooth(
    method = "lm", 
    se = TRUE,
    color = "dodgerblue2",
    fill = "lightblue3") +
  labs(
    title = "Team Wins vs. New Team Adjusted Holds (2025)",
    x = "Wins",
    y = "Adjusted Holds",
    caption = "Data sourced from Baseball Reference"
  )

Team_Adj_Holds_Plot
