Dear markers, 

The features in this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

The "run_analysis" R script proccesses the given raw data through these steps:

1. merge train dataset and test dataset, and get "all_sub", "all_y" and "all_X"

2. select variables containing required strings from "all_X", and get "select_X"

3. merge "all_sub", "all_y" and "select_X" into a complete dataframe

4. other minor adjustments, such as renaming column names, before write.table

The variable names(except "subject_id" and "activities", which are already 
explicitly descriptive) are constituted by four parts. For example, 
"tBodyAcc-mean()-X" is made by prefix "t"(time), "BodyAcc"(Body Acceleration), 
"mean()"(how variables are estimated from this signal, in this case, by mean value), and "X"(the value on X axis/direction).

Detailed explanation about all constructing elements of variables is covered 
in the codebook.


In order for you to conveniently assess my code, it would be nice of you to:

1) download the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2) unzip it and set "/UCI HAR Dataset"as the working directory.

3) run the script "run_analysis.R" to produce "tidy.txt" in the above directory.

4) use the following code to read "tidy.txt" for your evaluation and grading:
tidy <- read.table("./tidy.txt", header=T, sep="", row.name=FALSE)


Thank you for your time!