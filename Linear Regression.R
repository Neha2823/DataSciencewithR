#Load data

Nd<-read.csv("c:/users/NEHA_BGL/desktop/NewspaperData.csv")

# Visualization
install.packages("lattice")
install.packages("ggplot2")
library(lattice)
dotplot(Nd$sunday, main="Dot Plot of Sunday Circulations",col="dodgerblue4")
dotplot(Nd$daily, main="Dot Plot of Daily Circulations", col="dodgerblue4")
boxplot(Nd$sunday,col="dodgerblue4")
boxplot(Nd$daily,col="dodgerblue4")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
colnames(Nd)
model<- lm(sunday~daily,data =Nd)
summary(model)
new_daily=data.frame(daily=c(200,300))
sun1=predict(model,newdata=new_daily)
sun1

pred<-predict(model)
pred

pred<-predict(model)
final(data<-data.frame(Nd,pred,"Error" = Nd$sunday-pred))
