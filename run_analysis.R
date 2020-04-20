#Load library
library(dplyr)

#Read labels and features
features <- read.table("UCI HAR Dataset/features.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Read training data
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
xtrain <- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)

#Read testing data
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
xtest <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)

#Merge training and testing data together
sub <- rbind(subtest, subtrain)
X <- rbind(xtest, xtrain)
Y <- rbind(ytest, ytrain)

#Rename columns
colnames(X) <- t(features[2])
colnames(Y) <- "Activity"
colnames(sub) <- "Subject"

#Merge all data into one set
totaldata <- cbind(X, Y, sub)

#Extract mean and standard deviation measurements
meanSD <- grep(".*Mean.*|.*Std.*", names(totaldata), ignore.case=TRUE)
columns <- c(meanSD, 562, 563)
extractdata <- totaldata[,columns]

#Label dataset with descriptive variable names
names(extractdata)<-gsub("^t", "time", names(extractdata))
names(extractdata)<-gsub("^f", "frequency", names(extractdata))
names(extractdata)<-gsub("Acc", "Accelerometer", names(extractdata))
names(extractdata)<-gsub("BodyBody", "Body", names(extractdata))
names(extractdata)<-gsub("Mag", "Magnitude", names(extractdata))
names(extractdata)<-gsub("Gyro", "Gyroscope", names(extractdata))

#Create independent tidy dataset with averages for activities and subjects
tidydata <- extractdata %>%
  group_by(activity, subject) %>%
  summarize_each(funs(mean))

#Save tidy dataset to local folder
write.table(tidydata, file = "UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
