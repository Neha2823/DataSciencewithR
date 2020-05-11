# Random forest model building

data("iris")
library(randomForest)
model<-randomForest(iris$Species~.,data=iris,ntree=1000)
# View the forest results.
print(model)
#Imporantce of the variable - Lower Gini
print(importance(model))
#Prediction
pred<- predict(model,iris[,-5])
table(pred,iris$Species)


