# Getting and Cleaning Data: Course Project    
   
      
### Introduction/Overview  
This repository collects all results of my work for the project in Coursera’s course "Getting and Cleaning Data" . The results are - as requested - four files:  

1.Readme.md (this file) - a markdown document explaining in brief background/ goal of the project, and the raw data used for this it. Additionally it gives a short overview about the other files (Codebook.md, run-analysis.R and tidy.txt).  
2. Codebook.md - a markdown document that describes the transformations performed on the raw data and the resulting variables   
3. run_analysis.R - the r script actually doing these transformations  
4. tidy.txt - the resulting data set    
  
### Project Background/ Goals and Raw Data  
The project deals with data on experiments that have been carried out with a group of 30 volunteers . Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, sensor signals have been captured based on which a set of variables (features) has been calculated. The researchers have the data set randomly partitioned into two sets - a training and a test data set.
Task of the project is to create one R script called run_analysis.R that  
1.	Merges the training and the test sets to create one data set  
2.	Extracts only the measurements on the mean and standard deviation for each measurement   
3.	Uses descriptive activity names to name the activities in the data set  
4.	Appropriately labels the data set with descriptive variable names   
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject   
  
**Important:** Please note that the folder "Inertial Signals" will not be used as mean or standard deviation (worked out from the column names - the features) are not included in this preliminary data and this data set can therefore go.
  
### Codebook (Codebook.md)    
CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

### Script (run-analysis.R)  
  
**Requirements/Preconditions**  
This script makes use of the packages dplyr and stringr. Therefore these packages must be installed before running the script.
It has further been developed on a Mac (which will make it necessary to adapt the file paths used to other environments (e.g. Windows).  
  
Additionally you have to make sure before running the script    
1.	That you have downloaded and extracted the UCI HAR dataset     
2.	That the dataset has been made available in a directory labeled „UCI HAR Dataset“  
3.	That the working directory is set to this location  

**Process Flow**  
run_analysis.R contains the code to perform all of the 5 tasks described under Project Background and Goals. The code has been appropriately commented in this R script to make clear what tasks are performed.
Principally the workflow is:  
1. Load required R packages - dplyr and stringr  
2. Read training and test data sets  
3. Merge training and test data sets   
4. Read activity names and feature labels  
5. Name columns with appropriate labels - including feature labels defined in prior step  
6. Calculate averages for all columns for each subject and activity  
7. Write this tidy dataset to a tab-delimited file called tidy.txt, which can also be found in this repository  

### Tidy Data (tidy.txt)
The resulting data set after running the R script "run-analysis.R"