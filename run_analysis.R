##################################################################################
###                                                                            ### 
###  This file contains all code written for the current project. It includes  ###
###  code to collect the data, code to transform the data to the state         ###
###  described in the CodeBook, and code  to create the CodeBook.  In my       ###
###  opinion, this file is redundant and may be ignored. All code is also      ###
###  available in either in the 'README.md' or in the 'CodeBook.md' files.     ###
###  I include this file only to make sure to satisfy project requirements.    ### 
###                                                                            ###
##################################################################################

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
names = fieldNames
fieldNames = fieldNames[ ,2]
#fieldNames = make.names(fieldNames)

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

# To save a data set with variables as named originally
write.table(finalSecondDataSet, file = "tidyDataOriginalVarNames.txt", row.names = FALSE)

# To save a data set with R-defined, syntactically valid variable names.
validNames = make.names(colnames(finalSecondDataSet))
colnames(finalSecondDataSet) = validNames
write.table(finalSecondDataSet, file = "tidyDataValidVarNames.txt", row.names = FALSE)


## Create the CodeBook.
#
# Get variable names
varNames = read.csv("varNamesOriginal.csv")
varNames = as.matrix(varNames)

# Get summary statistics to include in codebook
CBdata = read.table("tidyDataOriginalVarNames.txt", header = TRUE)

sumry = summary(CBdata)
stats = sumry[c(1,6),]

# Compile codebook and appendix.
codebook <- list()
for (i in 1:88) {
  codebook[[i]] = as.data.frame(matrix(NA, 5, 1))
  rownames(codebook[[i]]) = c('Original Var. Name:  ','Description:','Data Type:','.','..')
} 

for (h in 1:88)   {
  colnames(codebook[[h]])[1] = make.names(varNames[h,1])
  codebook[[h]][1,1] = varNames[h,1]
  codebook[[h]][2,1] = 'See Appendix'
  codebook[[h]][3,1] = 'Numeric'
  codebook[[h]][4,1] = stats[1, h]
  codebook[[h]][5,1] = stats[2, h]
}
codebook[[1]][2,1] = 'Study participants'
codebook[[1]][3,1] = 'Factor'
codebook[[1]][4,1] = '30 levels:'
codebook[[1]][5,1] = '1, 2, 3, ... 30'

codebook[[2]][2,1] = 'Study activity performed'
codebook[[2]][3,1] = 'Factor'
codebook[[2]][4,1] = 'WALKING'
codebook[[2]][5,1] = 'WALKING_UPSTAIRS'
codebook[[2]][6,1] = 'WALKING_DOWNSTAIRS'
codebook[[2]][7,1] = 'SITTING'
codebook[[2]][8,1] = 'STANDING'
codebook[[2]][9,1] = 'LAYING'
rownames(codebook[[2]]) = c('Original Var. Name:  ','Description:','Data Type:','.','..','...','....','.....','......')

appendix = readLines("variable_descriptions.txt")
# 'variable_descriptions.txt' is a version of the original researchers' 'features_info.txt'
# that was modified to pertain only to the variables used in this project
