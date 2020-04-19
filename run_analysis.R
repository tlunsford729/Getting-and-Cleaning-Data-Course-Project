#Load library
library(dplyr)

#Read labels and features
featurenames <- read.table("UCI HAR Dataset/features.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Read training data
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
xtrain <- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)

#Read testing data
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
xtest <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)

#Merge training and testing data together
mergesub <- rbind(subjecttest, subjecttrain)
mergeX <- rbind(xtest, xtrain)
mergeY <- rbind(ytest, ytrain)

#Rename columns
colnames(mergeX) <- t(featurenames[2])
colnames(mergeY) <- "Activity"
colnames(mergesub) <- "Subject"

#Merge all data into one set
untidydata <- cbind(mergeX, mergeY, mergesub)

#Extract mean and standard deviation measurements
MeanSD <- grep(".*Mean.*|.*Std.*", names(untidydata), ignore.case=TRUE)
extracteddata <- untidydata[,MeanSD]

#Label dataset with descriptive variable names
names(untidydata)<-gsub("^t", "time", names(untidydata))
names(untidydata)<-gsub("^f", "frequency", names(untidydata))
names(untidydata)<-gsub("Acc", "Accelerometer", names(untidydata))
names(untidydata)<-gsub("BodyBody", "Body", names(untidydata))
names(untidydata)<-gsub("Mag", "Magnitude", names(untidydata))
names(untidydata)<-gsub("Gyro", "Gyroscope", names(untidydata))

#Create independent tidy dataset with averages for activities and subjects
tidydata <- aggregate(. ~Subject + Activity, untidydata, mean)

#Save tidy dataset to local folder
write.table(tidydata, file = "UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
