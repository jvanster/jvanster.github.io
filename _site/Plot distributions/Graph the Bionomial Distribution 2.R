#Graph the binomial distribution 
# Website: https://www.statology.org/plot-binomial-distribution-r/

# For example, the following code illustrates how to plot 
# a probability mass function for a binomial distribution 
# with size = 20 and prob = 0.3:

success <- 0:20

plot(success, dbinom(success, size=20, prob=.3),type='h')

#Plot Example from Learning Statistics 
# Dice rolls = 20, probability = 1/6
plot(success, dbinom(success, size=20, prob=1/6),type='h',
     col = "blue")

#Binomial distribution for flipping a coin 100 times
success <- 0:100

plot(success, dbinom(success, size=100, prob=.5),type='h')

#Binomial distribution for flipping a coin 20 times
success <- 0:20

plot(success, dbinom(success, size=20, prob=.5),type='h', 
     col = "blue")

#Make the plot look better 
#Binomial distribution for flipping a coin 100 times
success <- 0:20

plot(success,dbinom(success,size=20,prob=.3),
     type='h',
     main='Binomial Distribution (n=20, p=0.3)',
     ylab='Probability',
     xlab ='# Successes',
     lwd=3)

# You can use the following code to obtain the actual 
# probabilities for each number of successes shown in the plot:

# Turn off scientific notation 
options(scipen=999) 


#define range of successes
success <- 0:20

#display probability of success for each number of trials
dbinom(success, size=20, prob=.3)


