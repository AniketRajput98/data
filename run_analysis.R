if(!file.exists("./data")){dir.create("./data")}

url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("./data/UCI HAR Dataset")){
download.file(url,destfile = "./data/data.zip")
unzip(zipfile = "./data/data.zip",exdir = "./data")
}

#readiing test data 

subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

#reading train data
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

#reading features and activity label
features<-read.table("./data/UCI HAR Dataset/features.txt")
activity_label<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

#setting columns name

colnames(X_test)<-features[,2]
colnames(X_train)<-features[,2]

colnames(y_train)<-"act_id"
colnames(y_test)<-"act_id"

colnames(subject_test)<-"sub_id"
colnames(subject_train)<-"sub_id"

colnames(activity_label)<-c("act_id","act_type")

#combining test and train data column-wise

train_data<-cbind(y_train,subject_train,X_train)
test_data<-cbind(y_test,subject_test,X_test)

#creating a complete dataset

CompleteDataset<-rbind(test_data,train_data)

#creating a logical vector for mean and std. deviation for each measurements 

logical_vector_std_mean<-grepl("act_id",colnames(CompleteDataset))|grepl("sub_id",colnames(CompleteDataset))|grepl("mean..",colnames(CompleteDataset))|grepl("std..",colnames(CompleteDataset))

#Subsetting mean and std. deviation from complete dataset

subset_mean_std<-CompleteDataset[,logical_vector_std_mean]


#Obtaining dataset with descriptive activity labels.
subsetwithActivityname<-merge(subset_mean_std,activity_label,by="act_id")

#Creating a second tidy dataset.
mean_tidydata<-aggregate(.~ sub_id+act_id,subsetwithActivityname,mean)
write.table(mean_tidydata,"tidydata.txt",row.names = F)

