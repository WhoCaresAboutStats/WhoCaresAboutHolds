library(tidyverse)
library(ggplot2)
library(mlbplotR)

#TotalsOnly = TotalsForHoldsOnly[-c(1:31), ]
TotalsOnly

Totals_long <- pivot_longer(TotalsOnly, cols = c(Lost, Won), names_to = "Category", values_to = "Value")
names(TotalsOnly)[names(TotalsOnly) == 'HLDW'] = 'Won'
names(TotalsOnly)[names(TotalsOnly) == 'HLDL'] = 'Lost'

ggplot(data = Totals_long, aes(x = Category, y = Value, fill = Category)) +
  geom_bar(stat = "identity") + # Use stat="identity" as y values are provided
  labs(
    title = "2025 Holds in Games Won vs in Games Lost",
    x = "Game Result (Won or Lost)",
    y = "Holds",
    fill = "Result") +
  geom_text(aes(label = Value), vjust = -0.5) +
  scale_fill_manual(values = c(Lost = "red", Won = "green"))

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


