# Codebook #

## Data ##

The data was downloaded from the  **[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)**

## Transformations ##

### 1: Merging train and test data sets ###

The data was from each file was read using read.table(), and was stored in the following variables. <p> 

features <- features.txt   <br>
activity_classes <- activity_labels.txt  <br>
subject_test <- test/subject_test.txt   <br>
x_test_data <- test/X_test.txt   <br>
y_test_class <- test/y_test.txt <br>
subject_train <- test/subject_train.txt  <br>
x_train_data <- test/X_train.txt  <br>
y_train_class <- test/y_train.txt   <br>


The training and the test were merged to create the "tidy_data" dataset: <p>
 
x_merge <- rbind(x_train_data, x_test_data) <br>
y_merge <- rbind(y_train_class, y_test_class) <br>
subject_merge <- rbind(subject_train, subject_test) <br>
merged_data <- cbind(subject_merge, y_merge, x_merge) <br>

### 2: Extracts only the measurment on the mean and the standard deviation for each measurement ###
 
 The "tidy_data" dataset is created by using the select function from dplyr, selecting the subject and the class variables, and the variables containing the mean and the std values. 
 
### 3: Uses descriptive activty names to name the activities in the dataset ###
 
Numbers in class column of tidy_data were replaced with the respective activity names taken from second column of the activity_classes variable by subsetting the data.
              
### 4: Appropriately labelling the data set with descriptive variable names ###

Using the gsub() function, the following characters within the variable names were changed from  <br>

"^t", "^f", "Acc", "gravity", "jerk", "Gyro", "Mag", "mean",  
"std", "angle.t", "angle" "BodyBody", "class"  <br>

to  <br>

"Time", "Frequency" "Accelerometer", "Gravity", 
"jerk", "Jerk" "Gyroscope" "Magnitude" "Mean" "StandardDeviation", "AngleTime", "Angle", "Body", "Activity"  <br>
 
respectively. Punctuation was also removed. 

### 5: Create a second, independent dataset with the avergae of each variable for each activity and subject ###
 
The "final_data" dataset was created using the melt and dcast funtions from the reshape2 package, the data was grouped into subject and activity, and the mean for each variable was found.
 
## Variable List ##

The are 88 variables within the final data set, extracted from the original 561. These are as follows: <br>

 [1] "Subject" : This ranges from 1 to 30, as there were 30 participants in the investigation.   
 
 [2] "Activity": The values for this is limited to:  <br>
 
 "WALKING": subject was walking  <br>
 "WALKING_UPSTAIRS": subject was walking upstairs  <br>
 "WALKING_DOWNSTAIRS": subject was walking downstairs  <br>
 "SITTING": subject was sitting  <br>
 "STANDING": subject was standing  <br>
 "LAYING": subject was laying  <p>
 
 The following variabes are the mean and the standard deviation values for each measurement taken: <br>
 
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






