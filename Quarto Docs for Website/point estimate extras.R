trump_approval_poll |> 
  filter(start_date >= as.Date("2017-01-20") & 
           start_date <= as.Date("2017-02-20")) |> 
ggplot() + 
  geom_line(aes(x = start_date, y = approve))



# Set Parameters
n_samples <- 10000   # Number of samples
sample_size <- 1000  # Size of each sample
true_p <- 0.6        # True proportion of "approve"

#Use the binomial to simulate this
# Simulate sample counts of "approve"
sample_counts <- rbinom(n = n_samples, size = sample_size, 
                        prob = true_p)

# Calculate p-hat (sample proportion)
p_hats <- sample_counts / sample_size


# If ggplot2 is not installed, install it
# install.packages("ggplot2")

library(ggplot2)

# Convert to data frame for plotting
p_hat_df <- data.frame(p_hat = p_hats)

# Create histogram
ggplot(p_hat_df, aes(x = p_hat)) +
  geom_histogram(binwidth = 0.005, fill = "skyblue", color = "black") +
  labs(title = "Sampling Distribution of p̂",
       x = "Sample Proportion (p̂)",
       y = "Frequency") +
  theme_minimal()
