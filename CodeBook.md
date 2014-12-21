Getting_Cleaning_Data
=====================

This is a repository for the Winter Dec 2014 Getting and Cleaning Data Project

Jason Stedl Dec 2014

Original Data 
======================
The original data is descibed in "features_info.txt" and the the actual original features are in the "feature.txt" file.

I have included both of those files in my github repo. The original data is part of the UCI HAR dataset and is data take from 30 indivduals using their phones in 6 differnt way with 561 features or variables recorded. I have also included a file "readme_orignal.txt" which is the original explination of the files and data sets.


Ammended or transformed data.
==============================
We are to use only the features that include either std or mean within their composition. I have included a file of the 79 features included in my tidy data set that only pertain to the std or mean of a measurement. The file is features_std_mean.txt . 

Variable included in features_std_mean.txt
==========================================

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


t denoted time and f denotes frequency

std() and mean() and meanFreq() are included in the features or columns of data that where selected for the tidy data set. 

** for mor information on the original data set look at README_ORIGINAL.txt and features_info.txt


Tidy data set
=============

The final tidy data set is in the file final_mean_data.txt. Furthermore if the R script run_analysis.R is run in a directory just above the directory UCI HAR Dataset the data will in a data.table final_mean_data. This data table will be in a long melted format with no na's and consist of 4 columns subject, activity, variable and the mean of the variable. The mean of the variable will be the mean of a mean , mean of a std or a mean or a meanFreq. The activity is one of 6 activities(walking, walking_upstairs, walking_downstairs, sitting, standing, laying). The variable are one of 79 variables in features_std_mean.txt. The subjects are 1 of 30 or 1:30 subjects. The data set will be grouped_by the subject and then the activity and then gives the mean for each variable.

column naming conventions
========================
the original coloumns would have a name as such tBodyAcc-mean()-X
the r script trandsforms the column names to as such tbodyaccmeanx

The variable name should be interperted as to mean t/body/acc/mean/x   

**more on the naming conventions and backgroun of variable can be found in README_ORIGINAL.txt
