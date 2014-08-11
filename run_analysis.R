
## Download the zip file and and explore the files included.
#
library(utils)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "projectData.zip")
downloadDate = date(); downloadDate   # "Sun Aug 10 14:57:54 2014"
unzip("C://Users//Shaun//Desktop//Getting Data Course//code//project//projectData.zip", list = TRUE)
readMeFile = readLines(unz("projectData.zip", "UCI HAR Dataset/README.txt"))

## Unzip and combine the 'Train' data, variable name and 'Subject' files.
#
Xtrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/X_train.txt"))
Ytrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/y_train.txt"))
subjTrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/subject_train.txt"))

fieldNames = read.table(unz("projectData.zip", "UCI HAR Dataset/features.txt"))
fieldNames = fieldNames[ ,2]

colnames(Xtrain) = fieldNames
finalTrain1 = cbind(Ytrain, Xtrain)
finalTrain2 = cbind(subjTrain, finalTrain1)

## Unzip and combine the 'Test' data,  variable name and 'Subject' files.
#
Xtest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/X_test.txt"))
Ytest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/y_test.txt"))
subjTest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/subject_test.txt"))

colnames(Xtest) = fieldNames
finalTest1 = cbind(Ytest, Xtest)
finalTest2 = cbind(subjTest, finalTest1)

## Combine the 'Train' data, 'Test' data, 'Subject' field and 'Activity' field. 
#
fullData = rbind(finalTrain2, finalTest2)
colnames(fullData)[1] = 'Subject'
colnames(fullData)[2] = 'Activ'

## Replace numeric factor levels with descriptive activity names.
#
activityLabels = read.table(unz("projectData.zip", "UCI HAR Dataset/activity_labels.txt"))
fullData$Activity = NA
fullData$Activity = activityLabels[fullData$Activ, 2]
fullData = fullData[,-2]

## Get column indices of fields that include a 'mean' or 'standard deviation' of a measurement.
#
std_FieldIndices = grep('std', colnames(fullData), ignore.case = TRUE, value = FALSE)
mean_FieldIndices = grep('mean', colnames(fullData), ignore.case = TRUE, value = FALSE)

## Extract 'mean' and 'SD' columns and bind them to 'Subject' and 'Activity' fields.
columnsToKeep = union(std_FieldIndices, mean_FieldIndices)    # plus 'Activity' & 'Subject'
fullDataSet = fullData[ ,columnsToKeep]
data = cbind(fullData[,c(1,563)], fullDataSet)

##  Aggregate observations by Subject x Activity and calculate the mean field measurement for each.
#
dataSet2 = aggregate(data, list(Subject = data$Subject, Activity = data$Activity), mean)
finalSecondDataSet = dataSet2[ ,-c(3:4)]
write.table(finalSecondDataSet, file = "tidyData.txt")

