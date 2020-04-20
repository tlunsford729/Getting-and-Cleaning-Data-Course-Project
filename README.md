# Getting and Cleaning Data Course Project
Final project for Johns Hopkins Coursera course

#Project Contents
README.txt - Explanation of assignment and analysis conducted
codebook.md - Guide to data used and transformations carried out
tidydata.txt - data set containing means for each activity and each subject
run_analysis.R - code run in order to produce tidydata.txt

#Assignment Details
Instructions for this assignment can be found at:
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The data used in this project is from UCI's Human Activity Using Smartphones Data Set. 
This data was collected from the accelerometers of Samsung smart phones and may be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The UCI data set contains the following contents:
'README.txt'
'features_info.txt'
'features.txt'
'activity_labels.txt'
'train/X_train.txt'
'train/Y_train.txt'
'test/X_test.txt'
'test/Y_test.txt'
'train/subject_train.txt'
'train/Inertial Signals/total_acc_x_train.txt'
'train/Inertial Signals/body_acc_x_train.txt'
'train/Inertial Signals/body_gyro_x_train.txt'

#Analysis
tidydata.txt was produced by compiling the various test and train files into one data set, relabeling columns, extracting a subset of measurements and generating a new data set, 'tidydata.txt,' from the average of each variable for each activity and each subject.

#I hope you enjoy grading this assignment more than I enjoyed doing it.
