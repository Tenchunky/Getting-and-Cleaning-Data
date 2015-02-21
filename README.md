# Getting-and-Cleaning-Data
This is the repository for the course project for the Coursera Course on Getting and Cleaning Data Course (getdata-011).

This repo contains the following files and folders. 
* `UCI HAR Dataset` - This folder contains the input data.
* `Codebook.md` - This file describes the variables and the data and any transformations or work that are performed to clean up the data.
* `README.md` - The readme file for this repo.
* `run_analysis.R` - This R script processes the data and generates the required tidy data set. 
* `tidy_data.txt` - This text file contains the output tidy data set.


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
* Unzip the source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory.
* Copy the run_analysis.R script into the working directory
* Perform `source("run_analysis.R")` command in R
* Upon successful running of the script, you will find an output file (tidy_data.txt) generated in the working directory. This file contains the tidy data set with the average of each variable for each activity and each subject (180 rows by 68 columns).
* Perform `data <- read.table("tidy_data.txt",header = TRUE)` command in R to read the final output file