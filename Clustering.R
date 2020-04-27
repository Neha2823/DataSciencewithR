#Data load
mydata1<-read.csv("c:/users/NEHA_BGL/desktop/Universities.csv")

################################
mydata <- scale(mydata1[,2:7])

d <- dist(mydata, method = "euclidean") #Computing the distance natrix
fit <- hclust(d, method="average") # Building the algorithm # try with 'centroid'
plot(fit) # display dendogram
clusters <- cutree(fit, k=5) # cut tree into 4 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=5, border="red")
#Attach the cluster numbers to Uni
clusters=data.frame('Uni'=mydata1[,1],'Cluster' =clusters)

# Elbow method
install.packages('factoextra')
install.packages("ggplot2")
library(factoextra)
fviz_nbclust(mydata, kmeans, method = "wss") +
  labs(subtitle = "Elbow method")

###Cluster algorithm building
km <- kmeans(mydata,4) 
km$centers
km$cluster
##Animation
install.packages("animation")
library(animation)
windows()
km <- kmeans.ani(mydata, 4)

