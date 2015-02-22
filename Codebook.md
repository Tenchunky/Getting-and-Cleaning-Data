# Codebook


## Data Set Information
The output data set (tidy_data.txt) contains a processed subset of measurements from the Human Activity Recognition Using Smartphones Dataset Version 1.0. 

The input data set (UCI-HAR-Dataset) consists of measurements from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

More information for this experiment can be found at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Variables Information
The activity variable describes the activity performed which are either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.

The subject variable holds the volunteer's subject identifier number ranging from 1 to 30.

The rest of the varaibles come from measurements from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-X', '-Y' and '-Z' is used to denote 3-axial signals in the X, Y and Z directions respectively.

The suffix 'mean()' provides the mean value of each measurement and 'std()' provides the standard deviation of each measurement.


## Work performed to clean the data
1. Load all relevant data sets from the 'Human Activity Recognition Using Smartphones Dataset, Version 1.0' into R using `read.table()`. The loaded data sets are:
  * 'activity_labels' (6x2) contains the (6) activity identifier number and the corresponding activity name.
  * 'feature_labels' (561x2) contains the (561) feature identifier number and the corresponding feature name.
  * 'test_subjects' (2947x1) contains the subject's identifier number for each test.
  * 'test_labels' (2947x1) contains the activity identifier number for each test.
  * 'test' (2947x561) contains the test data set of 2947 observations.
  * 'train_subjects' (7352x1) contains the subject's identifier number for each training.
  * 'train_labels' (7352x1) contains the activity identifier number for each training.
  * 'train' (7352x561) contains the training data set of 7352 observations.
2. Merge the test and training sets with their corresponding activity and subject using `cbind()` and then merge the resulting data sets to create one data set using `rbind()`. 
3. Appropriately labels the data set with descriptive variable names using `colnames()` loaded from 'feature_labels'. 
4. Use descriptive activity names by replacing the activity column which contains the activity identifier number with the corresponding descriptive variable name 'activity_labels'.
5. Extracts only the measurements on the mean and standard deviation for each measurement by creating a 'merged_filter' variable which contains TRUE/FALSE depending on whether the column contains activity, subject, mean or standard deviation. `grepl()` is used to perform this for mean and standard deviation and "\\" operator is used to perform exact match with no spaces in between. This variable is then used to choose the required subset of the data set created in step 4.
6. A second independent tidy data set with the average of each variable for each activity and each subject is created by first grouping the data set created in step 5 using `group_by()` and then using `summarise_each()` to apply `mean()` to each column excluding grouping variables. Note that library(dplyr) has been loaded for these operations
7. The output in step 6 is then saved to file 'tidy_data.txt' using `write.table()`
