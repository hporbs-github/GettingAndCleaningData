
### The R code immediately below was used to create the CodeBook.  Following that code is the CodeBook itself, and following that is the code--also included in 'run_analysis.R'--used to convert the raw data into the form described in the CodeBook.  
### The CodeBook includes original variable names along with the syntactically (in R) variable names.  Note that the variables in this project are the MEAN measurements (across Subject x Activity combinations) of original-study measurements.  Lengthy decriptions of each original-study variable are not provided in the CodeBook itself.  Instead, interested readers can note the original variable names and consult the original researchers' documentation (provided as an appendix to the CodeBook below) for full technical descriptions.  Mention of variables not included in the current project have been deleted from that document.    


```r
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
  codebook[[h]][2,1] = "Mean of Subject x Activity measurements of the above-named variable"
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
```

CodeBook
========

```
## [[1]]
##                                  Subject
## Original Var. Name:              Subject
## Description:          Study participants
## Data Type:                        Factor
## .                             30 levels:
## ..                       1, 2, 3, ... 30
## 
## [[2]]
##                                       Activity
## Original Var. Name:                   Activity
## Description:          Study activity performed
## Data Type:                              Factor
## .                                      WALKING
## ..                            WALKING_UPSTAIRS
## ...                         WALKING_DOWNSTAIRS
## ....                                   SITTING
## .....                                 STANDING
## ......                                  LAYING
## 
## [[3]]
##                                                                          tBodyAcc.std...X
## Original Var. Name:                                                      tBodyAcc-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.996  
## ..                                                                       Max.   : 0.627  
## 
## [[4]]
##                                                                          tBodyAcc.std...Y
## Original Var. Name:                                                      tBodyAcc-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9902  
## ..                                                                      Max.   : 0.6169  
## 
## [[5]]
##                                                                          tBodyAcc.std...Z
## Original Var. Name:                                                      tBodyAcc-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.988  
## ..                                                                       Max.   : 0.609  
## 
## [[6]]
##                                                                       tGravityAcc.std...X
## Original Var. Name:                                                   tGravityAcc-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.997  
## ..                                                                       Max.   :-0.830  
## 
## [[7]]
##                                                                       tGravityAcc.std...Y
## Original Var. Name:                                                   tGravityAcc-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   :-0.644  
## 
## [[8]]
##                                                                       tGravityAcc.std...Z
## Original Var. Name:                                                   tGravityAcc-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.991  
## ..                                                                       Max.   :-0.610  
## 
## [[9]]
##                                                                      tBodyAccJerk.std...X
## Original Var. Name:                                                  tBodyAccJerk-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.544  
## 
## [[10]]
##                                                                      tBodyAccJerk.std...Y
## Original Var. Name:                                                  tBodyAccJerk-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.990  
## ..                                                                       Max.   : 0.355  
## 
## [[11]]
##                                                                      tBodyAccJerk.std...Z
## Original Var. Name:                                                  tBodyAccJerk-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.993  
## ..                                                                       Max.   : 0.031  
## 
## [[12]]
##                                                                         tBodyGyro.std...X
## Original Var. Name:                                                     tBodyGyro-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.268  
## 
## [[13]]
##                                                                         tBodyGyro.std...Y
## Original Var. Name:                                                     tBodyGyro-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.476  
## 
## [[14]]
##                                                                         tBodyGyro.std...Z
## Original Var. Name:                                                     tBodyGyro-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.986  
## ..                                                                       Max.   : 0.565  
## 
## [[15]]
##                                                                     tBodyGyroJerk.std...X
## Original Var. Name:                                                 tBodyGyroJerk-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.997  
## ..                                                                       Max.   : 0.179  
## 
## [[16]]
##                                                                     tBodyGyroJerk.std...Y
## Original Var. Name:                                                 tBodyGyroJerk-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.997  
## ..                                                                       Max.   : 0.296  
## 
## [[17]]
##                                                                     tBodyGyroJerk.std...Z
## Original Var. Name:                                                 tBodyGyroJerk-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.193  
## 
## [[18]]
##                                                                         tBodyAccMag.std..
## Original Var. Name:                                                     tBodyAccMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.428  
## 
## [[19]]
##                                                                      tGravityAccMag.std..
## Original Var. Name:                                                  tGravityAccMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.428  
## 
## [[20]]
##                                                                     tBodyAccJerkMag.std..
## Original Var. Name:                                                 tBodyAccJerkMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.451  
## 
## [[21]]
##                                                                        tBodyGyroMag.std..
## Original Var. Name:                                                    tBodyGyroMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.981  
## ..                                                                       Max.   : 0.300  
## 
## [[22]]
##                                                                    tBodyGyroJerkMag.std..
## Original Var. Name:                                                tBodyGyroJerkMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.998  
## ..                                                                       Max.   : 0.250  
## 
## [[23]]
##                                                                          fBodyAcc.std...X
## Original Var. Name:                                                      fBodyAcc-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.997  
## ..                                                                       Max.   : 0.658  
## 
## [[24]]
##                                                                          fBodyAcc.std...Y
## Original Var. Name:                                                      fBodyAcc-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9907  
## ..                                                                      Max.   : 0.5602  
## 
## [[25]]
##                                                                          fBodyAcc.std...Z
## Original Var. Name:                                                      fBodyAcc-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.687  
## 
## [[26]]
##                                                                      fBodyAccJerk.std...X
## Original Var. Name:                                                  fBodyAccJerk-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.477  
## 
## [[27]]
##                                                                      fBodyAccJerk.std...Y
## Original Var. Name:                                                  fBodyAccJerk-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.991  
## ..                                                                       Max.   : 0.350  
## 
## [[28]]
##                                                                      fBodyAccJerk.std...Z
## Original Var. Name:                                                  fBodyAccJerk-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9931  
## ..                                                                      Max.   :-0.0062  
## 
## [[29]]
##                                                                         fBodyGyro.std...X
## Original Var. Name:                                                     fBodyGyro-std()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.197  
## 
## [[30]]
##                                                                         fBodyGyro.std...Y
## Original Var. Name:                                                     fBodyGyro-std()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.646  
## 
## [[31]]
##                                                                         fBodyGyro.std...Z
## Original Var. Name:                                                     fBodyGyro-std()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.522  
## 
## [[32]]
##                                                                         fBodyAccMag.std..
## Original Var. Name:                                                     fBodyAccMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.988  
## ..                                                                       Max.   : 0.179  
## 
## [[33]]
##                                                                 fBodyBodyAccJerkMag.std..
## Original Var. Name:                                             fBodyBodyAccJerkMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.316  
## 
## [[34]]
##                                                                    fBodyBodyGyroMag.std..
## Original Var. Name:                                                fBodyBodyGyroMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.982  
## ..                                                                       Max.   : 0.237  
## 
## [[35]]
##                                                                fBodyBodyGyroJerkMag.std..
## Original Var. Name:                                            fBodyBodyGyroJerkMag-std()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.998  
## ..                                                                       Max.   : 0.288  
## 
## [[36]]
##                                                                         tBodyAcc.mean...X
## Original Var. Name:                                                     tBodyAcc-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                         Min.   :0.222  
## ..                                                                        Max.   :0.301  
## 
## [[37]]
##                                                                         tBodyAcc.mean...Y
## Original Var. Name:                                                     tBodyAcc-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.04051  
## ..                                                                     Max.   :-0.00131  
## 
## [[38]]
##                                                                         tBodyAcc.mean...Z
## Original Var. Name:                                                     tBodyAcc-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.1525  
## ..                                                                      Max.   :-0.0754  
## 
## [[39]]
##                                                                      tGravityAcc.mean...X
## Original Var. Name:                                                  tGravityAcc-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.680  
## ..                                                                       Max.   : 0.975  
## 
## [[40]]
##                                                                      tGravityAcc.mean...Y
## Original Var. Name:                                                  tGravityAcc-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.4799  
## ..                                                                      Max.   : 0.9566  
## 
## [[41]]
##                                                                      tGravityAcc.mean...Z
## Original Var. Name:                                                  tGravityAcc-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.4951  
## ..                                                                      Max.   : 0.9579  
## 
## [[42]]
##                                                                     tBodyAccJerk.mean...X
## Original Var. Name:                                                 tBodyAccJerk-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :0.0427  
## ..                                                                       Max.   :0.1302  
## 
## [[43]]
##                                                                     tBodyAccJerk.mean...Y
## Original Var. Name:                                                 tBodyAccJerk-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.03869  
## ..                                                                     Max.   : 0.05682  
## 
## [[44]]
##                                                                     tBodyAccJerk.mean...Z
## Original Var. Name:                                                 tBodyAccJerk-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.06746  
## ..                                                                     Max.   : 0.03805  
## 
## [[45]]
##                                                                        tBodyGyro.mean...X
## Original Var. Name:                                                    tBodyGyro-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.2058  
## ..                                                                      Max.   : 0.1927  
## 
## [[46]]
##                                                                        tBodyGyro.mean...Y
## Original Var. Name:                                                    tBodyGyro-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.2042  
## ..                                                                      Max.   : 0.0275  
## 
## [[47]]
##                                                                        tBodyGyro.mean...Z
## Original Var. Name:                                                    tBodyGyro-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.0724  
## ..                                                                      Max.   : 0.1791  
## 
## [[48]]
##                                                                    tBodyGyroJerk.mean...X
## Original Var. Name:                                                tBodyGyroJerk-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.1572  
## ..                                                                      Max.   :-0.0221  
## 
## [[49]]
##                                                                    tBodyGyroJerk.mean...Y
## Original Var. Name:                                                tBodyGyroJerk-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.0768  
## ..                                                                      Max.   :-0.0132  
## 
## [[50]]
##                                                                    tBodyGyroJerk.mean...Z
## Original Var. Name:                                                tBodyGyroJerk-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.09250  
## ..                                                                     Max.   :-0.00694  
## 
## [[51]]
##                                                                        tBodyAccMag.mean..
## Original Var. Name:                                                    tBodyAccMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9865  
## ..                                                                      Max.   : 0.6446  
## 
## [[52]]
##                                                                     tGravityAccMag.mean..
## Original Var. Name:                                                 tGravityAccMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9865  
## ..                                                                      Max.   : 0.6446  
## 
## [[53]]
##                                                                    tBodyAccJerkMag.mean..
## Original Var. Name:                                                tBodyAccJerkMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.993  
## ..                                                                       Max.   : 0.434  
## 
## [[54]]
##                                                                       tBodyGyroMag.mean..
## Original Var. Name:                                                   tBodyGyroMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.981  
## ..                                                                       Max.   : 0.418  
## 
## [[55]]
##                                                                   tBodyGyroJerkMag.mean..
## Original Var. Name:                                               tBodyGyroJerkMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9973  
## ..                                                                      Max.   : 0.0876  
## 
## [[56]]
##                                                                         fBodyAcc.mean...X
## Original Var. Name:                                                     fBodyAcc-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.537  
## 
## [[57]]
##                                                                         fBodyAcc.mean...Y
## Original Var. Name:                                                     fBodyAcc-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.9890  
## ..                                                                      Max.   : 0.5242  
## 
## [[58]]
##                                                                         fBodyAcc.mean...Z
## Original Var. Name:                                                     fBodyAcc-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.990  
## ..                                                                       Max.   : 0.281  
## 
## [[59]]
##                                                                     fBodyAcc.meanFreq...X
## Original Var. Name:                                                 fBodyAcc-meanFreq()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.636  
## ..                                                                       Max.   : 0.159  
## 
## [[60]]
##                                                                     fBodyAcc.meanFreq...Y
## Original Var. Name:                                                 fBodyAcc-meanFreq()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.3795  
## ..                                                                      Max.   : 0.4665  
## 
## [[61]]
##                                                                     fBodyAcc.meanFreq...Z
## Original Var. Name:                                                 fBodyAcc-meanFreq()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.5201  
## ..                                                                      Max.   : 0.4025  
## 
## [[62]]
##                                                                     fBodyAccJerk.mean...X
## Original Var. Name:                                                 fBodyAccJerk-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.995  
## ..                                                                       Max.   : 0.474  
## 
## [[63]]
##                                                                     fBodyAccJerk.mean...Y
## Original Var. Name:                                                 fBodyAccJerk-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.989  
## ..                                                                       Max.   : 0.277  
## 
## [[64]]
##                                                                     fBodyAccJerk.mean...Z
## Original Var. Name:                                                 fBodyAccJerk-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.992  
## ..                                                                       Max.   : 0.158  
## 
## [[65]]
##                                                                 fBodyAccJerk.meanFreq...X
## Original Var. Name:                                             fBodyAccJerk-meanFreq()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.5760  
## ..                                                                      Max.   : 0.3314  
## 
## [[66]]
##                                                                 fBodyAccJerk.meanFreq...Y
## Original Var. Name:                                             fBodyAccJerk-meanFreq()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.6020  
## ..                                                                      Max.   : 0.1957  
## 
## [[67]]
##                                                                 fBodyAccJerk.meanFreq...Z
## Original Var. Name:                                             fBodyAccJerk-meanFreq()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.6276  
## ..                                                                      Max.   : 0.2301  
## 
## [[68]]
##                                                                        fBodyGyro.mean...X
## Original Var. Name:                                                    fBodyGyro-mean()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.993  
## ..                                                                       Max.   : 0.475  
## 
## [[69]]
##                                                                        fBodyGyro.mean...Y
## Original Var. Name:                                                    fBodyGyro-mean()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.329  
## 
## [[70]]
##                                                                        fBodyGyro.mean...Z
## Original Var. Name:                                                    fBodyGyro-mean()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.986  
## ..                                                                       Max.   : 0.492  
## 
## [[71]]
##                                                                    fBodyGyro.meanFreq...X
## Original Var. Name:                                                fBodyGyro-meanFreq()-X
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.3958  
## ..                                                                      Max.   : 0.2492  
## 
## [[72]]
##                                                                    fBodyGyro.meanFreq...Y
## Original Var. Name:                                                fBodyGyro-meanFreq()-Y
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.6668  
## ..                                                                      Max.   : 0.2731  
## 
## [[73]]
##                                                                    fBodyGyro.meanFreq...Z
## Original Var. Name:                                                fBodyGyro-meanFreq()-Z
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.5075  
## ..                                                                      Max.   : 0.3771  
## 
## [[74]]
##                                                                        fBodyAccMag.mean..
## Original Var. Name:                                                    fBodyAccMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.587  
## 
## [[75]]
##                                                                    fBodyAccMag.meanFreq..
## Original Var. Name:                                                fBodyAccMag-meanFreq()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.3123  
## ..                                                                      Max.   : 0.4358  
## 
## [[76]]
##                                                                fBodyBodyAccJerkMag.mean..
## Original Var. Name:                                            fBodyBodyAccJerkMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.994  
## ..                                                                       Max.   : 0.538  
## 
## [[77]]
##                                                            fBodyBodyAccJerkMag.meanFreq..
## Original Var. Name:                                        fBodyBodyAccJerkMag-meanFreq()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.1252  
## ..                                                                      Max.   : 0.4881  
## 
## [[78]]
##                                                                   fBodyBodyGyroMag.mean..
## Original Var. Name:                                               fBodyBodyGyroMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.987  
## ..                                                                       Max.   : 0.204  
## 
## [[79]]
##                                                               fBodyBodyGyroMag.meanFreq..
## Original Var. Name:                                           fBodyBodyGyroMag-meanFreq()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.4566  
## ..                                                                      Max.   : 0.4095  
## 
## [[80]]
##                                                               fBodyBodyGyroJerkMag.mean..
## Original Var. Name:                                           fBodyBodyGyroJerkMag-mean()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.998  
## ..                                                                       Max.   : 0.147  
## 
## [[81]]
##                                                           fBodyBodyGyroJerkMag.meanFreq..
## Original Var. Name:                                       fBodyBodyGyroJerkMag-meanFreq()
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.1829  
## ..                                                                      Max.   : 0.4263  
## 
## [[82]]
##                                                               angle.tBodyAccMean.gravity.
## Original Var. Name:                                           angle(tBodyAccMean,gravity)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.16304  
## ..                                                                     Max.   : 0.12915  
## 
## [[83]]
##                                                      angle.tBodyAccJerkMean..gravityMean.
## Original Var. Name:                                  angle(tBodyAccJerkMean),gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                      Min.   :-0.12055  
## ..                                                                     Max.   : 0.20326  
## 
## [[84]]
##                                                          angle.tBodyGyroMean.gravityMean.
## Original Var. Name:                                      angle(tBodyGyroMean,gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.3893  
## ..                                                                      Max.   : 0.4441  
## 
## [[85]]
##                                                      angle.tBodyGyroJerkMean.gravityMean.
## Original Var. Name:                                  angle(tBodyGyroJerkMean,gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.2237  
## ..                                                                      Max.   : 0.1824  
## 
## [[86]]
##                                                                      angle.X.gravityMean.
## Original Var. Name:                                                  angle(X,gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                        Min.   :-0.947  
## ..                                                                       Max.   : 0.738  
## 
## [[87]]
##                                                                      angle.Y.gravityMean.
## Original Var. Name:                                                  angle(Y,gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.8746  
## ..                                                                      Max.   : 0.4248  
## 
## [[88]]
##                                                                      angle.Z.gravityMean.
## Original Var. Name:                                                  angle(Z,gravityMean)
## Description:          Mean of Subject x Activity measurements of the above-named variable
## Data Type:                                                                        Numeric
## .                                                                       Min.   :-0.8736  
## ..                                                                      Max.   : 0.3904
```
Appendix
========

