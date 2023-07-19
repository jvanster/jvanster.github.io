Covid_TR <- mutate(Covid_TR, Mortality_Rate = Total_Deaths/Total_Cases)
str(Covid_TR)
#
Covid_TR <- rename(Covid_TR, Mortality = Mortality_Rate)
# 
rename(Covid_TR, "Mortality Rate" = Mortality_Rate)
#
table(Covid$Countries, Covid_TR$Total_Cases)
#
percent_rank(Covid_TR$Total_Cases)
#
as.factor(Covid_TR$Countries)
#
Covid_TR$Countries <- as.factor(Covid_TR$Countries)

#
ggplot(Album_Sales, mapping = aes(x = Attract, y = Sales)) +
  geom_point() +
  geom_smooth(method = 'lm')

#
cor.test(Album_Sales$Sales, Album_Sales$Airplay)

#
ggplot(Album_Sales, mapping = aes(x = Airplay, y = Sales)) +
  geom_point() +
  geom_smooth(method = 'lm')

#
summary(as.factor(Album_Sales$Adverts))

# 
Album_Sales$Adverts

#
arrange(Album_Sales, Adverts)

#Space in LaTex \;

#Tribble of frequency Scores 

Voting <- tribble(
          ~Against, ~For, ~Maybe,
          50, 23, 17
)

# 8/31/21
# Good website for Histograms
http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
  
# Can use the Album sales dataset and the Jiminy Cricket dataset   


