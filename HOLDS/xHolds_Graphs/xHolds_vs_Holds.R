library(tidyverse)
library(mlbplotR)


team_data


Team_Adj_Holds_vs_Holds_Plot = ggplot(data = team_data, aes(x = HLD, y = Adj_Team_Holds)) +
  geom_mlb_logos(
    aes(team_abbr = Team),
    width = 0.075,
    alpha = 0.75) +
  geom_smooth(
    method = "lm", 
    se = TRUE,
    color = "royalblue4",
    fill = "lightskyblue1") +
  labs(
    title = "Team Holds vs. New Team Adjusted Holds (2025)",
    x = "Holds",
    y = "Adjusted Holds",
    caption = "Data sourced from Baseball Reference"
  )

Team_Adj_Holds_vs_Holds_Plot
