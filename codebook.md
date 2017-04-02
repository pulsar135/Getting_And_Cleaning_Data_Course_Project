# Codebook.md


* This codebook describes the tidydata dataset produced by running the run_analysis.R script on the Human Activity Recognition Using Smartphones Data Set source dataset
* Subject id, activity name, features, and feature values were extracted from the source dataset.  
* Only mean() and std() measurements were extracted.  
* Some other mean measurements (meanFreq(), gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean) 
were considered to be beyond the basic scope of this analysis and were therefore not extracted
* The extracted data is then reshaped so that each of the extracted features is listed in one column under a variable called feature and each row is a single record of each individual feature.  This was done to create a tidy dataset that better facilitated calculating the featureaverage variable listed below.


## For further information on the source data please see:
* Site where original data was obtained:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Dataset used for this project (particularly features_info.txt and README.txt for full descriptions of the features included in tidydata):
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## For further information on the run_analysis.R script please see:
* README.md file in this repository


## Variable Names/Description:
* subjectid        - ID of the subject who performed the activity                                    
	- values: 1 through 30
					
* activityname     - name of the activity that was performed                                         
	- values: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"
					
* feature          - one of 66 mean and standard deviation features extracted from the source data   
	- values: a list of all 66 features extracted from the source data is below

* featureaverage   - calculated average of each feature for each activity for each subject
	- Example from dataset:  
		+ Subject 1, activity: LAYING, Feature: tBodyAcc-mean()-X
		+ There are 50 readings of this feature for this activity for this subject.  
		+ The mean of all 50 readings is taken to get the featureaverage for this variable for this activity for this subject


## Structure of tidydata dataset:

<pre><code>
Classes ‘data.table’ and 'data.frame':	11880 obs. of  4 variables:
 $ subjectid     : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ activityname  : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ feature       : Factor w/ 66 levels "tBodyAcc-mean()-X",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ featureaverage: num  0.2216 -0.0405 -0.1132 -0.9281 -0.8368 ...
 - attr(*, ".internal.selfref")=<externalptr> 
 - attr(*, "sorted")= chr  "subjectid" "activityname" "feature"
 </code></pre>
 
 
## Summary of tidydata dataset:
<pre><code>
   subjectid                activityname               feature      featureaverage    
 1      : 396   LAYING            :1980   tBodyAcc-mean()-X:  180   Min.   :-0.99767  
 2      : 396   SITTING           :1980   tBodyAcc-mean()-Y:  180   1st Qu.:-0.96205  
 3      : 396   STANDING          :1980   tBodyAcc-mean()-Z:  180   Median :-0.46989  
 4      : 396   WALKING           :1980   tBodyAcc-std()-X :  180   Mean   :-0.48436  
 5      : 396   WALKING_DOWNSTAIRS:1980   tBodyAcc-std()-Y :  180   3rd Qu.:-0.07836  
 6      : 396   WALKING_UPSTAIRS  :1980   tBodyAcc-std()-Z :  180   Max.   : 0.97451  
 (Other):9504                             (Other)          :10800                                             
 </code></pre>
 
## Tidy dataset Output:
* Full output of the tidydata dataset produced from the run_analysis.R script can be found in this repository in the txt file called humanactivityrecognition.txt
* This file can be easily read back into the Rconsole using: 
	- read.table for txt file with settings: 
		+ header = TRUE
	- read.csv for csv file with default settings


## List of source features extracted from the reference dataset that make up the feature variable described in the variable list above:
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
