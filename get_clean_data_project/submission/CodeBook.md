

## Project Description
This project is about tidying data from a given set of Accelerometry data

##Study design and data processing
###Collection of the raw data
All source data was acquired from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Creating the tidy datafile

###Guide to create the tidy data file
Download the source data from the link above and unzip it. Run run_analysis.R in the same directory as the root of the data.

###Cleaning of the data
To clean the data, all test and training data (from "subject" and "y" files) is merged. Then, the mean and std measurements (from the "X" file) are added to the dataset. The from the "y" file are replaced with descriptive activity names. The data set columns are labelled. The data is grouped by subject and activity and the means of all other columns are kept as summarized data. The data set is finally written to script_output.txt

##Description of the variables in the script_output.txt file

The final tidy data contains 180 rows (one for each of the 30 participants and 6 activities), and 81 variables. The variables are as follow :

[1] "subject"                             "descriptive_act_name"
[3] "1 tBodyAcc-mean()-X"                 "2 tBodyAcc-mean()-Y"
[5] "3 tBodyAcc-mean()-Z"                 "41 tGravityAcc-mean()-X"
[7] "42 tGravityAcc-mean()-Y"             "43 tGravityAcc-mean()-Z"
[9] "81 tBodyAccJerk-mean()-X"            "82 tBodyAccJerk-mean()-Y"
[11] "83 tBodyAccJerk-mean()-Z"            "121 tBodyGyro-mean()-X"
[13] "122 tBodyGyro-mean()-Y"              "123 tBodyGyro-mean()-Z"
[15] "161 tBodyGyroJerk-mean()-X"          "162 tBodyGyroJerk-mean()-Y"
[17] "163 tBodyGyroJerk-mean()-Z"          "201 tBodyAccMag-mean()"
[19] "214 tGravityAccMag-mean()"           "227 tBodyAccJerkMag-mean()"
[21] "240 tBodyGyroMag-mean()"             "253 tBodyGyroJerkMag-mean()"
[23] "266 fBodyAcc-mean()-X"               "267 fBodyAcc-mean()-Y"
[25] "268 fBodyAcc-mean()-Z"               "294 fBodyAcc-meanFreq()-X"
[27] "295 fBodyAcc-meanFreq()-Y"           "296 fBodyAcc-meanFreq()-Z"
[29] "345 fBodyAccJerk-mean()-X"           "346 fBodyAccJerk-mean()-Y"
[31] "347 fBodyAccJerk-mean()-Z"           "373 fBodyAccJerk-meanFreq()-X"
[33] "374 fBodyAccJerk-meanFreq()-Y"       "375 fBodyAccJerk-meanFreq()-Z"
[35] "424 fBodyGyro-mean()-X"              "425 fBodyGyro-mean()-Y"
[37] "426 fBodyGyro-mean()-Z"              "452 fBodyGyro-meanFreq()-X"
[39] "453 fBodyGyro-meanFreq()-Y"          "454 fBodyGyro-meanFreq()-Z"
[41] "503 fBodyAccMag-mean()"              "513 fBodyAccMag-meanFreq()"
[43] "516 fBodyBodyAccJerkMag-mean()"      "526 fBodyBodyAccJerkMag-meanFreq
[45] "529 fBodyBodyGyroMag-mean()"         "539 fBodyBodyGyroMag-meanFreq()"
[47] "542 fBodyBodyGyroJerkMag-mean()"     "552 fBodyBodyGyroJerkMag-meanFreq()"
[49] "4 tBodyAcc-std()-X"                  "5 tBodyAcc-std()-Y"
[51] "6 tBodyAcc-std()-Z"                  "44 tGravityAcc-std()-X"
[53] "45 tGravityAcc-std()-Y"              "46 tGravityAcc-std()-Z"
[55] "84 tBodyAccJerk-std()-X"             "85 tBodyAccJerk-std()-Y"
[57] "86 tBodyAccJerk-std()-Z"             "124 tBodyGyro-std()-X"
[59] "125 tBodyGyro-std()-Y"               "126 tBodyGyro-std()-Z"
[61] "164 tBodyGyroJerk-std()-X"           "165 tBodyGyroJerk-std()-Y"
[63] "166 tBodyGyroJerk-std()-Z"           "202 tBodyAccMag-std()"
[65] "215 tGravityAccMag-std()"            "228 tBodyAccJerkMag-std()"
[67] "241 tBodyGyroMag-std()"              "254 tBodyGyroJerkMag-std()"
[69] "269 fBodyAcc-std()-X"                "270 fBodyAcc-std()-Y"
[71] "271 fBodyAcc-std()-Z"                "348 fBodyAccJerk-std()-X"
[73] "349 fBodyAccJerk-std()-Y"            "350 fBodyAccJerk-std()-Z"
[75] "427 fBodyGyro-std()-X"               "428 fBodyGyro-std()-Y"
[77] "429 fBodyGyro-std()-Z"               "504 fBodyAccMag-std()"
[79] "517 fBodyBodyAccJerkMag-std()"       "530 fBodyBodyGyroMag-std()"
[81] "543 fBodyBodyGyroJerkMag-std()"

The variable "subject" is an identifier of the subject ID for the experiment. The "descriptive_act_name"
is a string identifying what activity is summarized on this row. The remaining variables are the various
means and std calculated from the raw data.

Codebook template from: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41