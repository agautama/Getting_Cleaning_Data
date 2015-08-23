---
Title: "CodeBook"
Author: "AG"
Date: "August 23, 2015"
Output: html_document
---
# Code Book 
## Course: Getting and Cleaning Data
## Assignment:  Course Project
## Assumptions:
### 1. The working directory is set to "UCI HAR Dataset".
### 2. The "UCI HAR Dataset" folder is obtained by extracting the data from the specified url from course
### 3. The folder structure of the "UCI HAR Dataset" has been kept intact

Steps followed:

1. Create data frames for the basic project:
    - Activity list:
      - Assigned to data frame actv
    - Feature list:
      - Assigned to data frame feature
    
2. Get the training dataset
    - Read the training data from X_train file and assign the column names from feature list in step 1:
      -Assigned to data frame train_data
    - Read the subject list from corresponding subject_train file:
      - Assigned to data frame subject_train 
    - Read the activity list fron the corresponsing y_train file:
      - Assigned to data frame activities_train
    - Row bind the three files together and assign a new variable "status"" value = "train"
      - call this data as train
      
    - Repeat the same steps for Test dataset
    - Assign a new variable "status" value = "test"
    - Call this data as test
    
3. Row bind the test and train dataset together
    - Name this dataset as "data"
    
4. Merge the data dataframe created in 3 with the Activity list data frame created in step 1
    - Named this as finaldata

This should complete step 4 for the assignment. The dataframe of the output of this step is called finaldata

5. Summarize the dataframe from above step and write it to tidy_summary_data
    - Write the output to text file Project_tidy_data.txt
    - This is the final output as desired in step 5 of the assignment
