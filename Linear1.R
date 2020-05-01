WC_AT<-read.csv("c:/users/NEHA_BGL/desktop/WC_AT.csv")

# Visualization

install.packages("lattice")
install.packages("ggplot2")
library(lattice)
dotplot(AT, main="Dot Plot of AT Circulations",col="dodgerblue4")
dotplot(Waist, main="Dot Plot of Waist Circulations", col="dodgerblue4")
boxplot(AT,col="dodgerblue4")
boxplot(Waist,col="dodgerblue4")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
colnames(WC_AT)
model<- lm(AT~Waist,data =WC_AT)
summary(model)

newdata=data.frame(Waist=40)
AT=predict(model,newdata = newdata)
AT


