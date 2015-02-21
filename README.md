# Getting-and-Cleaning-Data
This is the repository for the course project for the Coursera Course on Getting and Cleaning Data Course (getdata-011).

This repo contains the following files and folders. 
* `UCI HAR Dataset` - This folder contains the input data.
* `Codebook.md` - This file describes the variables and the data and any transformations or work that are performed to clean up the data.
* `README.md` - The readme file for this repo.
* `run_analysis.R` - This R script processes the data and generates the required tidy data set. 
* `tidy_data.txt` - This text file contains the output tidy data set.

* `CodeBook.md` - A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data


## Purpose 
The purpose of this project is to demonstrate the ability to collect, work with and clean a data set. The goal is to prepare a tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Objective
To create a R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How the run_analysis.R script works?
* Unzip the source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory. Check that the files are extracted to 
Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
Second, use source("run_analysis.R") command in RStudio.
Third, you will find two output files are generated in the current working directory:
merged_data.txt (7.9 Mb): it contains a data frame called cleanedData with 10299*68 dimension.
data_with_means.txt (220 Kb): it contains a data frame called result with 180*68 dimension.
Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.