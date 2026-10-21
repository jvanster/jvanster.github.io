#Sampling Distribution Beads Activity

#Beads Simulation


#Create population of beads in Jar
pop_size <- 1400

#Create percentage of white and blue beads
possible_beads <- c(rep("Blue", 0.60 * pop_size),
                    rep("White", 0.40 * pop_size))


#Keep randomized sample the same
set.seed(123)

#Randomly Sample 1000 from the population
sampled_beads <- sample(possible_beads, size = 20)

#Find percentage for sample
(sum(sampled_beads == "Blue")/20)

# Create population of beads in Jar
pop_size <- 1400

possible_beads <- c(rep("Blue", 0.60 * pop_size),
                    rep("White", 0.40 * pop_size))

# Sampling settings
set.seed(123)        # for reproducible results
n_samples <- 100
n <- 20

# Draw 50 samples of size 20 and record the proportion of blue beads in each
prop_blue <- replicate(n_samples, {
  scoop <- sample(possible_beads, size = n, replace = FALSE)
  mean(scoop == "Blue")
})

# Look at the results
prop_blue
mean(prop_blue)   # should be close to 0.60
sd(prop_blue)     # standard error estimate

# Histogram of the 50 sample proportions
hist(prop_blue,
     breaks = seq(0, 1, by = 0.05),
     col = "steelblue",
     border = "white",
     main = "Sampling Distribution of Proportion Blue (n = 20, 50 samples)",
     xlab = "Proportion of Blue Beads in Sample",
     ylab = "Frequency")
abline(v = 0.60, col = "red", lwd = 2, lty = 2)   # true population proportion



pop_size <- 1400
possible_beads <- c(rep("Blue", 0.60 * pop_size),
                    rep("White", 0.40 * pop_size))

set.seed(123)
prop_blue <- replicate(50, {
  scoop <- sample(possible_beads, size = 20)
  mean(scoop == "Blue")
})

hist(prop_blue, breaks = seq(0, 1, by = 0.05))
abline(v = 0.60, col = "red", lty = 2)










