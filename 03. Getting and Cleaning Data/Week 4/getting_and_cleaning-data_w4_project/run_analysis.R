# Getting and Cleaning Data - Week 4 Project

# Packages ----------------------------------------------------------------
library(dplyr)

# 0. Download data --------------------------------------------------------

if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip("UCI HAR Dataset.zip")
}

# 1. Read data ------------------------------------------------------------

# Labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c('activity_id', 'Activity'))
features <- read.table("UCI HAR Dataset/features.txt")[, 2]
features <- gsub(pattern = '[-(),]', replacement = '', features)

# Train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = 'activity_id')
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = 'Subject')

train <- cbind(x_train, y_train, subject_train)

# Test
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = 'activity_id')
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = 'Subject')

test <- cbind(x_test, y_test, subject_test)

# Join
combined <- rbind(train, test)

# 2. Extract mean and standard measurement --------------------------------

combined_extract <- combined[, grepl(pattern = 'activity_id|Subject|mean[XYZ]|std', x = names(combined))] #mean[XYZ] to avoid selecting meanfrequency

# 3. Add descriptive activity names ---------------------------------------

# Replace activity id with activity name
combined_extract <- merge(combined_extract, activity_labels, by = 'activity_id', all = TRUE)
combined_extract <- select(combined_extract, -activity_id)

# 4. Add descriptive variable names ---------------------------------------

names(combined_extract) <-gsub("^t", "Time", names(combined_extract))
names(combined_extract) <-gsub("^f", "Frequency", names(combined_extract))
names(combined_extract) <-gsub("Acc", "Accelerometer", names(combined_extract))
names(combined_extract) <-gsub("Gyro", "Gyroscope", names(combined_extract))
names(combined_extract) <-gsub("Mag", "Magnitude", names(combined_extract))
names(combined_extract) <-gsub("BodyBody", "Body", names(combined_extract))
names(combined_extract) <-gsub("mean", "Mean", names(combined_extract))
names(combined_extract) <-gsub("std", "StandardDeviation", names(combined_extract))


# 5. Mean of each variable ------------------------------------------------

summary <- combined_extract %>% 
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean))

write.table(summary, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
