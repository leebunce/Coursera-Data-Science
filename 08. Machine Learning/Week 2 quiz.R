# Week 2 quiz

library(caret)
library(dplyr)

# Question 1 --------------------------------------------------------------

library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

# Question 2 --------------------------------------------------------------
library(AppliedPredictiveModeling)
library(Hmisc)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

training_plot <- training %>% 
  mutate(index = row_number(),
         group = cut2(CompressiveStrength, g = 4))

ggplot(training_plot, aes(index, CompressiveStrength, colour = Cement)) +
  geom_point()

ggplot(training_plot, aes(index, CompressiveStrength, colour = BlastFurnaceSlag)) +
  geom_point()

ggplot(training_plot, aes(index, CompressiveStrength, colour = FlyAsh)) +
  geom_point()

ggplot(training_plot, aes(index, CompressiveStrength, colour = Water)) +
  geom_point()

ggplot(training_plot, aes(index, CompressiveStrength, colour = Superplasticizer)) +
  geom_point()

ggplot(training_plot, aes(index, CompressiveStrength, colour = Age)) +
  geom_point()

# Question 3 --------------------------------------------------------------

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

ggplot(training, aes(Superplasticizer)) +
  geom_histogram()

# Question 4 --------------------------------------------------------------
library(caret)
library(AppliedPredictiveModeling)
library(dplyr)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

data <- training %>% 
  select(starts_with('IL'))

preProcess(data, method = 'pca', thresh = 0.9)

# Question 5 --------------------------------------------------------------
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

training <- training %>% select(starts_with('IL'), diagnosis)
testing <- testing %>% select(starts_with('IL'), diagnosis)
training_pca <- 