```
##  [1] "APPENDIX"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
##  [2] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
##  [3] "Variable Descriptions "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
##  [4] "====================="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
##  [5] "(The below is quoted directly from 'features_info.txt' in the zipped file described in 'README.md', with the exception that references to variables not included in the present project were deleted.)  "                                                                                                                                                                                                                                                                                                                                                                                    
##  [6] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
##  [7] "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. "
##  [8] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
##  [9] "Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). "                                                                                                                                                                                                                                                       
## [10] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [11] "Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). "                                                                                                                                                                                                                                                                                                                                                 
## [12] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [13] "These signals were used to estimate variables of the feature vector for each pattern:  "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## [14] "'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## [15] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [16] "tBodyAcc-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [17] "tGravityAcc-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## [18] "tBodyAccJerk-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [19] "tBodyGyro-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## [20] "tBodyGyroJerk-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## [21] "tBodyAccMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## [22] "tGravityAccMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## [23] "tBodyAccJerkMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## [24] "tBodyGyroMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [25] "tBodyGyroJerkMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [26] "fBodyAcc-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [27] "fBodyAccJerk-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [28] "fBodyGyro-XYZ"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## [29] "fBodyAccMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## [30] "fBodyAccJerkMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## [31] "fBodyGyroMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [32] "fBodyGyroJerkMag"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [33] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [34] "The set of variables that were estimated from these signals are: "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## [35] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [36] "mean(): Mean value"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## [37] "std(): Standard deviation"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## [38] "meanFreq(): Weighted average of the frequency components to obtain a mean frequency"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## [39] "angle(): Angle between to vectors."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## [40] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [41] "Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## [42] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [43] "gravityMean"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## [44] "tBodyAccMean"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [45] "tBodyAccJerkMean"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## [46] "tBodyGyroMean"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## [47] "tBodyGyroJerkMean"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## [48] ""
```

### Code used to transform data from it's raw to it's CodeBook state

```r
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
dataSetValidVarNames = make.names(finalSecondDataSet)
write.table(finalSecondDataSet, file = "tidyDataValidVarNames.txt", row.names = FALSE)
```
