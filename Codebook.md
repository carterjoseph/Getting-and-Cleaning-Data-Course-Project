This is my code book.

## Variable List ##

The are 88 variables within the final data set, extracted from the original 561. These are as follows:

 [1] "Subject" : This ranges from 1 to 30, as there were 30 participants in the investigation.   
 
 [2] "Activity": The values for this is limited to:
 
 "WALKING": subject was walking
 "WALKING_UPSTAIRS": subject was walking upstairs
 "WALKING_DOWNSTAIRS": subject was walking downstairs
 "SITTING": subject was sitting
 "STANDING": subject was standing
 "LAYING": subject was laying
 
 The following variabes are the mean and the standard deviation values for each measurement taken:
 
 [3] "TimeBodyAccelerometerMeanX"                              
 [4] "TimeBodyAccelerometerMeanY"                              
 [5] "TimeBodyAccelerometerMeanZ"                              
 [6] "TimeGravityAccelerometerMeanX"                           
 [7] "TimeGravityAccelerometerMeanY"                           
 [8] "TimeGravityAccelerometerMeanZ"                           
 [9] "TimeBodyAccelerometerJerkMeanX"                          
[10] "TimeBodyAccelerometerJerkMeanY"                          
[11] "TimeBodyAccelerometerJerkMeanZ"                          
[12] "TimeBodyGyroscopeMeanX"                                  
[13] "TimeBodyGyroscopeMeanY"                                  
[14] "TimeBodyGyroscopeMeanZ"                                  
[15] "TimeBodyGyroscopeJerkMeanX"                              
[16] "TimeBodyGyroscopeJerkMeanY"                              
[17] "TimeBodyGyroscopeJerkMeanZ"                              
[18] "TimeBodyAccelerometerMagnitudeMean"                      
[19] "TimeGravityAccelerometerMagnitudeMean"                   
[20] "TimeBodyAccelerometerJerkMagnitudeMean"                  
[21] "TimeBodyGyroscopeMagnitudeMean"                          
[22] "TimeBodyGyroscopeJerkMagnitudeMean"                      
[23] "FrequencyBodyAccelerometerMeanX"                         
[24] "FrequencyBodyAccelerometerMeanY"                         
[25] "FrequencyBodyAccelerometerMeanZ"                         
[26] "FrequencyBodyAccelerometerMeanFreqX"                     
[27] "FrequencyBodyAccelerometerMeanFreqY"                     
[28] "FrequencyBodyAccelerometerMeanFreqZ"                     
[29] "FrequencyBodyAccelerometerJerkMeanX"                     
[30] "FrequencyBodyAccelerometerJerkMeanY"                     
[31] "FrequencyBodyAccelerometerJerkMeanZ"                     
[32] "FrequencyBodyAccelerometerJerkMeanFreqX"                 
[33] "FrequencyBodyAccelerometerJerkMeanFreqY"                 
[34] "FrequencyBodyAccelerometerJerkMeanFreqZ"                 
[35] "FrequencyBodyGyroscopeMeanX"                             
[36] "FrequencyBodyGyroscopeMeanY"                             
[37] "FrequencyBodyGyroscopeMeanZ"                             
[38] "FrequencyBodyGyroscopeMeanFreqX"                         
[39] "FrequencyBodyGyroscopeMeanFreqY"                         
[40] "FrequencyBodyGyroscopeMeanFreqZ"                         
[41] "FrequencyBodyAccelerometerMagnitudeMean"                 
[42] "FrequencyBodyAccelerometerMagnitudeMeanFreq"             
[43] "FrequencyBodyAccelerometerJerkMagnitudeMean"             
[44] "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq"         
[45] "FrequencyBodyGyroscopeMagnitudeMean"                     
[46] "FrequencyBodyGyroscopeMagnitudeMeanFreq"                 
[47] "FrequencyBodyGyroscopeJerkMagnitudeMean"                 
[48] "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq"             
[49] "AngleTimeBodyAccelerometerMeanGravity"                   
[50] "AngleTimeBodyAccelerometerJerkMeanGravityMean"           
[51] "AngleTimeBodyGyroscopeMeanGravityMean"                   
[52] "AngleTimeBodyGyroscopeJerkMeanGravityMean"               
[53] "AngleXGravityMean"                                       
[54] "AngleYGravityMean"                                       
[55] "AngleZGravityMean"                                       
[56] "TimeBodyAccelerometerStandardDeviationX"                 
[57] "TimeBodyAccelerometerStandardDeviationY"                 
[58] "TimeBodyAccelerometerStandardDeviationZ"                 
[59] "TimeGravityAccelerometerStandardDeviationX"              
[60] "TimeGravityAccelerometerStandardDeviationY"              
[61] "TimeGravityAccelerometerStandardDeviationZ"              
[62] "TimeBodyAccelerometerJerkStandardDeviationX"             
[63] "TimeBodyAccelerometerJerkStandardDeviationY"             
[64] "TimeBodyAccelerometerJerkStandardDeviationZ"             
[65] "TimeBodyGyroscopeStandardDeviationX"                     
[66] "TimeBodyGyroscopeStandardDeviationY"                     
[67] "TimeBodyGyroscopeStandardDeviationZ"                     
[68] "TimeBodyGyroscopeJerkStandardDeviationX"                 
[69] "TimeBodyGyroscopeJerkStandardDeviationY"                 
[70] "TimeBodyGyroscopeJerkStandardDeviationZ"                 
[71] "TimeBodyAccelerometerMagnitudeStandardDeviation"         
[72] "TimeGravityAccelerometerMagnitudeStandardDeviation"      
[73] "TimeBodyAccelerometerJerkMagnitudeStandardDeviation"     
[74] "TimeBodyGyroscopeMagnitudeStandardDeviation"             
[75] "TimeBodyGyroscopeJerkMagnitudeStandardDeviation"         
[76] "FrequencyBodyAccelerometerStandardDeviationX"            
[77] "FrequencyBodyAccelerometerStandardDeviationY"            
[78] "FrequencyBodyAccelerometerStandardDeviationZ"            
[79] "FrequencyBodyAccelerometerJerkStandardDeviationX"        
[80] "FrequencyBodyAccelerometerJerkStandardDeviationY"        
[81] "FrequencyBodyAccelerometerJerkStandardDeviationZ"        
[82] "FrequencyBodyGyroscopeStandardDeviationX"                
[83] "FrequencyBodyGyroscopeStandardDeviationY"                
[84] "FrequencyBodyGyroscopeStandardDeviationZ"                
[85] "FrequencyBodyAccelerometerMagnitudeStandardDeviation"    
[86] "FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation"
[87] "FrequencyBodyGyroscopeMagnitudeStandardDeviation"        
[88] "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation"  


