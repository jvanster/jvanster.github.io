#Table for Anxiety and Learning Example

#Libraries
library(gt)
library(tidyverse)




Learning <- data.frame(
  Difficulty = c(rep(c("Low", "Medium", "High"), each = 15)), 
  Anxiety = c(rep(c("Low", "Medium", "High"), times = 5)), 
  Score = c(
    18, 18, 18, 17, 18, 17, 20, 19, 16,
    16, 15, 18, 17, 17, 19, 18, 18, 14, 
    14, 17, 15, 17, 18, 17, 16, 15, 12,
    14, 14, 16, 11, 15, 9, 6, 12, 8, 10,
    13, 7, 10, 11, 8, 8, 12, 5)
)

#Create factors
Learning <- Learning |>
  mutate(
    Anxiety = factor(Anxiety, levels = c("Low", "Medium", "High")),
    Difficulty = factor(Difficulty, levels = c("Low", "Medium", "High"))
  )


#Fix table
clean_table <- Learning |>
  group_by(Anxiety, Difficulty) |>
  summarise(Scores = paste(Score, collapse = "<br>"), .groups = "drop") |>
  pivot_wider(names_from = Difficulty, values_from = Scores) |>
  arrange(Anxiety)

#Create gt table
clean_gt <- clean_table |>
  gt(rowname_col = "Anxiety") |>
  fmt_markdown(columns = everything()) |>
  tab_header(
    title = "Raw Scores by Anxiety and Learning Difficulty"
  ) |>
  cols_label(
    Low = "Low",
    Medium = "Medium",
    High = "High"
  ) |>
  tab_spanner(
    label = md("**Learning Difficulty**"),
    columns = c(Low, Medium, High)
  ) |>
  cols_width(
    everything() ~ px(150)
  ) |>
  tab_stubhead(label = md("**Anxiety Level**"))

clean_gt



