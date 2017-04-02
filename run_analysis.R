#This function requires loading the dplyr and data.table packages
#This function takes as input the home directory location where the datasets
#(both source and output) will be stored
#The function merges the training and test datasets, extracts the mean and
#and standard deviation for each measurement and writes to a file a tidy dataset
#that includes the average of each variable for each activity and subject
run_analysis<-function(homedir=getwd()) {
      
      #Download the source dataset and unzip to the working directory
      fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      filename <- "week4project.zip"
      download.file(fileurl, destfile = filename)
      unzip(filename, exdir = homedir)
      
      
      #create a data table of the file names for each of the datasets that needs
      #to be read from the reference data
      datdir <- paste(homedir, "UCI HAR Dataset", sep = "/")
      lf <- data.table(list.files(datdir, recursive = TRUE))
      temp <- filter(lf, !grepl("^train/Inertial", lf$V1) == TRUE & 
                         !grepl("^test/Inertial", lf$V1) == TRUE & 
                         !grepl("^README", lf$V1) == TRUE & 
                         !grepl("^features_info", lf$V1) == TRUE)
      lf <- temp[[1]]
      
      
      #read file features.txt
      features <- fread(paste(datdir, lf[grep("features.txt", lf)], sep = "/"))
      colnames(features) <- c("featurelabel", "featurename")
      
      
      #create vectors of old and new columns for mean and std features
      features <- mutate(features, featurecolumnlabel = paste("V", featurelabel, sep = ""))
      i <- grep("mean\\(|std", features[[2]])
      oldnames = features[i,3]
      newnames = features[i,2]
      
      
      #read file activitylabels.txt
      activitylabels <- fread(paste(datdir, lf[grep("activity_labels", lf)], sep = "/"))
      colnames(activitylabels) <- c("activitylabel", "activityname")
      
      
      #read files X_test.txt, y_test.txt and subject_test.txt
      xtest <- fread(paste(datdir, lf[grep("X_test", lf)], sep = "/"))
      
      ytest <- fread(paste(datdir, lf[grep("y_test", lf)], sep = "/"))
      colnames(ytest) <- c("activitylabel")
      
      subjecttest <- fread(paste(datdir, lf[grep("subject_test", lf)], sep = "/"))
      colnames(subjecttest) <- c("subjectid")
      
      
      #read files X_train.txt, y_train.txt and subject_train.txt
      xtrain <- fread(paste(datdir, lf[grep("X_train", lf)], sep = "/"))
      
      ytrain <- fread(paste(datdir, lf[grep("y_train", lf)], sep = "/"))
      colnames(ytrain) <- c("activitylabel")
      
      subjecttrain <- fread(paste(datdir, lf[grep("subject_train", lf)], sep = "/"))
      colnames(subjecttrain) <- c("subjectid")
      
      
      #bind activity labels from y_test.txt and subject IDs from subject_test.txt
      #to X_test results
      xtest <- cbind(ytest[,1], xtest)
      xtest <- cbind(subjecttest[,1], xtest)
      
      
      #bind activity labels from y_train.txt and subject IDs from subject_train.txt
      #to X_train results
      xtrain <- cbind(ytrain[,1], xtrain)
      xtrain <- cbind(subjecttrain[,1], xtrain)
      
      #bind rows from X_test dataset and X_train dataset to form full dataset
      xfull <- rbind(xtest, xtrain)
      
      
      #set column names for mean and std features that will be extracted from
      #full dataset
      setnames(xfull, old = oldnames, new = newnames)

      
      #select desired feature columns and reassign xfull dataset to include only
      #these features
      xfull <- select(xfull, subjectid, activitylabel, grep("mean|std", names(xfull)))
      
      
      #merge activity_labels dataset with xfull dataset to get activity names
      #remove activity labels column from full dataset
      xfull <- merge(activitylabels, xfull, by = "activitylabel", all = TRUE)
      xfull <- select(xfull, -1)
      
      xfull$subjectid <- factor(xfull$subjectid)
      xfull$activityname <- factor(xfull$activityname)
      
      
      #create a character vector of the mean and std feature names
      #melt full dataset and reshape so that each feature is listed in a column 
      #and each row is one record of an individual feature value
      measurevars <- grep("mean|std", names(xfull), value = TRUE)
      xfullmelt <- melt(xfull, id = c("subjectid", "activityname"), 
                        measure.vars = measurevars, variable.name = "feature", 
                        value.name = "featurevalue")
      
      
      #set data table key
      setkey(xfullmelt, subjectid, activityname, feature)
      
      
      #Add new column of variable averages to dataset
      xfullmelt <- xfullmelt[, featureaverage:= mean(featurevalue), by=key(xfullmelt)]
      
      
      #Assign new tidy dataset to a data table and write to a csv or txt file
      tidydata <- xfullmelt
      
      #This command for csv file
      #write.table(tidydata, file = "humanactivityrecognition.csv", quote = FALSE, sep = ",", row.names = FALSE, qmethod = "double")
      
      #This command for txt file
      write.table(tidydata, file = "humanactivityrecognition.txt", row.names = FALSE)
}
