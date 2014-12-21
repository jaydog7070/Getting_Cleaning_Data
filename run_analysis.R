clean_vector <- function(vec_to_clean)
{
  vec_to_clean <- sub("\\()", "" , vec_to_clean)
  vec_to_clean <- gsub("-", "" , vec_to_clean)
  vec_to_clean <- tolower(vec_to_clean)
  
  vec_to_clean
}



###   Jason W Stedl Dec 2014  
###   Code to produce a clean data set
###   sessionInfo() 
###   R version 3.1.2 (2014-10-31) 
###   Platform: i386-w64-mingw32/i386 (32-bit)
###   It is assumed the data is in the UCI Har Dataset directory and that Directory is within you Working Directory


##   First I will Read in the test data and the features 

## List of all the features
features  <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors =  FALSE)

##The x data for the cell phones 
test_data_set <-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")

## Data of the 30 subjects
subject_test_data <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

## Data on the 6 differnt activities
activity_test_data <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt" ,  colClasses = "factor")

## First I will get the feature to contaian only features with std and mean in their name
features_std_mean  <- grep("mean|std", features[,2], value = TRUE)

## remove () and - from feature names
features_std_mean <- clean_vector(features_std_mean)


##remove () and - from data.tables column names
features[,2] <-    clean_vector( features[,2])

##apply column names to total test x  data.frame
colnames(test_data_set) <- features[,2]

###converttest_data_set to a data.table
test_data_set <- data.table(test_data_set)


#now I will select only the colums with std and mean in their names
test_data_set <-  select(test_data_set, one_of(features_std_mean))

## Change levels from numbers to activity
levels(activity_test_data[,1]) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

##now cbind  activity to test_data_set
test_data_set <- cbind(activity_test_data[,1], test_data_set)

##now cbind subjects to data.table
test_data_set <- cbind(subject_test_data[,1], test_data_set)

## now set the names for subject and activity columns
setnames(test_data_set, 1:2, c("subject", "activity"))

## now check if the test_set is complete
if (all(colSums(is.na(test_data_set)) != 0 ))
{
    print("You have some na data in the test data set")
}


##The x data for the cell phones for train 
train_data_set <-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")

## Data of the 30 subjects
subject_train_data <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

## Data on the 6 differnt activities
activity_train_data <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt" ,  colClasses = "factor")

##apply column names to total train x  data.frame
colnames(train_data_set) <- features[,2]
train_data_set <- data.table(train_data_set)

#now I will select only the colums with std and mean in their names
train_data_set <-  select(train_data_set, one_of(features_std_mean))


## Change levels from numbers to activity
levels(activity_train_data[,1]) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

##now cbind  activity to test_data_set
train_data_set <- cbind(activity_train_data[,1], train_data_set)

##now cbind subjects to data.table
train_data_set <- cbind(subject_train_data[,1], train_data_set)

## now set the names for subject and activity columns
setnames(train_data_set, 1:2, c("subject", "activity"))

## now check if the test_set is complete
if (all(colSums(is.na(train_data_set)) != 0 ))
{
  print("You have some na data in the train data set")
}

total_data_set <- rbind(test_data_set, train_data_set)

## now group by subject and activity and get the grouped by mean
by_subject_activity <- total_data_set %>% group_by(subject,activity)
final_mean_data <-  by_subject_activity %>% summarise_each(funs(mean), -subject, -activity)


## The final tidy data set produced in long form
final_mean_data <- melt(final_mean_data, id = c("subject", "activity"), measure.vars = features_std_mean, value.name = "Mean")


