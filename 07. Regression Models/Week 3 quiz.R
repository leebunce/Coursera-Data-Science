# Week 3 Quiz

# Question 1
mt_fit1 <- lm(mpg ~ factor(cyl) + wt, mtcars)
summary(mt_fit1)

# Question 2
mt_fit2 <- lm(mpg ~ factor(cyl), mtcars)
summary(mt_fit2)

# Question 3
mt_fit3 <- lm(mpg ~ factor(cyl) * wt, mtcars)
anova(mt_fit1, mt_fit3, test = "Chisq")

# Question 4
q4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(q4)

# Question 5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
mod <- lm(y~x)
hatvalues(mod)

# Question 6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
mod <- lm(y~x)
dfbetas(mod)
