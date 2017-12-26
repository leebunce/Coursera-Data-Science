# Readme

This repository collects and tidies the 'Human Activity Recognition Using Smartphones Dataset' from the UCI Machine Learning Library.

Besides this 'readme' file the repository contains two other files, run_analysis.R and a code book, which are detailed below.

## run_analysis.R

This R script performs the following functions:

1. First it downloads the data from the UCI website (if it does not already exist)
2. It then reads the downloaded data files, including the training, test and label files, and joins them in a single tidy file.
3. From the various measurement variables it extracts only those containing mean and standard deviations.
4. It relables the variables with more readable names.
5. It creates a new summary dataset that takes the mean of each variable for each combination of subject and activity and saves this in the root directory as 'tidy_data.txt'.

## Code book

This document gives further details about the variables containined in the 'tidy_data.txt' file produced by the 'run_analysis.r' script.
