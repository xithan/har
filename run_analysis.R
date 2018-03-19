ROWS <- -1
DATA_DIR <- "UCI_HAR_Dataset"
library(dplyr)

# returns the path to global data files that are used for training and testing datasets
data_path <- function(file) {
  paste(DATA_DIR, file, sep="/")
}

# returns the path to files of the trainging or testing datasets
dataset_path <- function(data, dataset) {
  paste(DATA_DIR, "/", dataset, "/", data, "_", dataset, ".txt", sep="") 
}

features <- read.csv(data_path("features.txt"), sep="", header=FALSE, col.names=c("index", "name"))
activity_labels <- read.csv(data_path("activity_labels.txt"), header=FALSE, sep="", col.names=c("activity.id", "activity"))
std_and_mean_cols <- grep("-mean\\(\\)|-std\\(\\)", features$name)


std_and_mean_data <- function(dataset) {
  colnames = gsub("\\(\\)", "", features$name)
  data <- read.csv(dataset_path("X", dataset), sep="", header=FALSE, nrows=ROWS, 
           colClasses="numeric", skipNul=TRUE, strip.white=TRUE,
           col.names = colnames)
  data[, std_and_mean_cols]
}

activity_data <- function(dataset) {
  read.csv(dataset_path("y", dataset), sep="", header=FALSE, nrows=ROWS, colClasses="numeric", col.names = "activity.id")
}

subject_data <- function(dataset) {
  read.csv(dataset_path("subject", dataset), sep="", header=FALSE, nrows=ROWS, colClasses="integer", col.names = "subject")
}

tidy_data <- function(dataset) {
  std_and_mean <- std_and_mean_data(dataset) 
  activity <- activity_data(dataset)
  subjects <- subject_data(dataset)
  data <- cbind(subjects, activity, std_and_mean)
  data <- merge(activity_labels, data)
  select(data, -activity.id)
}

data <- rbind(tidy_data("train"), tidy_data("test"))
write.csv(data, "tidy_data.csv")

# the average of each mean and standard deviation value grouped by subject and activity
mean_data <- data %>% group_by(activity, subject) %>% summarize_all(funs(mean))
write.csv(mean_data, "mean_data.csv")
