require(plyr)
## Load Subject datasets and merge test and training data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test, subject_train)
subject_named <- setNames(subject, "Subject") ## Name the column

## Load the Activity datasets and merge the test and training data
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
y <- rbind(y_test, y_train)

## Load Measurement datasets and merge test and training data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x <- rbind(x_test, x_train)

## Load Feature names dataset and filter out mean and std features
features <- read.table("UCI HAR Dataset/features.txt",col.names = c("featureCol", "featureName"))
features_mean_std <- subset(features, grepl("mean\\(\\)|std\\(\\)", features$featureName), drop=T)

## Use only the mean and std features
x_mean_std <- x[,as.vector(features_mean_std[,1])]
x_mean_std_named <- setNames(x_mean_std, as.vector(features_mean_std[,2]))  ## Name the columns

## Load the Activity labels and join them with the Activity data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
y_labels <- join(y, activity_labels, by=c("V1"))
activities <- y_labels["V2"]
activities_named <- setNames(activities, "Activity")

## Tidy Data for Step #4 - Combine the columns of the Activity, Subject and Features data
tidy_wearable <- cbind(activities_named, subject_named, x_mean_std_named)

## Compute the mean of each Feature by Activity and Subject
tidy_wearable_avgs <- aggregate(tidy_wearable[,3:68],
                                by=tidy_wearable[c("Activity", "Subject")], 
                                mean)

## Tidy Data for Step #5 - Reorder by Activity then Subject as suggested by intruction #5
tidy_wearable_ordered <- arrange(tidy_wearable_avgs, 
                                 tidy_wearable_avgs$Activity, 
                                 tidy_wearable_avgs$Subject)

## Export the tidy data to a text file for submission.
write.table(tidy_wearable_ordered, "tidy_wearable_ordered.txt", row.name=F)