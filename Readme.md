####Overview
This repository provides R code for creating a tidy dataset from the "Human Activity Recognition Using Smartphones Dataset".  The "Human Activity Recognition Using Smartphones Dataset" ("source data") is a publicly available dataset which can be obtained at the following [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  For your convenience, the dataset is included in this repository in the "UCI HAR Dataset" folder along with the associated "Readme.txt" and "features_info.txt".  This dataset is the result of an experiment conducted to capture accelerometer and gyroscope readings from Samsung Galaxy S II smartphones attached to 30 volunteer subjects performing 6 different activities. See References for more details on the source data[1].

The resulting tidy dataset, "tidy_wearable_ordered.txt", represents only the mean() and std() Features averaged by Activity and Subject.  The tidy data set has the following characteristics:

1. 180 observations including 6 Activities performed by 30 Subjects.  Each observation is in it's own row.
2. The average of 66 mean() and std() Features extracted from a total of 561 total Features in the source data.
3. Each Feature is in it's own column with a human readable column name.

This dataset fully embodies the requirements of a tidy dataset:

1. Each Feature variable is in it's own column.
2. Each average of the 180 observations is in it's own row.
3. There is 1 table for the resulting Feature averages.
4. There was no need for multiple tables, since the data is all related to the same observations and has the same characteristics.
5. The table has a row at the top with the variable names.
6. The variable names are human readable.
7. The data is in a single file since there is only one table for the tidy dataset. 

####List of Files
* ***run_analysis.R***
    * Main R Script provided to execute the cleanup of the data and create a tidy dataset.
* ***human-activity-recognition.Rproj***
    * An RStudio project file for the repository.
* ***Readme.md*** 
    * This file, which provides an overview of the project, the contents of the repository, how to run the code and the transformations used to create the tidy dataset.
* ***CodeBook.md***
    * A codebook detailing the structure of the variables in the resulting tidy dataset.
* ***UCI HAR Dataset***
    * This directory contains the original source data, readme's and codebook.
* ***tidy_wearable_ordered.txt***
    * The resulting tidy dataset created by running the analysis.
    
    
####Running the Code
The following are the required steps to run the script:

1. Download this Github repository: https://github.com/cmchenry/HumanActivityRecognition.git
2. Install Install R 3.1.1 "Sock it to Me"
3. Install RStudio 0.98.1062
4. Open the "human-activity-recognition.Rproject"
5. Obtain the "plyr" package by running `install.packages("plyr")` at the R Console.
6. In the R Console, run `source("run_analysis.R")`
7. The output will be a file in the project directory called "tidy_wearable_ordered.txt".

####Tranformations a Create Tidy Dataset
The following were the transformations of the source data used to create the resulting tidy dataset:

1. Loaded and combined source Subject data:
    * subject_test.txt
    * subject_train.txt
2. Loaded and combined the  source Activity data:
    * Y_test.txt
    * Y_train.txt
3. Loaded and combined the source Feature data:
    * X_test.txt
    * X_train.txt
4. Loaded Feature names data and filtered out only the mean() and std() features.  Also cleaned up feature names for human readable Feature column names.  NOTE: It was determined that only the mean() and std() features were required. The meanFreq() features represent the frequency components to obtain the mean() and thus are not features of interest for this tidy dataset:
    * features.txt
5. Using the Feature indexes in step #4, filtered the loaded Feature data created in step #3 to the required mean() and std() features.  Also added human readable column names to the Features.
6. Loaded Activity Labels and joined them to the Activity data loaded in step #2.  Assigned a human readable column name to the activity data:
    * activity_labels.txt
7. Combined the columns of the transformed Subject, Activity and Features datasets to create the raw tidy dataset.
8. Summarized the dataset created in step #7, by calculating the average of each feature, by Activity and by Subject.  Sorted the data by Activity and Subject for easy interpretation.
9. Exported the summarized tidy dataset to the following file:
    * tidy_wearable_ordered.txt
    
####References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012