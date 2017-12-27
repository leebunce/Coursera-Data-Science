# Week 3 quiz

library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(tidyverse)
library(rpart.plot)

# Question 1 --------------------------------------------------------------
train <- segmentationOriginal %>% filter(Case == 'Train')
test <- segmentationOriginal %>% filter(Case == 'Test')
set.seed(125)

modFit <- train(Class ~ ., method = "rpart", data = train)
plot(modFit$finalModel)
print(modFit$finalModel)

# a = PS
# b = WS
# c = PS
# d = Can't tell

# Question 2 --------------------------------------------------------------

# Bias larger
# Variance smaller
# Sample size

# Question 3 --------------------------------------------------------------
library(pgmm)
data(olive)
olive = olive[, -1]

mod <- train(Area ~ ., method = 'rpart', data = olive)
newdata = as.data.frame(t(colMeans(olive)))
predict(mod, newdata)
print(mod$finalModel)

# Question 4 --------------------------------------------------------------
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1], size = dim(SAheart)[1] / 2, replace = F)
trainSA = SAheart[train, ]
testSA = SAheart[-train, ]

mod <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
                 data = trainSA, method = "glm", family = "binomial")

missClass = function(values, prediction){sum(((prediction > 0.5) * 1) != values) / length(values)}
missClass(trainSA$chd, predict(mod, newdata = trainSA))
missClass(testSA$chd, predict(mod, newdata = testSA))

# Question 5 --------------------------------------------------------------
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
vowel.train <- vowel.train %>% mutate(y = as.factor(y))
vowel.test <- vowel.test %>% mutate(y = as.factor(y))
set.seed(33833)
mod <- train(y ~ ., data = vowel.train, method = 'rf', prox = T)
mod2 <- randomForest(y ~ ., data = vowel.train, proximity = T)
varImp(mod2) %>% rownames_to_column() %>% arrange(-Overall)
