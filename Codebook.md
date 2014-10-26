# Code Book  
### Course Project: Getting and Cleaning Data  
  
### Raw Data

The project deals with data on experiments that have been carried out with a group of 30 volunteers . Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, sensor signals have been captured based on which a set of variables (features) has been calculated. The researchers have the data set randomly partitioned into two sets - a training and a test data set.

The original datasets can be retrieved from   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The description of the original data set can be obtained from  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The authors of the study and providers of the data set give following information on the measurements taken and units used:

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'*


### Data Processing and Cleaning

According to the task of this project  
1. the training and the test sets have been merged to create one data set  
2. beside activity and subject only features that include the mean and standard deviation for each measurementhave been included   
3. descriptive activity names have been used to name the activities in the data set  
4. the labels of the data set have been changed to carry descriptive variable names   
5. from the data set in step 4, a second, independent tidy data set has been craeted with the average of each variable for each activity and each subject  

**Important:** Please note that the folder "Inertial Signals" has not been used as mean or standard deviation (worked out from the column names - the features) are not included in this preliminary data and this data set can therefore go.

### Output Data Set
  
The resulting tidy data set includes following fields
 
**Activity**  
A string variable with following possible values: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS".


**Subject**  
An integer variable with a value from 1 to 30 denoting the ID of the volunteer who has done the observation  
  
**Measurements**  
Column 3 to 88 capture the average value of the measurements included in the tidy data set - per activity and subject. These measurements are numeric values, which can be positive or negative.

Following table clarifies in detail which measurements have been included in the tidy data set and how they have been renamed by the R-script.


