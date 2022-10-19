# Prerequisites: Downloading data and installing packages.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "data.zip"

if(!file.exists(filename)) {
  download.file(fileUrl,destfile=filename,method="curl")
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

library(dplyr) #install packages
library(reshape2)



#Part 1: Merging data sets to create one data set.

#Storing the data sets from original files into appropriate variables and column names.

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity_classes <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("class", "activity"))
subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train_data <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions) #This titles each column as each column the now named function column from the features data set.
y_train_class <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "class")
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test_data <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)  #This titles each column as each column the now named function column from the features data set.
y_test_class <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "class")

#Merging the data sets.

x_merge <- rbind(x_train_data, x_test_data)
y_merge <- rbind(y_train_class, y_test_class)
subject_merge <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_merge, y_merge, x_merge)



#Part 2: Extracting mean and standard deviation for each measurement. 

tidy_data <- select(merged_data, subject, class, contains("mean"), contains("std")) #Extracting the mean and std columns. 



#Part 3: Using descriptive activity names to rename the activities in the data set. 

tidy_data$class <- activity_classes[tidy_data$class,2] #This sets the rows of the activity class data frame, to the rows in the class column of the tidy dataset. Column 2 is the activity name for each class number, so the class numbers in the tidy data set become the activity names.



#Part 4: Appropriately labelling the data set.

names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
names(tidy_data) <- gsub("jerk", "Jerk", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("mean", "Mean", names(tidy_data))
names(tidy_data) <- gsub("std", "StandardDeviation", names(tidy_data))
names(tidy_data) <- gsub("angle.t", "AngleTime", names(tidy_data))
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("subject", "Subject", names(tidy_data))
names(tidy_data) <- gsub("class", "Activity", names(tidy_data))
names(tidy_data) <- gsub("[[:punct:]]", "", names(tidy_data))


#Part 5: Create new data set with the mean for each subject and activity. 

melted_data <- melt(tidy_data, id.vars  = c("Subject", "Activity")) #Groups the data into subject and activity, the rest of the columns become the variables.
final_data <- dcast(melted_data, Subject + Activity ~ variable, mean)  #Finds the mean of each variable for each subject and activity.

View(final_data)
write.table(final_data, "final_data.txt", row.names = FALSE) #Creates txt file of final data.

