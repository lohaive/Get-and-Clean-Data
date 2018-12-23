setwd("D:/Coursera")
library(dplyr)

# Merges the training and the test sets to create one data set.

## Step 1: Download zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./GetCleanDataProject.zip")

## Step 2: Unzip data
listZip<-unzip("./GetCleanDataProject.zip")

## Step 3: Read data into R
train_x<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
test_x<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## Step 4: Merge Data
train<-cbind(train_subject,train_y,train_x)
test<-cbind(test_subject,test_y,test_x)
mergeDataset<-rbind(train,test)

# Extracts only the measurements on the mean and standard deviation for each measurement.

## Step 1: Read feature names
features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
featureNames<-features[,2]

## Setp 2: Get col num of mean or std features
feature_num<-grep("mean\\(\\)|std\\(\\)",featureNames)
selectDataset<-mergeDataset[,c(1,2,feature_num+2)]
names(selectDataset)<-c("subject","activity", featureNames[feature_num])

# Uses descriptive activity names to name the activities in the data set

## Step 1: Read activity names
activityNames<-read.table("./UCI HAR Dataset/activity_labels.txt")

## Step 2: Replace numbers with activity names
selectDataset$activity<-factor(selectDataset$activity,levels = activityNames[,1],labels = activityNames[,2])

# Appropriately labels the data set with descriptive variable names.

## Step 1: Delete "()"
names(selectDataset) <- gsub("\\()", "", names(selectDataset))

## Step 2: When start with "t", replace it with "time"
names(selectDataset) <- gsub("^t", "time", names(selectDataset))

## Step 3: When start with "f", replace it with "frenquency"
names(selectDataset) <- gsub("^f", "frequency", names(selectDataset))

## Step 4: Replace "-mean" with "Mean"
names(selectDataset) <- gsub("-mean", "Mean", names(selectDataset))

## Step 5: Replace "-std" with "Std"
names(selectDataset) <- gsub("-std", "Std", names(selectDataset))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step 1: Calculate mean of grouped data
averageDataset<-summarise_all(group_by(selectDataset,subject,activity),funs(mean))

## Step 2: Write data
write.table(averageDataset,"./UCI HAR Dataset/MeanData.txt", row.names = FALSE)
