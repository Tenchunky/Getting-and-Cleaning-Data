library(dplyr)

# Step 1: Load all relevant data sets from the 'Human Activity Recognition Using Smartphones Dataset, 
# Version 1.0'. As per its "README.txt", the loaded data sets have been checked for the following:
#    a.   'activity_labels' (6x2) contains the (6) activity identifier number and the 
#         corresponding activity name.
#    b.   'feature_labels' (561x2) contains the (561) feature identifier number and the 
#         corresponding feature name.
#    c.   'test_subjects' (2947x1) contains the subject's identifier number for each test.
#    d.   'test_labels' (2947x1) contains the activity identifier number for each test.
#    e.   'test' (2947x561) contains the test data set of 2947 observations.
#    f.   'train_subjects' (7352x1) contains the subject's identifier number for each training.
#    g.   'train_labels' (7352x1) contains the activity identifier number for each training.
#    h.   'train' (7352x561) contains the training data set of 7352 observations.
     
     # Load activity and feature labels.
     activity_labels <- read.table(file = "UCI-HAR-Dataset/activity_labels.txt")
     feature_labels <- read.table(file = "UCI-HAR-Dataset/features.txt")
     
     # Load test data set.
     test_subject <- read.table(file = "UCI-HAR-Dataset/test/subject_test.txt")
     test_activity <- read.table(file = "UCI-HAR-Dataset/test/y_test.txt")
     test <- read.table(file = "UCI-HAR-Dataset/test/X_test.txt")
     
     # Load training data set.
     train_subject <- read.table(file = "UCI-HAR-Dataset/train/subject_train.txt")
     train_activity <- read.table(file = "UCI-HAR-Dataset/train/y_train.txt")
     train <- read.table(file = "UCI-HAR-Dataset/train/X_train.txt")
     
     
# Step 2: Merge the test and training sets to create one data set. Appropriately labels the data set with 
# descriptive variable names and use descriptive activity names to name the activities in the data set
     # Add activity and subject columns to the left of 'test' and 'train' (cbind) and then merge the 
     # results and  save to 'merged' (rbind).
     merged <- rbind(cbind(test_activity, test_subject, test), cbind(train_activity, train_subject, train))
     
     # Label the columns with descriptive variable names 'activity', 'subject' and those loaded from
     # 'feature_labels'
     colnames(merged) <- c("activity", "subject", as.character(feature_labels[,2]))
     
     # Use descriptive activity names by replacing 'merged$activity' column which contains the activity 
     # identifier number with the corresponding descriptive variable name in activity_labels[,2].
     merged$activity <- activity_labels[merged$activity,2]
     
     
# Step 3: Extracts only the measurements on the mean and standard deviation for each measurement.
     # Create 'merged_filter' which contains TRUE/FALSE depending on whether the column contains mean 
     # or standard deviation. The "\\" in grepl indicates exact match with no spaces in between.
     merged_filter <- grepl("mean\\(\\)|std\\(\\)",colnames(merged))

     # Replace with TRUE for the columns containing activity and subject.
     merged_filter[1:2] <- TRUE

     # Create a subset 'merged_subset' that only contains the required columns. 
     merged_subset <- merged[,merged_filter]

     # Save 'merged_subset' to file
     write.table(x = merged_subset, file = "merged_subset.txt", row.names = FALSE)
     
     
# Step 4: From the data set in step 3, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
     # Group 'merged_subset" by activity and subject and save to 'tidy_data'
     tidy_data <- group_by(merged_subset, activity, subject)     

     # Find the average of each variable for each activity and each subject and save to and replace 
     # 'tidy_data'. summarise_each() from dplyr applies one or more functions to one or more column while 
     # excluding grouping variables.
     tidy_data <- summarise_each(tidy_data,funs(mean))

     # Save 'merged_subset' to file
     write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)