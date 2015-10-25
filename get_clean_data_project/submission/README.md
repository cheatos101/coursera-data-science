README

The run_analysis.R script is used to tidy up the data from Samsung located here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script follows the following process:
1. It reads and merge the training and the test sets to create one data set in a variable named "data"
2. It extracts the mean and standard deviation for each measurement and appends it to the "data" variable
3. It replaces the indexes used to identify activities with descriptive activity names in "data"
4. It labels the data set with descriptive variable names, replacing the numeric labels with descriptive activity names
5. From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject. To do so, the data is grouped by subject and activity and summarize with a "mean" function
6. It writes the final tidied up data in a file "script_output.txt"

Some details on specific operations can be found in the script itself