## Transformations ##

# 1: Merging train and test data sets

The data was from each file was read using read.table(), and was stored in the following variables. <p> 

features <- features.txt : 561 rows, 2 columns. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. <br>
activities <- activity_labels.txt : 6 rows, 2 columns. List of activities performed when the corresponding measurements were taken and its codes (labels)<br>
subject_test <- test/subject_test.txt : 2947 rows, 1 column. Contains test data of 9/30 volunteer test subjects being observed. <br>
x_test <- test/X_test.txt : 2947 rows, 561 columns. Contains recorded features test data. <br>
y_test <- test/y_test.txt : 2947 rows, 1 columns. Contains test data of activities’code labels.<br>
subject_train <- test/subject_train.txt : 7352 rows, 1 column. Contains train data of 21/30 volunteer subjects being observed. <br>
x_train <- test/X_train.txt : 7352 rows, 561 columns. Contains recorded features train data. <br>
y_train <- test/y_train.txt : 7352 rows, 1 columns. Contains train data of activities’code labels. <br>


Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
Merged_Data (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

# 4: Appropriately labelling the data set with descriptive variable names #

Using the gsub() function, the following characters within the variable names were changed from

"^t", "^f", "Acc", "gravity", "jerk", "Gyro", "Mag", "mean",
"std", "angle.t", "angle" "BodyBody"

to

"Time", "Frequency" "Accelerometer", "Gravity", 
"jerk", "Jerk" "Gyroscope" "Magnitude" "Mean" "StandardDeviation", "AngleTime", "Angle", "Body"
 
respectively. Punctuation was also removed. 








