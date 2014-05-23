
The tidy data set 'avgData.csv' created by the R script 'run_analysis.R'.
Please refer to README.md file for the details of how the tidy data set was created.

===========
 Features:
===========
A brief description of 88 features contained in the data set is as follows 

Activity: Factor type, feature with 6 Activity levels. Activity of the person carrying the smart phone
          WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Subject:  Factor type, feature with 30 levels. Persons numbered from 1 through 30
          1,2,3 .... 29, 30

Features 3 through 88: Average of 86 quantities estimated from the time and frequence domain measured signals.
These 86 featutes are the average of the quantities for each Activity and each Subject  
The original features in this data set came from the accelerometer and gyroscope sensors in the Samsung phone.
The 86 signal contains the following key words describing the meaning of each signal
 
Avg:  Average of the quantity
t:    Time domain signal
f:    Frequency domain signal
mean: Mean value
std:  Standard Deviation value
Acc:  Body and gravity acceleration (accelerometer)
XYZ:  X, Y, and Z Cartesian coordinates (X, Y, Z direction)
Jerk: Jerk signals
Gyro: Gyroscope sensor signals
Freq: Frequency signal
Mag:  Magnitude

================
 Feature Names:
================
01. Activity                            
02. Subject                             
03. AvgtBodyAccmeanX                    
04. AvgtBodyAccmeanY                    
05. AvgtBodyAccmeanZ                    
06. AvgtGravityAccmeanX                 
07. AvgtGravityAccmeanY                 
08. AvgtGravityAccmeanZ                 
09. AvgtBodyAccJerkmeanX                
10. AvgtBodyAccJerkmeanY                
11. AvgtBodyAccJerkmeanZ                
12. AvgtBodyGyromeanX                   
13. AvgtBodyGyromeanY                   
14. AvgtBodyGyromeanZ                   
15. AvgtBodyGyroJerkmeanX               
16. AvgtBodyGyroJerkmeanY               
17. AvgtBodyGyroJerkmeanZ               
18. AvgtBodyAccMagmean                  
19. AvgtGravityAccMagmean               
20. AvgtBodyAccJerkMagmean              
21. AvgtBodyGyroMagmean                 
22. AvgtBodyGyroJerkMagmean             
23. AvgfBodyAccmeanX                    
24. AvgfBodyAccmeanY                    
25. AvgfBodyAccmeanZ                    
26. AvgfBodyAccmeanFreqX                
27. AvgfBodyAccmeanFreqY                
28. AvgfBodyAccmeanFreqZ                
29. AvgfBodyAccJerkmeanX                
30. AvgfBodyAccJerkmeanY                
31. AvgfBodyAccJerkmeanZ                
32. AvgfBodyAccJerkmeanFreqX            
33. AvgfBodyAccJerkmeanFreqY            
34. AvgfBodyAccJerkmeanFreqZ            
35. AvgfBodyGyromeanX                   
36. AvgfBodyGyromeanY                   
37. AvgfBodyGyromeanZ                   
38. AvgfBodyGyromeanFreqX               
39. AvgfBodyGyromeanFreqY               
40. AvgfBodyGyromeanFreqZ               
41. AvgfBodyAccMagmean                  
42. AvgfBodyAccMagmeanFreq              
43. AvgfBodyBodyAccJerkMagmean          
44. AvgfBodyBodyAccJerkMagmeanFreq      
45. AvgfBodyBodyGyroMagmean             
46. AvgfBodyBodyGyroMagmeanFreq         
47. AvgfBodyBodyGyroJerkMagmean         
48. AvgfBodyBodyGyroJerkMagmeanFreq     
49. AvgangletBodyAccMeangravity         
50. AvgangletBodyAccJerkMeangravityMean 
51. AvgangletBodyGyroMeangravityMean    
52. AvgangletBodyGyroJerkMeangravityMean
53. AvgangleXgravityMean                
54. AvgangleYgravityMean                
55. AvgangleZgravityMean                
56. AvgtBodyAccstdX                     
57. AvgtBodyAccstdY                     
58. AvgtBodyAccstdZ                     
59. AvgtGravityAccstdX                  
60. AvgtGravityAccstdY                  
61. AvgtGravityAccstdZ                  
62. AvgtBodyAccJerkstdX                 
63. AvgtBodyAccJerkstdY                 
64. AvgtBodyAccJerkstdZ                 
65. AvgtBodyGyrostdX                    
66. AvgtBodyGyrostdY                    
67. AvgtBodyGyrostdZ                    
68. AvgtBodyGyroJerkstdX                
69. AvgtBodyGyroJerkstdY                
70. AvgtBodyGyroJerkstdZ                
71. AvgtBodyAccMagstd                   
72. AvgtGravityAccMagstd                
73. AvgtBodyAccJerkMagstd               
74. AvgtBodyGyroMagstd                  
75. AvgtBodyGyroJerkMagstd              
76. AvgfBodyAccstdX                     
77. AvgfBodyAccstdY                     
78. AvgfBodyAccstdZ                     
79. AvgfBodyAccJerkstdX                 
80. AvgfBodyAccJerkstdY                 
81. AvgfBodyAccJerkstdZ                 
82. AvgfBodyGyrostdX                    
83. AvgfBodyGyrostdY                    
84. AvgfBodyGyrostdZ                    
85. AvgfBodyAccMagstd                   
86. AvgfBodyBodyAccJerkMagstd           
87. AvgfBodyBodyGyroMagstd           
88. AvgfBodyBodyGyroJerkMagstd

=====================
 Some Observations: 
=====================

The following are some key facts about the final tidy data set 

    * This data set contains 180 Records (rows) and 88 Features (columns) including the 'Activity' 
      and 'Subject' columns
    
    * There are six Activity Levels (a factor type) in the tidy data set
      WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

    * There are 30 Subject Levels (a factor type), 1 through 30, in the tidy data set.

======================
 Data Transformation: 
======================
    * The following files were merged to create the first data set

	X_test, y_test, subject_test
	X_train, y_train, subject_tain
	activity_labels.txt, features.txt

      This full data set contained 563 Features and 10299 Records

    * No missing data was found in the full data set, i.e. no NA we present in the full data set

    * 84 duplicate column names were found in the original data set, which means there are 146 total 
      columns which could create conflict. These were renamed by affixing X, Y, Z at the end to fix 
      the conflict. 

    * Feature (column) name contained characters such as () , - which were removed

    * A second data set was then created with Feature names containing the key words 'mean' and 'std'.
      Activity and Subject columns were also merged to this data set. This full data set contains 88 Features 
      and 10299 records

    * The final independent tidy data set was created by using the data set from the last step by 
      calculating the average of each variable for each activity and every subject. The tidy data set has 
      180 rows and 88 columns. Note that this data set also contains Activity and Subject columns

=========================
 Duplicate Column Names:
=========================

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


