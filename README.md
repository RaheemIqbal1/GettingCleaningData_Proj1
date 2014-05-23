


 Introduction:
 =============
This R script �run_analysis.R� does the following using the Human Activity Recognition Using Smartphones Dataset [1].

The data was downloaded from the following link on 16-May-2014, at 5:20 Pm ET USA.

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

R language V3.1.0 was used for performing the analysis [2].

========
 Steps:
========
1. Read the following files from the local disk as data frames
	X_test, y_test, subject_test
	X_train, y_train, subject_tain
	activity_labels.txt, features.txt

   It is assumed that the UCI data files are already downloaded from the link provided above, and they resides on the   local disk

   The R script expects the test and train data files are present under the working directory with the following directory structure.
	.\UCI HAR Dataset\test
	.\UCI HAR Dataset\train

   The feature and activity label files are present under the working directory with the following directory structure.
	.\UCI HAR Dataset

2. It then merges the training and the test sets to create one final data set �xData�, with 10299 rows and 563 columns.

3. It Checks and report any missing values (NA�s). It cleans up the Features names by removing characters such as �() -  ,�  
   and take care of duplicate Feature names. See Table-1 for a list of duplicate Feature names.

4. Extracts only the measurements on the mean and standard deviation for each measurement and create a new data set 'meanStdData'. 
   This data set has 10299 rows and 88 columns. Note that this data set also contains Activity and Subject columns besides 
   86 'mean' and 'std' columns. 

5. Uses descriptive Activity names to name the activities in the data set. Appropriately labels the data set with descriptive 
   Activity names. 

6. Creates another, independent tidy data set 'aggrData' by using the data set from step#4 with calculating the average of  
   each variable for each activity and each subject. The tidy data set has 180 rows and 88 columns. Note that this data set also
   contains Activity and Subject columns

7. Write the final tidy data set to a csv file 'avgData.csv'


====================
 Some Observations: 
====================

The following observations were made during the analysis

    * Number of features (columns) in the first data set 'xData' : 563;  Number of samples/observations (rows): 10299

    * No missing data was found, i.e. no NA�s we present in 'xData' 

    * 84 duplicate column names were found in the data set 'xData'. This means a total of 146 columns could create conflict.

    * Column name contained characters such as �()�,  �,�  and �-�

    * Out of 563, 561 features are numeric type. Column no 562 and 563 (Subject, Activity) are of factor type in the 'xData'

    * There are 86 columns with the word 'mean' and 'std' in the feature names of 'xData'

    * The final tidy data set 'aggrData' with column averages contains 180 rows and 88 columns 
      including the 'Activity' and 'Subject' columns

    * There are six Activity Levels (a factor type)
      WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING STANDING, LAYING

    * There are 30 Subject Levels (a factor type); 1 through 30


====================================
 Table - 1 (Duplicate Column Names) 
====================================

