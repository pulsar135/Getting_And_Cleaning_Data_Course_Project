# README.md

## Files included in this repository:
* README.md                    - Summarizes files in repository and gives overview of run_analysis.R script
* project_instructions.md      - original instructions provided for this project
* codebook.md                  - describes tidy dataset that is created and output by run_analysis.R
* run_analysis.R               - R script that performs the assigned analysis on the provided source dataset
* week4project.zip             - Source dataset as downloaded by run_analysis.R
* humanactivityrecognition.csv - tidy dataset output by run_analysis.R script


## run_analysis.R script overview:
### Required R Packages:
* dplyr
* data.table

### Input:
* homedir - name of the directory where the analysis is to be stored. Default value is the current working directory.

### Summary of Script Actions:
1.  Download zipped dataset from provided link (see project_instructions.md) and unzip to directory provided by input
2.  Extract necessary data tables from the source data
3.  Bind test activity labels and subject IDs to test dataset. Repeat same for train dataset
3.  Bind the test and train datasets to create a single dataset
4.  Replace non-descriptive variable names with descriptive variable names for the variables of interest
5.  Remove undesired variables from full dataset
6.  Merge full dataset with activity labels dataset to get descriptive activity names
7.  Melt full dataset and reshape into tall (instead of wide) table format to create tidy dataset
8.  Add column to table that calculates the average of each variable for each activity for each subject
9.  Assign this dataset as a new tidy dataset
10. Write new tidy dataset to a csv file named humanactivityrecognition.csv# Getting_And_Cleaning_Data_Course_Project