Feature  |  Feature_Corrected
-------------------  |  ----------------------------
tBodyAcc-mean()-X  |	TimeBodyAccelerationMeanX
tBodyAcc-mean()-Y	|	TimeBodyAccelerationMeanY
tBodyAcc-mean()-Z	|	TimeBodyAccelerationMeanZ
tBodyAcc-std()-X	|	TimeBodyAccelerationStandardDeviationX
tBodyAcc-std()-Y	|	TimeBodyAccelerationStandardDeviationY
tBodyAcc-std()-Z	|	TimeBodyAccelerationStandardDeviationZ
tGravityAcc-mean()-X	|	TimeGravityAccelerationMeanX
tGravityAcc-mean()-Y	|	TimeGravityAccelerationMeanY
tGravityAcc-mean()-Z	|	TimeGravityAccelerationMeanZ
tGravityAcc-std()-X	|	TimeGravityAccelerationStandardDeviationX
tGravityAcc-std()-Y	|	TimeGravityAccelerationStandardDeviationY
tGravityAcc-std()-Z	|	TimeGravityAccelerationStandardDeviationZ
tBodyAccJerk-mean()-X	|	TimeBodyAccelerationJerkMeanX
tBodyAccJerk-mean()-Y	|	TimeBodyAccelerationJerkMeanY
tBodyAccJerk-mean()-Z	|	TimeBodyAccelerationJerkMeanZ
tBodyAccJerk-std()-X	|	TimeBodyAccelerationJerkStandardDeviationX
tBodyAccJerk-std()-Y	|	TimeBodyAccelerationJerkStandardDeviationY
tBodyAccJerk-std()-Z	|	TimeBodyAccelerationJerkStandardDeviationZ
tBodyGyro-mean()-X	|	TimeBodyGyroMeanX
tBodyGyro-mean()-Y	|	TimeBodyGyroMeanY
tBodyGyro-mean()-Z	|	TimeBodyGyroMeanZ
tBodyGyro-std()-X	|	TimeBodyGyroStandardDeviationX
tBodyGyro-std()-Y	|	TimeBodyGyroStandardDeviationY
tBodyGyro-std()-Z	|	TimeBodyGyroStandardDeviationZ
tBodyGyroJerk-mean()-X	|	TimeBodyGyroJerkMeanX
tBodyGyroJerk-mean()-Y	|	TimeBodyGyroJerkMeanY
tBodyGyroJerk-mean()-Z	|	TimeBodyGyroJerkMeanZ
tBodyGyroJerk-std()-X	|	TimeBodyGyroJerkStandardDeviationX
tBodyGyroJerk-std()-Y	|	TimeBodyGyroJerkStandardDeviationY
tBodyGyroJerk-std()-Z	|	TimeBodyGyroJerkStandardDeviationZ
tBodyAccMag-mean()	|	TimeBodyAccelerationMagnitudeMean
tBodyAccMag-std()	|	TimeBodyAccelerationMagnitudeStandardDeviation
tGravityAccMag-mean()	|	TimeGravityAccelerationMagnitudeMean
tGravityAccMag-std()	|	TimeGravityAccelerationMagnitudeStandardDeviation
tBodyAccJerkMag-mean()	|	TimeBodyAccelerationJerkMagnitudeMean
tBodyAccJerkMag-std()	|	TimeBodyAccelerationJerkMagnitudeStandardDeviation
tBodyGyroMag-mean()	|	TimeBodyGyroMagnitudeMean
tBodyGyroMag-std()	|	TimeBodyGyroMagnitudeStandardDeviation
tBodyGyroJerkMag-mean()	|	TimeBodyGyroJerkMagnitudeMean
tBodyGyroJerkMag-std()	|	TimeBodyGyroJerkMagnitudeStandardDeviation
fBodyAcc-mean()-X	|	FrequencyBodyAccelerationMeanX
fBodyAcc-mean()-Y	|	FrequencyBodyAccelerationMeanY
fBodyAcc-mean()-Z	|	FrequencyBodyAccelerationMeanZ
fBodyAcc-std()-X	|	FrequencyBodyAccelerationStandardDeviationX
fBodyAcc-std()-Y	|	FrequencyBodyAccelerationStandardDeviationY
fBodyAcc-std()-Z	|	FrequencyBodyAccelerationStandardDeviationZ
fBodyAcc-meanFreq()-X	|	FrequencyBodyAccelerationMeanFrequencyX
fBodyAcc-meanFreq()-Y	|	FrequencyBodyAccelerationMeanFrequencyY
fBodyAcc-meanFreq()-Z	|	FrequencyBodyAccelerationMeanFrequencyZ
fBodyAccJerk-mean()-X	|	FrequencyBodyAccelerationJerkMeanX
fBodyAccJerk-mean()-Y	|	FrequencyBodyAccelerationJerkMeanY
fBodyAccJerk-mean()-Z	|	FrequencyBodyAccelerationJerkMeanZ
fBodyAccJerk-std()-X	|	FrequencyBodyAccelerationJerkStandardDeviationX
fBodyAccJerk-std()-Y	|	FrequencyBodyAccelerationJerkStandardDeviationY
fBodyAccJerk-std()-Z	|	FrequencyBodyAccelerationJerkStandardDeviationZ
fBodyAccJerk-meanFreq()-X	|	FrequencyBodyAccelerationJerkMeanFrequencyX
fBodyAccJerk-meanFreq()-Y	|	FrequencyBodyAccelerationJerkMeanFrequencyY
fBodyAccJerk-meanFreq()-Z	|	FrequencyBodyAccelerationJerkMeanFrequencyZ
fBodyGyro-mean()-X	|	FrequencyBodyGyroMeanX
fBodyGyro-mean()-Y	|	FrequencyBodyGyroMeanY
fBodyGyro-mean()-Z	|	FrequencyBodyGyroMeanZ
fBodyGyro-std()-X	|	FrequencyBodyGyroStandardDeviationX
fBodyGyro-std()-Y	|	FrequencyBodyGyroStandardDeviationY
fBodyGyro-std()-Z	|	FrequencyBodyGyroStandardDeviationZ
fBodyGyro-meanFreq()-X	|	FrequencyBodyGyroMeanFrequencyX
fBodyGyro-meanFreq()-Y	|	FrequencyBodyGyroMeanFrequencyY
fBodyGyro-meanFreq()-Z	|	FrequencyBodyGyroMeanFrequencyZ
fBodyAccMag-mean()	|	FrequencyBodyAccelerationMagnitudeMean
fBodyAccMag-std()	|	FrequencyBodyAccelerationMagnitudeStandardDeviation
fBodyAccMag-meanFreq()	|	FrequencyBodyAccelerationMagnitudeMeanFrequency
fBodyBodyAccJerkMag-mean()	|	FrequencyBodyBodyAccelerationJerkMagnitudeMean
fBodyBodyAccJerkMag-std()	|	FrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
fBodyBodyAccJerkMag-meanFreq()	|	FrequencyBodyBodyAccelerationJerkMagnitudeMeanFrequency
fBodyBodyGyroMag-mean()	|	FrequencyBodyBodyGyroMagnitudeMean
fBodyBodyGyroMag-std()	|	FrequencyBodyBodyGyroMagnitudeStandardDeviation
fBodyBodyGyroMag-meanFreq()	|	FrequencyBodyBodyGyroMagnitudeMeanFrequency
fBodyBodyGyroJerkMag-mean()	|	FrequencyBodyBodyGyroJerkMagnitudeMean
fBodyBodyGyroJerkMag-std()	|	FrequencyBodyBodyGyroJerkMagnitudeStandardDeviation
fBodyBodyGyroJerkMag-meanFreq()	|	FrequencyBodyBodyGyroJerkMagnitudeMeanFrequency
angle(tBodyAccMean,gravity)	|	AngleTimeBodyAccelerationMeanGravity
angle(tBodyAccJerkMean),gravityMean)	|	AngleTimeBodyAccelerationJerkMeanGravityMean
angle(tBodyGyroMean,gravityMean)	|	AngleTimeBodyGyroMeanGravityMean
angle(tBodyGyroJerkMean,gravityMean)	|	AngleTimeBodyGyroJerkMeanGravityMean
angle(X,gravityMean)	|	AngleXGravityMean
angle(Y,gravityMean)	|	AngleYGravityMean
angle(Z,gravityMean)	|	AngleZGravityMean  
  
  