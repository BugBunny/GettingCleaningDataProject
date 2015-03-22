# Getting and Cleaning Data - Course Project
# RScript: Ian, 22 March 2015

# Uses the UCI HAR Dataset; assumes that it has been unzipped
# inside the working directory retaining the directory tree

# Step 1: Merge training and test datasets

# Prefix the test measurements with subject an activity identifiers
# from the subject_test and y_test tables respectively
test_data1 <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test_data1) <- "Subject"
test_data2 <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_data2) <- "Activity"
test_data3 <- read.table("UCI HAR Dataset/test/X_test.txt")
test_data <- cbind(test_data1, test_data2, test_data3)
remove("test_data1", "test_data2", "test_data3")

# Prefix the train measurements with subject and activity identifiers
# from the subject_train and y_train tables respectively
train_data1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(train_data1) <- "Subject"
train_data2 <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train_data2) <- "Activity"
train_data3 <- read.table("UCI HAR Dataset/train/X_train.txt")
train_data <- cbind(train_data1, train_data2, train_data3)
remove("train_data1", "train_data2", "train_data3")

# As the files contain data on different subjects merging with
# all==TRUE (i.e an outer join) has the effect of concatentating them
big_data <- merge(test_data, train_data, all = TRUE)
remove("test_data", "train_data")

# Step 2: Drop all measurements (features) except means and sd's

# (Columns are offset upward by 2 from the original file due to the
# insertion of Subject and Activity variables in front of the
# measurements)
data <- big_data[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:208,
                     216:217, 229:230, 242:243, 255:256, 268:273,
                     347:352, 426:431, 505:506, 518:519, 531:532,
                     544:545)]
remove("big_data")

# Step 3: Add descriptive names for the Activities to the variable
# from the activity_labels table
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
data$Activity <- factor(data$Activity, as.character(activity_labels$V1),
                         labels = as.character(activity_labels$V2))

# Step 4: Label the dataset with appropriate variable names from
# the features table
features <- read.table("UCI HAR Dataset/features.txt")
feature_labels <- as.character(features[c(1:6, 41:46, 81:86,
                                121:126, 161:166, 201:206, 214:215,
                                227:228, 240:241, 253:254, 266:271,
                                345:350, 424:429, 503:504, 516:517,
                                529:530, 542:543),2])
colnames(data) <- c("Subject", "Activity", feature_labels)

write.table(data, file = "project_data_disaggregated.txt",
            row.names = FALSE)

# Step 5: Calculate and save average measures by activity and subject

# The data are left in "wide" format with all the measures for a particular
# subject-activity pairing stored on single record.

# aggregate renames Subject & Activity and unfactorizes Activity. I
# expect dplyr or some other approach to aggregation avoids this but,
# rather than investigating, I have simply rerun the necessary (&
# computationally trivial) parts of Steps 3 & 4 on the aggregated data.
data <- aggregate(data[,3:72], by = list(as.numeric(data$Subject),
                   as.numeric(data$Activity)), mean)
data$Activity <- factor(data$Activity, as.character(activity_labels$V1),
                        labels = as.character(activity_labels$V2))
colnames(data) <- c("Subject", "Activity", feature_labels)
# Sort back into activity within Subject
library(dplyr)
data <- arrange(data, Subject, Activity)

write.table(data, file = "Getting_Cleaning_Project_Data.txt",
            row.names = FALSE)
