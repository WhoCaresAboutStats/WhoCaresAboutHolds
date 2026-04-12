library(mlbplotR)
library(ggplot2)
library(tidyr)
library(tidyverse)
library(gt)
library(reshape2)
library(plotly)


data = read.csv("BEST.csv")
data_simplified = read.csv("Holds_xHolds_Leaders(Simplified).csv")

data_simplified_long <- melt(
  data_simplified,
  id.vars = "Player",
  measure.vars = c("Hold_Count", "Better_xHolds"),
  variable.name = "Hold_Type",
  value.name = "Observed_Holds"
)

hold_mean = mean(data$Hold_Count)
xHolds_mean = mean(data$Better_xHolds)

Grouped_Graph_xHolds_non_plotly = ggplot(
  data = data_simplified_long,
    aes(
      fill = Hold_Type,
      x = Player,
      y = Observed_Holds)
  ) +
  geom_bar(
    position = "dodge",
    stat = "identity"
    ) +
  coord_cartesian(clip = "off") +
  scale_fill_manual(
    name = "Hold Versions",
    labels = c("Traditional Holds", "xHolds"),
    values = c("dodgerblue2", "indianred2")
    ) +
  labs(
    title = "MLB Top 10 Holds Leaders' Holds vs xHolds in 2025",
    caption = "Holds Numbers Pulled from Baseball Reference",
    x = "Top 10 Holds Leaders",
    y = "Count"
  ) +
  geom_hline(
    yintercept = hold_mean,
    color = "aquamarine2",
    linewidth = 2,
    linetype = 2
  ) +
  annotate(
    "text",
    x = 10.75,
    y = hold_mean,
    color = "aquamarine4",
    label = "Hold Average: 30.7",
    hjust = 0
  ) +
  geom_hline(
    yintercept = xHolds_mean,
    color = "brown2",
    linewidth = 2,
    linetype = 2
  ) +
  annotate(
    "text",
    x = 10.75,
    y = xHolds_mean,
    color = "brown4",
    label = "xHold Average: 27.7",
    hjust = 0
  ) +
  theme(axis.text.x = element_text(angle = 0, face = "bold", family = "sans"))

Grouped_Graph_xHolds_non_plotly

####################################
##            Plotly              ##
##            Graphs              ##
####################################
Grouped_Graph_xHolds_plotly = ggplot(
  data = data_simplified_long,
  aes(
    fill = Hold_Type,
    x = Player,
    y = Observed_Holds)
  ) +
  geom_bar(
    position = "dodge",
    stat = "identity"
  ) +
  scale_fill_manual(
    name = "Hold Versions",
    labels = c("Traditional Holds", "xHolds"),
    values = c("dodgerblue2", "indianred2")
  ) +
  labs(
    title = "MLB Top 10 Holds Leaders' Holds vs xHolds in 2025",
    caption = "Holds Numbers Pulled from Baseball Reference",
    x = "Top 10 Holds Leaders",
    y = "Count"
  ) +
  theme(axis.text.x = element_text(angle = 0, face = "bold", family = "sans"))

Grouped_Graph_xHolds_plotly

Plotly_xHolds = ggplotly(p = Grouped_Graph_xHolds_plotly)
Plotly_xHolds

saveWidget(Plotly_xHolds, "xHolds.html", selfcontained = TRUE)
  


