Getting and Cleaning Data Course Project 
========================================================

### *This file includes descriptions of all steps taken in obtaining and cleaning the data set for the course project.  All related code is also included here, making redundant the 'run_analysis.R' file that was also required in the project description.  This file does NOT include code used to create the CodeBook.  Such code (as well as descriptions re. its function) are included both in 'CodeBook.md' and 'run_analysis.R'.  See "Associated files" immediately below for a map of how all files interrelate.*

### **Associated files:**
* **run_analysis.R** includes the same code included in this file along with the code used to construct the CodeBook.
* **tidyDataOriginalVarNames.txt** is one version of the 'second, independent tidy data set' described in item 5. of the project description.  It includes the original (syntactically invalid, in R) variable names.
* **tidyDataValidVarNames.txt** is a second version of the 'second, independent tidy data set' described in item 5. of the project description.  It includes syntactically valid (in R) variable names.
* **projectData.zip** is the file downloaded from here, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,   
as given in the project description.
* **features_info.txt** is included in **projectData.zip** and is the original study authors' description of the variables used.  Mention of variables not used in this project were deleted from it, and it was provided as an appendix to the CodeBook in order to help simplify variable description.
* **CodeBook.md** is the codebook describing the variables included in the tidy data set.




### Download the zip file and and explore the files included.

```r
library(utils)
# To download the data set, uncomment the following line.
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "projectData.zip")

downloadDate = date(); downloadDate   
```

```
## [1] "Tue Aug 12 10:34:12 2014"
```

```r
# original downloadDate = "Sun Aug 10 14:57:54 2014"

unzip("C://Users//Shaun//Desktop//Getting Data Course//code//project//projectData.zip", list = TRUE)
```

```
##                                                            Name   Length
## 1                           UCI HAR Dataset/activity_labels.txt       80
## 2                                  UCI HAR Dataset/features.txt    15785
## 3                             UCI HAR Dataset/features_info.txt     2809
## 4                                    UCI HAR Dataset/README.txt     4453
## 5                                         UCI HAR Dataset/test/        0
## 6                        UCI HAR Dataset/test/Inertial Signals/        0
## 7     UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt  6041350
## 8     UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt  6041350
## 9     UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt  6041350
## 10   UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt  6041350
## 11   UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt  6041350
## 12   UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt  6041350
## 13   UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt  6041350
## 14   UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt  6041350
## 15   UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt  6041350
## 16                        UCI HAR Dataset/test/subject_test.txt     7934
## 17                              UCI HAR Dataset/test/X_test.txt 26458166
## 18                              UCI HAR Dataset/test/y_test.txt     5894
## 19                                       UCI HAR Dataset/train/        0
## 20                      UCI HAR Dataset/train/Inertial Signals/        0
## 21  UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt 15071600
## 22  UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt 15071600
## 23  UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt 15071600
## 24 UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt 15071600
## 25 UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt 15071600
## 26 UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt 15071600
## 27 UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt 15071600
## 28 UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt 15071600
## 29 UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt 15071600
## 30                      UCI HAR Dataset/train/subject_train.txt    20152
## 31                            UCI HAR Dataset/train/X_train.txt 66006256
## 32                            UCI HAR Dataset/train/y_train.txt    14704
##                   Date
## 1  2012-10-10 15:55:00
## 2  2012-10-11 13:41:00
## 3  2012-10-15 15:44:00
## 4  2012-12-10 10:38:00
## 5  2012-11-29 17:01:00
## 6  2012-11-29 17:01:00
## 7  2012-11-29 15:08:00
## 8  2012-11-29 15:08:00
## 9  2012-11-29 15:08:00
## 10 2012-11-29 15:09:00
## 11 2012-11-29 15:09:00
## 12 2012-11-29 15:09:00
## 13 2012-11-29 15:08:00
## 14 2012-11-29 15:09:00
## 15 2012-11-29 15:09:00
## 16 2012-11-29 15:09:00
## 17 2012-11-29 15:25:00
## 18 2012-11-29 15:09:00
## 19 2012-11-29 17:01:00
## 20 2012-11-29 17:01:00
## 21 2012-11-29 15:08:00
## 22 2012-11-29 15:08:00
## 23 2012-11-29 15:08:00
## 24 2012-11-29 15:09:00
## 25 2012-11-29 15:09:00
## 26 2012-11-29 15:09:00
## 27 2012-11-29 15:08:00
## 28 2012-11-29 15:08:00
## 29 2012-11-29 15:08:00
## 30 2012-11-29 15:09:00
## 31 2012-11-29 15:25:00
## 32 2012-11-29 15:09:00
```

```r
readMeFile = readLines(unz("projectData.zip", "UCI HAR Dataset/README.txt"))
```

### Unzip and combine the 'Train' data, variable name and 'Subject' files.

```r
Xtrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/X_train.txt"))
Ytrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/y_train.txt"))
subjTrain = read.table(unz("projectData.zip", "UCI HAR Dataset/train/subject_train.txt"))

fieldNames = read.table(unz("projectData.zip", "UCI HAR Dataset/features.txt"))
fieldNames = fieldNames[ ,2]

colnames(Xtrain) = fieldNames
finalTrain1 = cbind(Ytrain, Xtrain)
finalTrain2 = cbind(subjTrain, finalTrain1)
```

### Unzip and combine the 'Test' data,  variable name and 'Subject' files.

```r
Xtest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/X_test.txt"))
Ytest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/y_test.txt"))
subjTest = read.table(unz("projectData.zip", "UCI HAR Dataset/test/subject_test.txt"))

colnames(Xtest) = fieldNames
finalTest1 = cbind(Ytest, Xtest)
finalTest2 = cbind(subjTest, finalTest1)
```

### Combine the 'Train' data, 'Test' data, 'Subject' field and 'Activity' field. 

```r
fullData = rbind(finalTrain2, finalTest2)
colnames(fullData)[1] = 'Subject'
colnames(fullData)[2] = 'Activ'
```

### Replace numeric factor levels with descriptive activity names.

```r
activityLabels = read.table(unz("projectData.zip", "UCI HAR Dataset/activity_labels.txt"))
fullData$Activity = NA
fullData$Activity = activityLabels[fullData$Activ, 2]
fullData = fullData[,-2]
```

### Get column indices of fields that include a 'mean' or a 'standard deviation' of a measurement.

```r
std_FieldIndices = grep('std', colnames(fullData), ignore.case = TRUE, value = FALSE)
mean_FieldIndices = grep('mean', colnames(fullData), ignore.case = TRUE, value = FALSE)
```

### Extract 'mean' and 'SD' columns and bind them to 'Subject' and 'Activity' fields.

```r
columnsToKeep = union(std_FieldIndices, mean_FieldIndices)    
fullDataSet = fullData[ ,columnsToKeep]
data = cbind(fullData[,c(1,563)], fullDataSet)
```

###  Aggregate observations by Subject x Activity and calculate the mean field     measurement for each group.  Save the 'second' tidy data set.

```r
dataSet2 = suppressWarnings(aggregate(data, list(Subject = data$Subject, Activity = data$Activity), mean))
finalSecondDataSet = dataSet2[ ,-c(3:4)]

# To save a data set with variables as named originally
#write.table(finalSecondDataSet, file = "tidyDataOriginalVarNames.txt", row.names = FALSE)

# To save a data set with R-defined, syntactically valid variable names.
#dataSetValidVarNames = make.names(finalSecondDataSet)
#write.table(finalSecondDataSet, file = "tidyDataValidVarNames.txt", row.names = FALSE)
```


