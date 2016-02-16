###############################################################################################
# Script:run_analysis.R                                                                       #   
# CODE BOOK			Created By: RAVI PRATAP FEB 2016                 					                    #			
# Setting Working Directory to the Data Storage in my Local Drive                             #
# Use the Data link to Get the data for this Project                                          #
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip      #
# Extract the files to R Working Files                                                        #
###############################################################################################

###############################################################################################
# Setting Working Directory to the Data Storage in my Local Drive                             #
###############################################################################################
library(dplyr)
setwd("D:/LND/COURSERA_R/data/UCI HAR Dataset")

###############################################################################################
#  Reading Raw Data txt files 																  #
#- 'features_info.txt': Shows information about the variables used on the feature vector.     #
#- 'features.txt': List of all features.													  #						
#- 'activity_labels.txt': Links the class labels with their activity name.                    #
#- 'train/X_train.txt': Training set.                                                         #
#- 'train/y_train.txt': Training labels.                                                      #
#- 'test/X_test.txt': Test set.                                                               #  
#- 'test/y_test.txt': Test labels.                                                            #
############################################################################################### 

X_train <- read.table("train/X_train.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")

X_test <- read.table("test/X_test.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"", colClasses = c("character"))
activity_labels <- read.table("activity_labels.txt", quote="\"",col.names = c("ActivityId", "Activity"))

###############################################################################################
# 1. MERGING TRAINING and TEST Data Sets  to One Data Set                                     #
# Binding sensor data using Cbind and rbind                                                   #
###############################################################################################

train_sensor_data 	<- cbind(cbind(X_train, subject_train), y_train)
test_sensor_data	<- cbind(cbind(X_test, subject_test), y_test)
sensor_data        <- rbind(train_sensor_data, test_sensor_data)

###############################################################################################
# 3. Adding Sensor Data Labels  using Features and Naming Subject and ActivityId              #
###############################################################################################

sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor_data) <- sensor_labels

###############################################################################################
# 2. Extracting Mean, Standard Deviation (STD) for each measurement (Subject and Actvity ID ) #
###############################################################################################

sensor_data_mean_std <- sensor_data[,grepl("mean|std|Subject|ActivityId", names(sensor_data))]

###############################################################################################
# 3. Uses descriptive activity names to name the activities in the data set using left_Join   #   
###############################################################################################

Sensor_data_mean_std <- left_join(sensor_data_mean_std, activity_labels, by = "ActivityId", match = "first")
sensor_data_mean_std <- sensor_data_mean_std[,-1]

###############################################################################################
# 4. Appropriately labels the data set with descriptive names.                                # 
# gsub() function replaces all matches of a string, if the parameter is a string vector,      #
# returns a string vector of the same length and with the same attributes (after possible     #
# coercion to character). Elements of string vectors which are not substituted will be        #
# returned unchanged (including any declared encoding).                                       #
# --Remove parentheses --                                                                     #   
###############################################################################################

names(sensor_data_mean_std) <- gsub('\\(|\\)',"",names(sensor_data_mean_std), perl = TRUE)

###############################################################################################
# 4. Make Descriptive Variable Names                                                          #
###############################################################################################

names(sensor_data_mean_std) <- make.names(names(sensor_data_mean_std))

names(sensor_data_mean_std) <- gsub('Acc',"Acceleration",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('Gyro',"AngularSpeed",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('Mag',"Magnitude",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('^t',"TimeDomain.",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('^f',"FrequencyDomain.",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('\\.mean',".Mean",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('\\.std',".StandardDeviation",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('Freq\\.',"Frequency.",names(sensor_data_mean_std))
names(sensor_data_mean_std) <- gsub('Freq$',"Frequency",names(sensor_data_mean_std))

###############################################################################################
# 5.Create a second, independent tidy data set with the average of each variable for each     #
#   activity and each subject.                                                                #
# funs function provides a flexible way to generate a named list of functions for input to    #
#   other functions like summarise_each.                                                      #  
###############################################################################################

View(Sensor_data_mean_std)
sensor_avg_by_act_sub <-(Sensor_data_mean_std%>% group_by(Subject,Activity) %>% summarise_each(funs( mean)))
write.table(sensor_avg_by_act_sub, file = "sensor_avg_by_act_sub.txt", sep="\t")
print (sensor_avg_by_act_sub)

###############################################################################################
# END                                                                                         #  
###############################################################################################
