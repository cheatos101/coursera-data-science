# Load libraries
library(data.table)
library(dplyr)

#1. Read all the required data and merge test and train data
fn = 'subject'
tmp1 <- read.table(paste('test/',fn,'_','test.txt',sep = ''),header=FALSE)
tmp2 <- read.table(paste('train/',fn,'_','train.txt',sep = ''),header=FALSE)
tmp_data = rbind(tmp1,tmp2) # Combine test and train datasets
data <- data.frame(tmp_data)
fn = 'y'
tmp1 <- read.table(paste('test/',fn,'_','test.txt',sep = ''),header=FALSE)
tmp2 <- read.table(paste('train/',fn,'_','train.txt',sep = ''),header=FALSE)
tmp_data = rbind(tmp1,tmp2) # Combine test and train datasets
data <- cbind(data,tmp_data) # Append to data data.frame
fn = 'X'
tmp1 <- read.table(paste('test/',fn,'_','test.txt',sep = ''),header=FALSE)
tmp2 <- read.table(paste('train/',fn,'_','train.txt',sep = ''),header=FALSE)
X <- rbind(tmp1,tmp2) # Combine test and train datasets

#2. extract measurements for mean and std
features=read.csv('features.txt',header=FALSE,sep='\n')
mean_lines = grepl('mean',features$V1) # Get lines containing mean
std_lines = grepl('std',features$V1) # Get lines containing std

# For all mean and std features found, add name to a list of future
# columns that will be used and append column to data data.frame
column_names = c('subject','y')
for (ind in 1:length(mean_lines)){
  if (mean_lines[ind]){
    column_id = paste('V',ind,sep='')
    column_names = c(column_names,as.character(features[ind,1]))
    data=cbind(data,X[[column_id]])
  }
}
for (ind in 1:length(std_lines)){
  if (std_lines[ind]){
    column_id = paste('V',ind,sep='')
    column_names = c(column_names,as.character(features[ind,1]))
    data=cbind(data,X[[column_id]])
  }
}

#3. Add descritpive activity names
colnames(data) <- c(column_names)
tmp <- data$y
tmp[tmp=='1'] <- 'WALKING'
tmp[tmp=='2'] <- 'WALKING_UPSTAIRS'
tmp[tmp=='3'] <- 'WALKING_DOWNSTAIRS'
tmp[tmp=='4'] <- 'SITTING'
tmp[tmp=='5'] <- 'STANDING'
tmp[tmp=='6'] <- 'LAYING'

column_names <- c(column_names,'descriptive_act_name')
data<- cbind(data,tmp)

#4. Label data with correct variable names
colnames(data) <- column_names
data <- data[,!names(data) %in% 'y'] # Drop y column now that it isn't needed anymore

#5. independent tidy data set with the average of each variable for each activity and each subject.
data = data %>% group_by(subject,descriptive_act_name) %>% summarise_each(funs(mean))

# Write output
write.table(data,'script_output.txt',row.names = FALSE)

