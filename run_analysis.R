url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, dest='data.zip')
unzip('data.zip')

train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
train[,ncol(train)+1] <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header = FALSE)
train[,ncol(train)+1] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)

test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)
test[,ncol(test)+1] <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header = FALSE)
test[,ncol(test)+1] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header = FALSE)

label <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
colnames(label) <- c("id", "Activity")

feat <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE, stringsAsFactors = FALSE)

total <- rbind(train, test)

cols <- grep(".*-mean.*|.*-std.*", feat[,2])
feat <- feat[cols,]

cols <- c(cols, ncol(train) -1, ncol(train))
total <- total[,cols]
colnames(total) <- c(feat$V2, 'Activity_id', 'Subject')

total <- merge(total, label, by.x = "Activity_id", by.y = "id")
total$Activity_id <- NULL

# total$Activity <- as.factor(total$Activity)
# total$Subject <- as.factor(total$Subject)

tidy <- aggregate(. ~ Activity + Subject, data = total, FUN =  mean)

write.csv(tidy, file='tidy.csv', row.names = FALSE)
