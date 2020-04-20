#Codebook
Getting and Tidying Data Course Project

###Library Used
dplyr

###Description
This document is a codebook that describes the variables and data used in this project, and the transformations done to the data.

###The Data
UCI Human Activity Recognition Using Smartphones Data Set

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available on the UCI site through this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files from this data set were used in this project:
-'activity_labels.txt'
-'features.txt'
-'test/X_test.txt'
-'test/Y_test.txt'
-'test/subject_test.txt'
-'train/X_train.txt'
-'train/Y_train.txt'
-'train/subject_train.txt'

###Transformations
These transformations were done according to the project instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First, the test and train sets were merged into a single large data set. Columns were labeled according to the names identified in features.txt.

Next, columns containing mean or standard deviation measurements were extracted and variable names were adjusted.

Lastly, a new tidy data set was produced, containing the average of each variable for each activity and subject.

This data set is included in this repository as "tidydata.txt"
