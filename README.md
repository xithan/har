### Human Activity Recognition Using Smartphones Data Set 

## Data cleaning>

`run_analysis.R` 
* merges the train and test data from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* extracts all mean and standard deviation measurements
* assigns an activity labels to each measurement from `activity_labels.txt` by mapping the the acitivity ids in `y_test.txt`/`y_train.txt` to the measurement data int `X_test.txt`/`X_train.txt`.
* assigns a subject id to each measurement from `subject_test.txt`/`subject_train.txt`.

The result is stored in `tidy_data.csv`. Another dataset with the average for
each variable for each activity and each subject is stored in `mean_data.csv`.
