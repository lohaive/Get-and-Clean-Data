# Get-and-Clean-Data
This repository contains the R code for coursera's get and clean project.
The R script called run_analysis.R could does the following:
1 Merges the training and the test sets to create one data set.
Four Steps were designed to realize the target.
Step 1: Download zip file from the websit
Step 2: Unzip data
Step 3: Read datas into R
Step 4: Merge Datas
2 Extracts only the measurements on the mean and standard deviation for each measurement.
Four Steps were designed to realize the target.
Step 1: Read feature names
Setp 2: Get col num of mean or std features
Step 3: Select cols of mean or std
Step 4: Rename select dataset
3 Uses descriptive activity names to name the activities in the data set
Two Steps were designed to realize the target.
Step 1: Read activity names
Step 2: Replace numbers with activity names
4 Appropriately labels the data set with descriptive variable names.
Five Steps were designed to realize the target.
Step 1: Delete "()"
Step 2: When start with "t", replace it with "time"
Step 3: When start with "f", replace it with "frenquency"
Step 4: Replace "-mean" with "Mean"
Step 5: Replace "-std" with "Std"
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Two Steps were designed to realize the target.
Step 1: Calculate mean of grouped data
Step 2: Write data to a text file
