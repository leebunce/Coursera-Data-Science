# Week 4 quiz

library(caret)
library(dplyr)

# Question 1 --------------------------------------------------------------
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
vowel.train <- vowel.train %>% mutate(y = as.factor(y))
vowel.test <- vowel.test %>% mutate(y = as.factor(y))
set.seed(33833)
mod_rf <- train(y ~ ., data = vowel.train, method = 'rf')
mod_gbm <- train(y ~ ., data = vowel.train, method = 'gbm')
pred_rf <- predict(mod_rf, vowel.test)
pred_gbm <- predict(mod_gbm, vowel.test)

confusionMatrix(pred_rf, vowel.test$y)
confusionMatrix(pred_gbm, vowel.test$y)

df <- data.frame(pred_rf = pred_rf, pred_gbm = pred_gbm, actual = vowel.test$y) %>% 
  mutate(same = pred_rf == pred_gbm)

agree <- df %>% 
  filter(same == TRUE) %>% 
  mutate(accuracy = pred_rf == actual) %>% 
  summarise(accuracy = mean(accuracy))

# Question 2 --------------------------------------------------------------
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[inTrain, ]
testing = adData[-inTrain, ]

mod_rf <- train(diagnosis ~ ., training, method = 'rf')
mod_gbm <- train(diagnosis ~ ., training, method = 'gbm')
mod_lda <- train(diagnosis ~ ., training, method = 'lda')

pred_rf <- predict(mod_rf, testing)
pred_gbm <- predict(mod_gbm, testing)
pred_lda <- predict(mod_lda, testing)

pred_df <- data.frame(pred_rf = pred_rf,
                      pred_gbm = pred_gbm,
                      pred_lda = pred_lda,
                      actual = testing$diagnosis)

blend_mod <- train(actual ~ ., data = pred_df, method = 'rf')
blend_pred <- predict(blend_mod, testing)

confusionMatrix(pred_rf, testing$diagnosis)$overall[1]
confusionMatrix(pred_gbm, testing$diagnosis)$overall[1]
confusionMatrix(pred_lda, testing$diagnosis)$overall[1]
confusionMatrix(blend_pred, testing$diagnosis)$overall[1]

# Question 3 --------------------------------------------------------------
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[inTrain, ]
testing = concrete[-inTrain, ]

set.seed(233)
mod_lasso <- train(CompressiveStrength ~ ., data = training, method = "lasso")
library(elasticnet)
plot.enet(mod_lasso$finalModel, xvar = "penalty", use.color = TRUE)

# Question 4 --------------------------------------------------------------
library(lubridate)  # For year() function below
dat = read.csv("8. Machine Learning/gaData.csv")
training = dat[year(dat$date) < 2012, ]
testing = dat[(year(dat$date)) > 2011, ]
tstrain = ts(training$visitsTumblr)

library(forecast)
mod_ts <- bats(tstrain)
fcast <- forecast(mod_ts, level = 95, h = dim(testing)[1])
sum(fcast$lower < testing$visitsTumblr & testing$visitsTumblr < fcast$upper) / 
  dim(testing)[1]

# Question 5 --------------------------------------------------------------
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[inTrain, ]
testing = concrete[-inTrain, ]

set.seed(325)
library(e1071)
mod_svm <- svm(CompressiveStrength ~ ., data = training)
pred_svm <- predict(mod_svm, testing)
accuracy(pred_svm, testing$CompressiveStrength)
