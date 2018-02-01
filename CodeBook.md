This is the code book for the Peer-Graded programming assignment for Getting and Cleaning Data.

The algorithm contained in run_analysis.r presumes that the dataset found at url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded to a working directory, and unzipped.

# Extracted Data
###### features.txt
This text file contains the descriptive names of feature variables, and is matched to the x* data sets.

###### activities.txt
This text file contains the descriptive names of label values, and is matched to the y* data sets.

###### X_train.txt
This text file contains the feature training data.

###### X_test.txt
This text file contains the feature test data; the feature variables are identical to those of the X_train.txt data.

###### Y_train.txt
This text file contains the label training data; the labels are non-descriptive.

###### Y_test.txt
This text file contains the label test data; the labels are non-descriptive.

###### subject_train.txt
This text file contains the training subject identifier data.

###### subject_test.txt
This text file contains the test subject identifier data.

# Variables
The algorithm uses the following variables:

- `features` (the features.txt data set imported to data frame)
- `activities` (the activities.txt data set imported to data frame)
- `features_filt` (the features data frame filtered for features of interest)
- `x_train` (the X_train.txt data set imported to data frame and cross-filtered for features of interest)
- `x_test` (the X_train.txt data set imported to data frame and cross-filtered for features of interest)
- `x` (the `x_*` data sets unified with `features_filt` to include descriptive column names)
- `y_train` (the Y_train.txt data set imported to data frame)
- `y_test` (the Y_test.txt data set imported to data frame)
- `y` (the `y_*` data sets unified and merged with `activities` to include descriptive labels)
- `subjects_train` (the subject_train.txt data set imported to data frame)
- `subjects_test` (the subject_test.txt data set imported to data frame)
- `subjects` (the `subjects_*` data sets unified
- `tidy_data` (`subjects`, `y` and `x` data sets unified
- `tidy_data_summary` (feature means summarized by `activity` and `subject`)

# Transformations
`features` and `activities` are imported.  `features` is filtered to include only variables that describe the mean or standard deviation of a given measurement.

`x training` and `x test` data are imported; columns are filtered to include only the specified features, and the columns are renamed to reflect the descriptive features noted in the `features` data set.  The data set is combined into a single `x` data frame.

`y training` and `y test` data are imported and combined; numerical label identifiers are replaced with descriptive label identifiers.

`subjects` data are imported and combined.

A `tidy_data` data frame is created by binding the columns from `subjects`, `y` and `x`; this is the primary data set intended for future analysis.  A `tidy_data_summary` data frame that summarizes the mean of every feature (x) variable by subject and activity is created to facilitate exploratory data analysis.

All intermediary (non `tidy_data*`) variables are removed from the environment.


a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md
