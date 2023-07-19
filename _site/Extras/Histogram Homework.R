# Histogram Homework
ggplot(data = Jiminy_Cricket) +
  geom_histogram(mapping = aes(x = Success_Pre))

# Pick a different binwidth
ggplot(data = Jiminy_Cricket) +
  geom_histogram(mapping = aes(x = Success_Pre), binwidth = 1)

# Use hist command to create histogram of Success_Post variable
hist(Jiminy_Cricket$Success_Post)

# Create a density histogram
hist(Practice$Dist, probability = TRUE)

# Add the density line
lines(density(Practice$Dist))

# Add color to the ggplot to make the bars more distinct
ggplot(Jiminy_Cricket, aes(x=Success_Post)) +
  geom_histogram(binwidth= 5, colour="black", fill="white")

# Add density line
ggplot(Jiminy_Cricket, aes(x=Success_Post)) + 
  geom_histogram(aes(y=..density..),
                 binwidth=5,
                 colour="black", fill="white") +
  geom_density()

#Compare those who "wished upon a star" to those who 
#used "hard work" to try to get success on 
#the Success_Post variable
ggplot(Jiminy_Cricket, aes(x=Success_Post, fill=as.character(Strategy))) +
  geom_histogram(binwidth=10, alpha=.5, position="identity")
