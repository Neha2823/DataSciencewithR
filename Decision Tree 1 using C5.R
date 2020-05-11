# Load the data

Company_data<-read.csv("E:/Study/Decision Tree/Company_data.csv")

# Required libraries
library(caret)
library(C50)

hist(Company_data$Sales)
Company_data$High = ifelse(Company_data$Sales<10, "No", "Yes")
Company_data$High<-as.factor(Company_data$High)
Company_data<-Company_data[,-1]

set.seed(300)
inTraininglocal<-createDataPartition(Company_data$High,p=.70,list = F)
training<-Company_data[inTraininglocal,]
testing<-Company_data[-inTraininglocal,]

model<-C5.0(High~.,data = training)
summary(model)

pred<-predict.C5.0(model,testing[,-11])
a<-table(testing$High,pred)
sum(diag(a))/sum(a)
plot(model)
