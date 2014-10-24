# The purpose of this project is to demonstrate my ability to collect,  work with, 
# and clean a data set. The goal is to prepare tidy data that can be used for
# later analysis.

# Following are submitted for this project
# 1. A tidy data set as described in the problem
# 2. A link to a Github repository with my script for performing the analysis
# 3. A code book that describes the variables,  the data,  and any transformations 
# or work that you performed to clean up the data called CodeBook.md.
# A README.md is included in the repo with scripts.  

library(data.table)

# Download and unzip the file from URL provided
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,  destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# Read the test data from unzipped folder
test_X <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
test_Y <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
test_Sub <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)

# Read the train data from unzipped folder
train_X <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
train_Y <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
train_Sub <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Name the activities in the dataset
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character")
test_Y$V1 <- factor(test_Y$V1, levels = activity_Labels$V1, labels = activity_Labels$V2)
train_Y$V1 <- factor(train_Y$V1, levels = activity_Labels$V1, labels=activity_Labels$V2)

# Label data with descriptive activity names
features_Selection <- read.table("UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
colnames(test_X) <-features_Selection$V2
colnames(test_Y) <- c("Activity")
colnames(test_Sub) <- c("Subject")

colnames(train_X) <-features_Selection$V2
colnames(train_Y) <- c("Activity")
colnames(train_Sub) <- c("Subject")

# Merge test datasets
merged_Test <- cbind(test_X, test_Y, test_Sub)

# Merge train datasets
merged_Train <- cbind(train_X, train_Y, train_Sub)

# Merge all datasets and write in a text file
merged_AllData <- rbind(merged_Test, merged_Train)

# Extract the mean of each measurements
mean_AllData <- sapply(merged_AllData, mean, na.rm=TRUE)

# Extract the standard deviation of each measurements
stdev_AllData <- sapply(merged_AllData, sd, na.rm=TRUE)

# Create an independent tidy data set
tidy_Data <- (data.table(merged_AllData))[ , lapply(.SD,mean), by="Activity,Subject"]

# Write the dataset in a .txt file
write.table(tidy_Data, file="tidy_data.txt", append = FALSE, sep=" ",row.names = FALSE)
