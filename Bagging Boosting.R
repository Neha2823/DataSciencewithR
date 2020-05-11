#Data partition for model building and testing

inTraininglocal<-createDataPartition(iris$Species,p=.70,list = F)
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]
#Model Building
model<-C5.0(training$Species~.,data = training,trials=20) #Trials- Boosting parameter
#Generate the model summary
summary(model)
#Predict for test data set
pred<-predict.C5.0(model,testing[,-5])
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)


#Bagging

library(ipred)
data("iris")
set.seed(300)
train<-iris[1:130,]
test<-iris[131:150,]
mybag<-bagging(train$Species ~ .,data=train,nbagg=50)
credit_pred<-predict(mybag,test[,-5])
table(credit_pred,test$Species)

# Stacking

library(caret)
library(C50)
data("iris")
set.seed(7)
inTraininglocal<-createDataPartition(iris$Species,p=.70,list = F)
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]

#Model Building
model<-C5.0(Species~.,data = training) 
#Generate the model summary
summary(model)
#Predict for test data set
pred<-predict.C5.0(model,testing[,-5])
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)
plot(model)

library(ipred)
set.seed(300)
train<-iris[1:130,]
test<-iris[131:150,]
mybag<-bagging(train$Species ~ .,data=train,nbagg=50)
credit_pred<-predict(mybag,test[,-5])
table(credit_pred,test$Species)

