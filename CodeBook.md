##This is the Codebook for run_analysis.R

###test_X  reads and stores raw data from X_test.txt file
###test_Y  reads and stores raw data from Y_test.txt file
###test_Sub  reads and stores raw data from subject_test.txt file
###train_X  reads and stores raw data from X_train.txt file
###train_Y  reads and stores raw data from Y_train.txt file
###train_Sub  reads and stores raw data from subject_train.txt file
###activity_Labels reads and stores raw data from activity_labels.txt file
###test_Y$V1 stores activity labels for the training data
###train_Y$V1 stores activity labels for the test data
###features_Selection reads and stores raw data from features.txt file
###merged_Test stores combined data from all test files
###merged_Train stores combined data from all training files
###merged_AllData stores combined data from all test and training files
###mean_AllData stores mean of each data measurements
###stdev_AllData stores standard deviation of each data measurements
###tidy_Data stores all test and training data with the appropriate label applied
###tidy_data.txt holds the data in tidy_data variable created by write.table() function

