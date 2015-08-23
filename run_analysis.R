## Getting the generic data
## The activities table
## The features table

activity <- read.table("activity_labels.txt", col.names = c("act_id","act_name"))
actv <- tbl_df(activity)

features <- read.table("features.txt", col.names = c("f_id","f_name"))
feature <- tbl_df(features)

## Getting the Training dataset
## Read the training dataset
## Read the subject list for training data
## Read the activity list for training data
## Column bind all three data frames together

train_data <- read.table("./train/X_train.txt", col.names = features$f_name)

subject_train <- read.table("./train/subject_train.txt", col.names = "subjectid")

activities_train <- read.table("./train/y_train.txt", col.names = "act_id")

traindata <- bind_cols(subject_train,activities_train,train_data)
train <- tbl_df(traindata)

train <- mutate(train, status = "train")

## Getting the Test dataset
## Read the test dataset
## Read the subject list for test data
## Read the activity list for test data
## Column bind all three data frames together

test_data <- read.table("./test/X_test.txt", col.names = features$f_name)

subject_test <- read.table("./test/subject_test.txt", col.names = "subjectid")

activities_test <- read.table("./test/y_test.txt", col.names = "actid")

testdata <- bind_cols(subject_test,activities_test,test_data)
test <- tbl_df(testdata)

test <- mutate(test, status = "test") 

## Put the trainign and test dataset together in one data frames (data)
## Merge the combined data frame with the activity data frame to capture activity name

data <- bind_rows(train, test)
data <- merge(data, actv, all = TRUE)

## Create final result as required in step 4 of the project
## Select only the mean and std columns

finaldata <- data[,(grepl( c("subjectid") , names( data ) ) | grepl( c("act_name") , names( data ) ) | grepl( c("mean") , names( data ) ) | grepl( c("std") , names( data )) )]

## Summarize the results as needed in Step 5 of project
tidy_summary_data <- aggregate(finaldata[, 2:80], list(finaldata$subjectid, finaldata$act_name), mean)
tidy_summary_data <- tbl_df(tidy_summary_data)

## Rename filed names and write the data to a file
names(tidy_summary_data)[names(tidy_summary_data)=="Group.1"] <- "SubjectId"
names(tidy_summary_data)[names(tidy_summary_data)=="Group.2"] <- "ActivityName"

write.table(tidy_summary_data, file = "Project_tidy_data.txt", row.names = FALSE)



