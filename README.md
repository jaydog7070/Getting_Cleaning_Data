Getting_Cleaning_Data
=====================

This is a repository for the Winter Dec 2014 Getting and Cleaning Data Project

Jason W Stedl
I used version R version 3.1.2 (2014-10-32)
Platform: i386-w64-ming32/i386 (32-bit)
It is assumed that the data is in the UCI Har Dataset directory and the directory is within you working directory.

===================================================================================================================

The data is taken from the Human Activity Recognition Using Smartphones Dataset version 1.0

The experiments and there intial readings may be found  in the README.txt file associated with the  UCI HAR Dataset

My project includes the folowing files
=======================================
- 'README.md'
- 'CodeBook.md' : Description and origin of the original data mixe with the explaination of the final tidy data set
- 'run_analiysis.R'
- 'features_std_mean.txt' file of the features used in tidy data set

Notes on run_analiysis.R
============================
The primary goal of the assignment is to take the original data set and extract only the features related to mean and std.

The code first of all read the features.txt , X-test.txt , y_test.txt, and the subject_test.txt files into data.frames.

-The data.frame containing the features is then processed to remove - and () characters. 
-The features are then added to the data.frame containig the X-test data as column names of the data_frame.
-The data.frame containg the X-test data:test_data_set is converted to a data.table
-Next the features that contain only mean and std are extracted from the features data.frame to a vector   features_std_mean.
-Then using a select statment and the features_std_mean vector the columns from the features_std_mean are selected.
-The y_test data is converted to a factor and the factors are changed from the ints to the coresponding text values
-The y_test data id cbinded to the test_data_set
-The subject_test data is then cbound onto the test_data_set and the subject and activity columns of the test_data_set
are named
-Finnally the test_data_set is checked for completeness
-The final product is a data.table with 2974 rows and 81 columns named test_data_set 

-The whole process is replicated for the train data set and produces a data.table train_data_set with 7352 rows and 81 coumns
-The two data.tables are then rbound together into a final data.table total_data_set
-The total_data_set data table is then grouped by subject and then activity.
-The grouped by data is chained to a sumarize function where only the 79 features from features_std_mean are averaged
-The product of this group_by and summerization is placed into a data.table final_mean_data
-The final_mean_data is melted into a long data format for more readablity and this is the final data.table produced by the script.

-I then from the consol used the write.table(final_mean_data, file = "final_mean_data.txt", row.names = FALSE) comand


Final Comments
=================
I will also include the original 






