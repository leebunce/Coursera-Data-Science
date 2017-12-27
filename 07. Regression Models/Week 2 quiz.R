# Week 2 Quiz

# Question 1 --------------------------------------------------------------
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
summary(lm(y~x))

# Question 2 --------------------------------------------------------------
summary(lm(y~x))

# Question 3 --------------------------------------------------------------
mean_wt <- data.frame(wt = mean(mtcars$wt))
mod <- lm(mpg~wt, mtcars)
pred <- predict(mod, mean_wt, se.fit = TRUE)
pred$fit - 1.96*pred$se.fit

# Question 4 --------------------------------------------------------------
?mtcars
pt(q = 0.975, df = nrow(mtcars)-2)
