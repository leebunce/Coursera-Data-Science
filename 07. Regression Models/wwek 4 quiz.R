# Week 4 quiz

# Question 1
library(MASS)
library(dplyr)
head(shuttle)
shuttle <- shuttle %>% mutate(auto = ifelse(use == 'auto', 1, 0))

mod <- glm(auto ~ wind - 1, family = 'binomial', shuttle)
exp(coef(mod))[1]/exp(coef(mod))[2]

# Question 2
mod <- glm(auto ~ wind  + magn - 1, family = 'binomial', shuttle)
exp(coef(mod))[1]/exp(coef(mod))[2]

# Question 3
mod <- glm(auto ~ wind  + magn - 1, family = 'binomial', shuttle)
mod2 <- glm((1-auto) ~ wind  + magn - 1, family = 'binomial', shuttle)
summary(mod)
summary(mod2)

# Question 4
head(InsectSprays)
mod <- glm(count ~ spray - 1, InsectSprays, family = 'poisson')
exp(coef(mod))[1]/exp(coef(mod))[2]

# Question 5

# Question 6
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

spline_term = x*(x>0)
regr = cbind(1,x,spline_term)
fit = lm(y~regr-1)
summary(fit)
yhat = predict(fit)
plot(x,y)
lines(x,yhat)
predict(fit)[9]-predict(fit)[8]
