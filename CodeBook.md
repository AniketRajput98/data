# Data was transformed by following the given steps:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Description of variables used:
- subject_test, X_test, y_test are used for reading test data.
- subject_train, X_train, y_train are used for reading training data.
- features and activity_label contains features and activity information.
- subsetwithActivityname contain dataset with descriptive activity label.
