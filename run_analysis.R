## read all needed data into R, for later use:
features <- read.table("./features.txt", header=F, sep="")
activity_labels <- read.table("./activity_labels.txt", header=F, sep="")
train_sub <- read.table("./train/subject_train.txt", header=F, sep="")
train_X <- read.table("./train/X_train.txt", header=F, sep="")
train_y <- read.table("./train/y_train.txt", header=F, sep="")
test_sub <- read.table("./test/subject_test.txt", header=F, sep="")
test_X <- read.table("./test/X_test.txt", header=F, sep="")
test_y <- read.table("./test/y_test.txt", header=F, sep="")


## 1) row combine train_X and test_X into "all_X"
all_X <- rbind(train_X, test_X)
## 2) give names in "features" to the variables in "all_X" dataframe
colnames(all_X) <- features$V2
## 3) filter for columns, whose names include strings "mean" and "std", 
## and remove the rest columns, store the result in "select_X"
select_X <- all_X[, grep("mean\\(\\)|std\\(\\)", names(all_X))]

## 4) row combine train_sub and test_sub into all_sub;
##    row combine train_y and test_y into all_y
all_sub <- rbind(train_sub, test_sub)
all_y <- rbind(train_y, test_y)
## 5) col combine all_sub, all_y and select_X into "complete" dataframe
complete <- cbind(all_sub, all_y, select_X)

## 6) name subject column "subject_id", y column "activities"
colnames(complete)[1:2] <- c("subject_id","activities") 

## 7) calculate the average of each variable for each activity and each subject
attach(complete)
a <- aggregate(complete, by = list(subject_id, activities), FUN = mean)
tidy <- subset(a, select=-c(Group.1, Group.2))

## 8) apply names given in "activity_labels" to column "activities"
for (i in 1:6) {
      tidy$activities <- gsub(activity_labels$V1[i], activity_labels$V2[i], 
                           tidy$activities)
}

## 9) write "tidy" dataset into a text file: 
write.table(tidy, file = "./tidy.txt", row.name=FALSE) 



