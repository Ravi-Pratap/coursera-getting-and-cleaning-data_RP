# coursera-getting-and-cleaning-data_RP

Getting and Cleaning Data Course Project

## INTRODUCTION

This repository contains my Coursera Course project Assignement for Course:"Getting and Cleaning data", part of the Data Science specialization. 

## PURPOSE
The purpose of this project was to demonstrate my ability to collect, work with, and clean a data set.
The goal was to prepare tidy data that can be used for later analysis

## Review Criteria Was As Following

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
3. The README that explains the analysis files is clear and understandable.
4. The work submitted for this project is the work of the student who submitted it.

## About The Data Set

The data used for this project was data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.	

## About Processing of raw data
## Prerequisites for this script is the UCI HAR Dataset:
 Data needs to be extracted in the following Local directory for the run_analysis.R script to Work
 D:\LND\COURSERA_R\data\UCI HAR Dataset
 D:\LND\COURSERA_R\data\UCI HAR Dataset\test
 D:\LND\COURSERA_R\data\UCI HAR Dataset\train
 
the UCI HAR Dataset must be extracted and..
the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"
After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

##Reading Raw Data txt files 																  
- 'features_info.txt'	: Shows information about the variables used on the feature vector.     
- 'features.txt'		: List of all features.													  						
- 'activity_labels.txt'	: Links the class labels with their activity name.                    
- 'train/X_train.txt'	: Training set.                                                         
- 'train/y_train.txt'	: Training labels.                                                      
- 'test/X_test.txt'		: Test set.                                                                 
- 'test/y_test.txt'		: Test labels

## About R Script and CodeBook
 created R Script called run_analysis.R to do the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
About the Code Book
The CodeBook.md file explains the transformations performed and the resulting data and variables.

