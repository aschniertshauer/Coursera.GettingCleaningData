# Coursera "Getting and Cleaning Data" - Course Project
# Author: Alexander S.
# Date: 2014-10-25
# Version: 1.0
#
# -------------------------------------------------------------------------------------------
# Load packages required
#
library(dplyr)
library(stringr)
#
# -------------------------------------------------------------------------------------------
# Read training data sets
#
x_train <- read.table("train/X_train.txt", quote="\"")
activity_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
#
# -------------------------------------------------------------------------------------------
# Read test data sets
#
x_test <- read.table("test/X_test.txt", quote="\"")
activity_test <- read.table("test/y_test.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")
#
# -------------------------------------------------------------------------------------------
# Merge training and test data sets and combine the 3 data sets into 1 data set
#
x_combined <- rbind(x_train, x_test)
activity_combined <- rbind(activity_train, activity_test)
subject_combined<- rbind(subject_train, subject_test)
total<-data.frame(cbind(subject_combined,activity_combined,x_combined))
#
# -------------------------------------------------------------------------------------------
# Read activity labels and feature names
#
features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")
names(activity_labels)<-c("Activity_ID","Activity")
#
# -------------------------------------------------------------------------------------------
# Remove punctuation from feature labels and define descriptive names for the feature labels
# 
names(features)<-c("Feature_ID","Feature")
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature, "[[:punct:]]", ""))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "Acc", "Acceleration"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "Mag", "Magnitude"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "Freq", "Frequency"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "mean", "Mean"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "std", "StandardDeviation"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "^t", "Time"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "^f", "Frequency"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "mean", "Mean"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "anglet", "AngleTime"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "angle", "Angle"))
features<-mutate(features,Feature_Corrected=str_replace_all(features$Feature_Corrected, "gravity", "Gravity"))
#
# -------------------------------------------------------------------------------------------
# Rename columns with appropriate labels and select just
# features that contain mean or standard deviation (mean)
#
names(total)<-c("Subject","Activity_ID",features$Feature_Corrected)
selection<-select(total,Subject,Activity_ID,mget(grep("Mean|StandardDeviation",names(total),value=T)))
#
# -------------------------------------------------------------------------------------------
# Add a column that has descriptive activity names by joining "selection" with
# "activity_labels"
selection<-left_join(selection,activity_labels)
selection<-select(selection,-Activity_ID)
#
# -------------------------------------------------------------------------------------------
# Calculate averages for all columns for each subject and activity
tidy<-selection %>% 
  group_by(Activity,Subject) %>% 
  summarise_each(funs(mean))
#
# -------------------------------------------------------------------------------------------
# Save result
write.table(tidy, "tidy.txt",row.name=F)
#