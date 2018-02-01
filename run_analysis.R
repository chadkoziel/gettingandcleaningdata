setwd(
     "C:/Users/chad.koziel/OneDrive/Documents/Coursera R/Getting and Cleaning Data/UCI HAR Dataset"
)

library(dplyr)

# read in feature & activity data sets
features <- read.table("features.txt", header = FALSE)
activities <-
     read.table("activity_labels.txt",
                header = FALSE,
                col.names = c("V1", "Activity"))

# filter for only necessary features and concatenate a 'V' in to facilitate column selection on x
features_filt <- filter(features, grepl('mean|std', V2))
features_filt$V1 <-
     paste("V", features_filt$V1, sep = "", collapse = NULL)

# read in desired features from x datasets, combine, add descriptive column names
x_train <-
     read.table("train/X_train.txt", header = FALSE)[features_filt$V1]
x_test <-
     read.table("test/X_test.txt", header = FALSE)[features_filt$V1]
x <- rbind(x_train, x_test)
colnames(x) <- features_filt$V2

# read in y datasets, combine, add descriptive activity labels, add descriptive column name
y_train <- read.table("train/Y_train.txt", header = FALSE)
y_test <- read.table("test/Y_test.txt", header = FALSE)
y <- rbind(y_train, y_test)
y <- merge(y, activities)[2]

# read in subject data sets, combine, add descriptive column name
subjects_train <-
     read.table("train/subject_train.txt",
                header = FALSE,
                col.names = c("Subject"))
subjects_test <-
     read.table("test/subject_test.txt",
                header = FALSE,
                col.names = c("Subject"))
subjects <- rbind(subjects_train, subjects_test)

# combine subject, y and x data sets into a tidy data set
tidy_data <- cbind(subjects, y, x)

# create tidy data set of means by subject and activity
tidy_data_summary <- group_by(tidy_data, Subject, Activity) %>%
     summarise_all(funs(mean))

# output tidy data sets
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
write.table(tidy_data_summary, file = "tidy_data_summary.txt", row.names = FALSE)

# remove intermediate data sets
rm(
     "features",
     "features_filt",
     "activities",
     "x_train",
     "x_test",
     "x",
     "y_train",
     "y_test",
     "y",
     "subjects_train",
     "subjects_test",
     "subjects"
)