303 fBodyGyro-bandsEnergy()-9,16  462 fBodyAccJerk-bandsEnergy()-9,16   513 fBodyAcc-bandsEnergy()-9,16
304 fBodyGyro-bandsEnergy()-9,16  463 fBodyAccJerk-bandsEnergy()-9,16   514 fBodyAcc-bandsEnergy()-9,16
305 fBodyGyro-bandsEnergy()-9,16  464 fBodyAccJerk-bandsEnergy()-9,16   515 fBodyAcc-bandsEnergy()-9,16
306 fBodyGyro-bandsEnergy()-7,64  465 fBodyAccJerk-bandsEnergy()-57,64	516 fBodyAcc-bandsEnergy()-57,64
307 fBodyGyro-bandsEnergy()-7,64  466 fBodyAccJerk-bandsEnergy()-57,64	517 fBodyAcc-bandsEnergy()-57,64
308 fBodyGyro-bandsEnergy()-7,64  467 fBodyAccJerk-bandsEnergy()-57,64	518 fBodyAcc-bandsEnergy()-57,64
309 fBodyGyro-bandsEnergy()-9,64  468 fBodyAccJerk-bandsEnergy()-49,64	519 fBodyAcc-bandsEnergy()-49,64
310 fBodyGyro-bandsEnergy()-9,64  469 fBodyAccJerk-bandsEnergy()-49,64	520 fBodyAcc-bandsEnergy()-49,64
311 fBodyGyro-bandsEnergy()-9,64  470 fBodyAccJerk-bandsEnergy()-49,64	521 fBodyAcc-bandsEnergy()-49,64
312 fBodyGyro-bandsEnergy()-9,56  471 fBodyAccJerk-bandsEnergy()-49,56	522 fBodyAcc-bandsEnergy()-49,56
313 fBodyGyro-bandsEnergy()-9,56  472 fBodyAccJerk-bandsEnergy()-49,56	523 fBodyAcc-bandsEnergy()-49,56
314 fBodyGyro-bandsEnergy()-9,56  473 fBodyAccJerk-bandsEnergy()-49,56	524 fBodyAcc-bandsEnergy()-49,56
315 fBodyGyro-bandsEnergy()-1,48  474 fBodyAccJerk-bandsEnergy()-41,48	525 fBodyAcc-bandsEnergy()-41,48
316 fBodyGyro-bandsEnergy()-1,48  475 fBodyAccJerk-bandsEnergy()-41,48	526 fBodyAcc-bandsEnergy()-41,48
317 fBodyGyro-bandsEnergy()-1,48  476 fBodyAccJerk-bandsEnergy()-41,48	527 fBodyAcc-bandsEnergy()-41,48
318 fBodyGyro-bandsEnergy()-3,48  477 fBodyAccJerk-bandsEnergy()-33,48	528 fBodyAcc-bandsEnergy()-33,48
319 fBodyGyro-bandsEnergy()-3,48  478 fBodyAccJerk-bandsEnergy()-33,48	529 fBodyAcc-bandsEnergy()-33,48
320 fBodyGyro-bandsEnergy()-3,48  479 fBodyAccJerk-bandsEnergy()-33,48	530 fBodyAcc-bandsEnergy()-33,48
321 fBodyGyro-bandsEnergy()-3,40  480 fBodyAccJerk-bandsEnergy()-33,40	531 fBodyAcc-bandsEnergy()-33,40
322 fBodyGyro-bandsEnergy()-3,40  481 fBodyAccJerk-bandsEnergy()-33,40	532 fBodyAcc-bandsEnergy()-33,40
323 fBodyGyro-bandsEnergy()-3,40  482 fBodyAccJerk-bandsEnergy()-33,40	533 fBodyAcc-bandsEnergy()-33,40
324 fBodyGyro-bandsEnergy()-5,48  483 fBodyAccJerk-bandsEnergy()-25,48	534 fBodyAcc-bandsEnergy()-25,48
325 fBodyGyro-bandsEnergy()-5,48  484 fBodyAccJerk-bandsEnergy()-25,48	535 fBodyAcc-bandsEnergy()-25,48
326 fBodyGyro-bandsEnergy()-5,48  485 fBodyAccJerk-bandsEnergy()-25,48	536 fBodyAcc-bandsEnergy()-25,48
327 fBodyGyro-bandsEnergy()-5,32  486 fBodyAccJerk-bandsEnergy()-25,32	537 fBodyAcc-bandsEnergy()-25,32
328 fBodyGyro-bandsEnergy()-5,32  487 fBodyAccJerk-bandsEnergy()-25,32	538 fBodyAcc-bandsEnergy()-25,32
329 fBodyGyro-bandsEnergy()-5,32  488 fBodyAccJerk-bandsEnergy()-25,32	539 fBodyAcc-bandsEnergy()-25,32
330 fBodyGyro-bandsEnergy()-7,32  489 fBodyAccJerk-bandsEnergy()-17,32	540 fBodyAcc-bandsEnergy()-17,32
331 fBodyGyro-bandsEnergy()-7,32  490 fBodyAccJerk-bandsEnergy()-17,32	541 fBodyAcc-bandsEnergy()-17,32
332 fBodyGyro-bandsEnergy()-7,32  491 fBodyAccJerk-bandsEnergy()-17,32	542 fBodyAcc-bandsEnergy()-17,32
333 fBodyGyro-bandsEnergy()-7,24  492 fBodyAccJerk-bandsEnergy()-17,24	543 fBodyAcc-bandsEnergy()-17,24
334 fBodyGyro-bandsEnergy()-7,24  493 fBodyAccJerk-bandsEnergy()-17,24	544 fBodyAcc-bandsEnergy()-17,24
335 fBodyGyro-bandsEnergy()-7,24  494 fBodyAccJerk-bandsEnergy()-17,24  545 fBodyAcc-bandsEnergy()-17,24
336 fBodyGyro-bandsEnergy()-1,8	  495 fBodyAccJerk-bandsEnergy()-1,8    546 fBodyAcc-bandsEnergy()-1,8
337 fBodyGyro-bandsEnergy()-1,8   496 fBodyAccJerk-bandsEnergy()-1,8    547 fBodyAcc-bandsEnergy()-1,8
338 fBodyGyro-bandsEnergy()-1,8	  497 fBodyAccJerk-bandsEnergy()-1,8    548 fBodyAcc-bandsEnergy()-1,8
339 fBodyGyro-bandsEnergy()-1,24  498 fBodyAccJerk-bandsEnergy()-1,24   549 fBodyAcc-bandsEnergy()-,24
340 fBodyGyro-bandsEnergy()-1,24  499 fBodyAccJerk-bandsEnergy()-1,24   550 fBodyAcc-bandsEnergy()-,24
341 fBodyGyro-bandsEnergy()-1,24  500 fBodyAccJerk-bandsEnergy()-1,24   551 fBodyAcc-bandsEnergy()-,24
342 fBodyGyro-bandsEnergy()-1,16  501 fBodyAccJerk-bandsEnergy()-1,16   552 fBodyAcc-bandsEnergy()-,16
343 fBodyGyro-bandsEnergy()-1,16  502 fBodyAccJerk-bandsEnergy()-1,16   553 fBodyAcc-bandsEnergy()-,16
344 fBodyGyro-bandsEnergy()-1,16  503 fBodyAccJerk-bandsEnergy()-1,16   554 fBodyAcc-bandsEnergy()-,16


=============
 References:
=============
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] R Core Team (2012). �R: A language and environment for statistical computing.� URL: http://www.R-project.org
