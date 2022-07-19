#Normal Curves
#Use base R

# x vector
x <- seq(-4, 4, length=100)

# y vector
y <- dnorm(x)

# plot the curve
plot(x,y, type = "l", lwd = 2, axes = FALSE, 
     xlab = "", ylab = "")

#Add details to axis 
axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", 
                              "mean", "1s", "2s", "3s"))

#Use the curve function
curve(dnorm, -3.5, 3.5, lwd=2, axes = FALSE, xlab = "", 
      ylab = "")

axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", 
                              "mean", "1s", "2s", "3s"))

# Create a normal curve with given population mean and SD 

#define population mean and standard deviation
population_mean <- 50
population_sd <- 5

#Gasoline additive example
population_mean <- 24.7
population_sd <- 4.8/sqrt(75)

#define upper and lower bound
lower_bound <- population_mean - population_sd
upper_bound <- population_mean + population_sd

#Create a sequence of 1000 x values based on population mean and standard deviation
x <- seq(-4, 4, length = 1000) * population_sd + population_mean

#create a vector of values that shows the height of the probability distribution
#for each value in x
y <- dnorm(x, population_mean, population_sd)

#plot normal distribution with customized x-axis labels
plot(x,y, type = "l", lwd = 2, axes = FALSE, xlab = "",
     ylab = "")
sd_axis_bounds = 5
axis_bounds <- seq(-sd_axis_bounds * population_sd + population_mean,
                   sd_axis_bounds * population_sd + population_mean,
                   by = population_sd)
axis(side = 1, at = axis_bounds, pos = 0)

#Shade in area of entire curve 
polygon(c(x, rev(x)), 
        c(y, rep(0, length(y))),
        col = adjustcolor('red', alpha=0.3), border = NA)

#Shade in part of curve 
x_adj <- seq(104, 130)

y_adj <- dnorm(x_adj, population_mean, population_sd)

polygon(c(x_adj, rev(x_adj)), 
        c(y_adj, rep(0, length(y_adj))),
        col = adjustcolor('red', alpha=0.3), border = NA)


#Create using ggplot 
ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dnorm) +
  theme_linedraw() 

#Shade area
ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dnorm) +
  theme_minimal() +
  geom_density(
    aes(fill = group),
    . %>% filter((group == "C" & between(x, 0, 1))),
    stat = 'identity',
    alpha = 0.75
  )

#Create using the mtcars dataset 

ggplot(mtcars, aes(x = mpg)) +
  stat_function(
    fun = dnorm,
    args = with(mtcars, c(mean = mean(mpg), sd = sd(mpg)))
  ) +
  scale_x_continuous("Miles per gallon")

#Fill in area under the normal curve
# https://r-charts.com/distribution/fill-area-density/

#Another example 
population_mean <- 80
population_sd <- 12

lower_bound <- population_mean - population_sd
upper_bound <- population_mean + population_sd

x <- seq(-4, 4, length = 1000) * population_sd + 
  population_mean

y <- dnorm(x, population_mean, population_sd)





