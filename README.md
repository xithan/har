## Human Activity Recognition Using Smartphones Data Set 

As part of cousera's `Getting and Cleaning Data` course this project tidies up data from
a human activity recognition experiment using sensors in a smartphone.

### Data cleaning and analysis

`run_analysis.R` 
* merges the train and test data from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* extracts all mean and standard deviation measurements
* assigns an activity label to each measurement from `activity_labels.txt` by mapping the the acitivity ids in `y_test.txt`/`y_train.txt` to the measurement data int `X_test.txt`/`X_train.txt`
* assigns a subject id to each measurement from `subject_test.txt`/`subject_train.txt`

The result is stored in `tidy_data.txt`. 
Another dataset with the average for each variable for each activity and each subject is stored in `mean_data.txt`.
