x <- c("1.2", "5.6", "1e3")

is.numeric(z)


is.character(x)

parse_double(x)

y <- c("$1,234", "USD 3,513", "59%")

is.numeric(y)

is.character(y)

z <- parse_number(y)

z

library(nycflights13)
library(tidyverse)

#Count number for a variable
flights |> 
  count(tailnum)

#Count number based on descending order
flights |> 
  count(dest, sort = TRUE) |>
  View()

#Count number based on descending order and view all
flights |> 
  count(dest, sort = TRUE) |>
  View()

#Use group_by to do something similar, but add in other calculations
flights |> 
  group_by(dest) |>
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  )

#destinations served by the most carriers 
flights |>
  group_by(dest) |>
  summarize(
    carriers = n_distinct(carrier)
  ) |>
  arrange(desc(carriers)) |>
  View()

#Weighted counts using sum 
flights |> 
  group_by(tailnum) |>
   summarize(
     miles = sum(distance)
   ) |>
  View()

#pivot longer 
billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank"
  ) |> 
  View()
#pivot longer, drop NAs 
billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank", 
    values_drop_na = TRUE
  ) |> 
  View()

billboard_longer <- billboard |> 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank",
    values_drop_na = TRUE
  ) |> 
  mutate(
    week = parse_number(week)
  )
billboard_longer
#> # A tibble: 5,307 × 5
#>   artist track                   date.entered  week  rank
#>   <chr>  <chr>                   <date>       <dbl> <dbl>
#> 1 2 Pac  Baby Don't Cry (Keep... 2000-02-26       1    87
#> 2 2 Pac  Baby Don't Cry (Keep... 2000-02-26       2    82
#> 3 2 Pac  Baby Don't Cry (Keep... 2000-02-26       3    72
#> 4 2 Pac  Baby Don't Cry (Keep... 2000-02-26       4    77
#> 5 2 Pac  Baby Don't Cry (Keep... 2000-02-26       5    87
#> 6 2 Pac  Baby Don't Cry (Keep... 2000-02-26       6    94
#> # ℹ 5,301 more rows

billboard_longer |> 
  ggplot(aes(x = week, y = rank, group = track)) + 
  geom_line(alpha = 0.25) + 
  scale_y_reverse()







#Pivot Longer
#Make dataset
df <- tribble(
  ~id,  ~bp1, ~bp2,
  "A",  100,  120,
  "B",  140,  115,
  "C",  120,  125
)



df |> 
  pivot_longer(
    cols = bp1:bp2,
    names_to = "measurement",
    values_to = "value"
  )




