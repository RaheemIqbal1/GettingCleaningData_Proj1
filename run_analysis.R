#------------------------------------------------------------------------------
# This R script (run_analysis.R) does the following.
# 
# 1. Read the following files from the local disk as data frames
#    X_test, y_test, subject_test
#    X_train, y_train, subject_tain
#    activity_labels.txt, features.txt
#
# 2. Merges the training and the test sets to create one data set
#  
# 3. Check/report any missing values, cleaned up the Features names, and 
#    take care of duplicate Feature names
#
# 4. Extracts only the measurements on the mean and standard deviation 
#    for each measurement and create a new data set. 
#
# 5. Uses descriptive Activity names to name the activities in the data set
#    Appropriately labels the data set with descriptive Activity names. 
#
# 6. Creates a second, independent tidy data set using the data set from step#4
#    with the average of each variable for each activity and each subject.
#
# 7. Write the final tidy data set to a csv file 'avgData.csv'
#-------------------------------------------------------------------------------

#---------------------
# Step-1 (Read Files)
#---------------------
# Read the Activity Labels file
aLabls <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(aLabls) <- c("ActNum", "Activity")
aLabls$ActNum <- factor(aLabls$ActNum)

# Read the x and y Test data file and Test Subject data
xTst <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTst <- read.table("./UCI HAR Dataset/test/y_test.txt")
sTst <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the x and y Training data file and Training Subject data
xTrn <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrn <- read.table("./UCI HAR Dataset/train/y_train.txt")
sTrn <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read the data Feature names (column names)
featr <- read.table("./UCI HAR Dataset/features.txt", sep=" ", header = FALSE )

#---------------------
# Step-2 (Merge Data)
#---------------------
# Transpose the second column of the data frame 'featr' to a row
featr_row <- t(featr[2])

# Assign the column name 'Activity' to the yData
names(yTst) <- c("Activity")
names(yTrn) <- c("Activity")

# Assign the column name 'Subject' to the subject data
names(sTst) <- c("Subject")
names(sTrn) <- c("Subject")

# Append Test data to Train data to get the Complete data set
xData <- rbind(xTrn, xTst)
yData <- rbind(yTrn, yTst)
sData <- rbind(sTrn, sTst)

# Assign the column names 'featr_row' to the Complete data set
names(xData) <- featr_row

# dim(xData)  ---> 10299 obs. of  563 variables
# str(xData)

#---------------------
# Step-3 (Clean Data)
#---------------------
# Find Number of duplicate column names in the data set 'xData'
# This was discovered while visually inspecting the Feature names
s <- names(xData)
nDup <- length(s) - length(unique(s))
# nDup ---> 84
sprintf("Number of duplicate column names: %s", nDup) 

# Capture Duplicate Names in the data set xData
dupNames <- names( table(s)[table(s)>1] )

# Append X,Y,Z to the duplicate column names to create distinct column names
# The duplicate column numbers were identified after inspecting the data set
# using the duplicate name list 'dupNames' 
colnames(xData)[303:316] <- paste(colnames(xData)[303:316],"X",sep="")
colnames(xData)[317:330] <- paste(colnames(xData)[317:330],"Y",sep="")
colnames(xData)[331:344] <- paste(colnames(xData)[331:344],"Z",sep="")

colnames(xData)[382:395] <- paste(colnames(xData)[382:395],"X",sep="")
colnames(xData)[396:409] <- paste(colnames(xData)[396:409],"Y",sep="")
colnames(xData)[410:423] <- paste(colnames(xData)[410:423],"Z",sep="")

colnames(xData)[461:474] <- paste(colnames(xData)[461:474],"X",sep="")
colnames(xData)[475:488] <- paste(colnames(xData)[475:488],"Y",sep="")
colnames(xData)[489:502] <- paste(colnames(xData)[489:502],"Z",sep="")

# Check again Number of duplicate names in the data set xData
s <- names(xData)
nDup <- length(s) - length(unique(s))
# nDup ---> 0
sprintf("Number of duplicate column names: %s", nDup) 

# Cleaned up the final data set column names by 
# getting rid of characters such as () - and ,
colnames(xData) <- gsub('\\(|\\)',"",names(xData), perl = TRUE)
colnames(xData) <- gsub('\\-',"",names(xData), perl = TRUE)
colnames(xData) <- gsub('\\,',"",names(xData), perl = TRUE)

# Shape the final data by combining subject
# and activity columns to the measurement data set "xData'
xData$Activity <- factor(yData$Activity)
xData$Subject <- factor(sData$Subject)

# report the count of NA's in the final data set xData
naCount <- length(which(is.na(xData) == TRUE))
# naCount ---> 0
sprintf("Number of NA's in the final data set: %s", naCount) 

#---------------------------
# Step-4 (Extract Features)
#---------------------------
# Fetch the mean and standard deviation columns from xData
meanColms <- grep("Mean",colnames(xData), ignore.case = TRUE)
stdColms <- grep("Std",colnames(xData), ignore.case = TRUE)

#-------------------------
# Step-5 (Label Activity)
#-------------------------
# Activity Number indicator vs descriptive Activity
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

# Use descriptive Activity labels instead of Integers as Activity type
levels(xData$Activity)[1] <- levels(aLabls$Activity)[4]
levels(xData$Activity)[2] <- levels(aLabls$Activity)[6]
levels(xData$Activity)[3] <- levels(aLabls$Activity)[5]
levels(xData$Activity)[4] <- levels(aLabls$Activity)[2]
levels(xData$Activity)[5] <- levels(aLabls$Activity)[3]
levels(xData$Activity)[6] <- levels(aLabls$Activity)[1]

#--------------------
# Step-6 (Tidy Data)
#--------------------
# Create a Mean and Std (standard deviation) data set from xData
# Also add Activity and Subject Columns to the data set
meanStdData <- xData[c(562, 563, meanColms, stdColms)]
#write.table(meanStdData, "meanStdData.csv",col.names = TRUE, row.names=FALSE, sep = ",")

# Create the final tidy data set with the Average of 
# each variable for each Activity and each Subject. 
nEnd <- length(meanStdData)
i <- 4
nStart <- 3
x1 <- aggregate(meanStdData[nStart], by=list(meanStdData$Activity, meanStdData$Subject), FUN=mean)
while (i <= nEnd ) {
    if ( i == nStart+1 ){
        x2 <- aggregate(meanStdData[i], by=list(meanStdData$Activity, meanStdData$Subject), FUN=mean)
        aggrData <- merge(x1, x2, all=TRUE)      
    } else {
        x2 <- aggregate(meanStdData[i], by=list(meanStdData$Activity, meanStdData$Subject), FUN=mean)
        aggrData <- merge(aggrData, x2, all=TRUE)
    }
    i <- i + 1
}

# Append "Avg" before each Feature name except Activity and Subject
colnames(aggrData)[3:88] <- paste("Avg", colnames(aggrData)[3:88], sep="")

#--------------------------
# Step-7 (Write Tidy Data)
#--------------------------
# Write tidy data set to a csv file
names(aggrData)[1] <- c("Activity")
names(aggrData)[2] <- c("Subject")
aggrData <- aggrData[with(aggrData, order(Activity, Subject)), ]
write.table(aggrData, "avgData.csv",col.names = TRUE, row.names=FALSE, sep = ",")

