# Code book

This document gives further details about the variable contained in the 'summary.csv' file produced by the 'run_analysis.r' script.

# Variables

The features selected for this data come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and TimeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometerXYZ and TimeGravityAccelerometerXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerkXYZ and TimeBodyGyroscopeJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometerXYZ, FrequencyBodyAccelerometerJerkXYZ, FrequencyBodyGyroscopeXYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude. (Note the 'Frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

TimeBodyAccelerometerXYZ
TimeGravityAccelerometerXYZ
TimeBodyAccelerometerJerkXYZ
TimeBodyGyroscopeXYZ
TimeBodyGyroscopeJerkXYZ
TimeBodyAccelerometerMagnitude
TimeGravityAccelerometerMagnitude
TimeBodyAccelerometerJerkMagnitude
TimeBodyGyroscopeMagnitude
TimeBodyGyroscopeJerkMagnitude
FrequencyBodyAccelerometerXYZ
FrequencyBodyAccelerometerJerkXYZ
FrequencyBodyGyroscopeXYZ
FrequencyBodyAccelerometerMagnitude
FrequencyBodyAccelerometerJerkMagnitude
FrequencyBodyGyroscopeMagnitude
FrequencyBodyGyroscopeJerkMagnitude

For each of these signals the mean and standard deviation was then extracted from the raw data.

These measurement were taken for 30 subjects and 6 activities, giving the identifier variables:

Subject: An integer from 1 to 30 indicatong the number of the subject
Activity: One of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

# Values

For the 'tidy_data.txt' file the mean was taken for each measurement for each combination of the Subect and Activity identifiers.