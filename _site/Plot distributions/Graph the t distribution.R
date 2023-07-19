# Graph the t distribution
# Website https://www.statology.org/plot-t-distribution-r/
# To graph the t distribution use the following functions
# dt(x, df) to create the probability density function
# curve(function, from = null, to = null)

#Basic t distribution
curve(dt(x, df=10), from=-4, to=4)

#Add some more bells and whistles
curve(dt(x, df=10), from=-4, to=4, 
      main = 't Distribution (df = 10)', #add title
      ylab = 'Density', #change y-axis label
      lwd = 2, #increase line width to 2
      col = 'steelblue') #change line color to steelblue 

#Make a family of t distribution curves
curve(dt(x, df=6), from=-4, to=4, col='blue') 
curve(dt(x, df=10), from=-4, to=4, col='red', add=TRUE)
curve(dt(x, df=30), from=-4, to=4, col='green', add=TRUE)

#add legend
legend(-4, .3, legend=c("df=6", "df=10", "df=30"),
       col=c("blue", "red", "green"), lty=1, cex=1.2)

