library(tidyverse)
library(ggplot2)
library(mlbplotR)
library(dplyr)

BhdAndTieFixed

#BhdAndTie_NoTotal = BhdAndTie_NoTotal[-32, ]
#BhdAndTie_NoTotal
#names(BhdAndTie_NoTotal)[names(BhdAndTie_NoTotal) == 'Team'] = 'FullName'
#names(BhdAndTie_NoTotal)[names(BhdAndTie_NoTotal) == 'Tame'] = 'Team'

teams_colors_logos
names(BhdAndTie_NoTotal)[names(BhdAndTie_NoTotal) == 'FullName'] = 'team_name'

#merged_df_dplyr <- teams_colors_logos %>%
  #left_join(BhdAndTie_NoTotal, by = "team_name")


merged_df_dplyr_SVH <- merged_df_dplyr %>%
  mutate(SVO_N_HLD = SVOpp + Hold)
merged_df_dplyr_SVH

HLDs_vs_Sit = ggplot(
  data = merged_df_dplyr,
  aes(
    x = T_n_Bhd,
    y = Hold)) +
  mlbplotR::geom_mlb_logos(
    aes(
      team_abbr = Team),
    width = 0.075,
    alpha = 0.7) +
  geom_point(
    stat = "identity",
    alpha = 0.1) +
  labs(
    title = "Given Situations when Relief Pitcher Enters by Team vs Holds Recorded",
    subtitle = "Trailing or Tying Application of Pitchers on Holds",
    x = "Sum of Pitchers Used when Trailing or Tied",
    y = "Holds Recorded",
    caption = "Data from Baseball Reference") +
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "red")
HLDs_vs_Sit  
  

