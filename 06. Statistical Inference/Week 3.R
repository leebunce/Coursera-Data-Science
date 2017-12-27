
# Question 1 --------------------------------------------------------------

# In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc.
# What is a 95% Student's T confidence interval for the mean brain volume in this new population?

1100 + c(-1,1)*qt(0.975, 8)*30/(sqrt(9))

# Question 2 --------------------------------------------------------------

# A diet pill is given to 9 subjects over six weeks. 
# The average difference in weight (follow up - baseline) is -2 pounds.
# What would the standard deviation of the difference in weight have to be for the upper endpoint of the 95% T confidence interval to touch 0?

2*sqrt(9)/qt(0.975,8)

# Question 4 --------------------------------------------------------------

(3-5) + c(-1,1)*qt(0.975, 18)*sqrt((9*0.6 + 9*0.68)/18)*sqrt(1/10 + 1/10)

# Question 6 --------------------------------------------------------------

(6-4) + c(-1,1)*qnorm(0.975)*sqrt((99*0.5^2 + 99*2^2)/198)*sqrt(1/100 + 1/100)

# Question 7 --------------------------------------------------------------

(-3-1) + c(-1,1)*qt(0.95, 16)*sqrt((8*1.5^2 + 8*1.8^2)/16)*sqrt(1/9 + 1/9)
