# Descriptive statistics
library(datasets)
data("airquality")
airquality <- datasets::airquality
head(airquality) # First 6 rows of dataset
tail(airquality) # last 6 rows of dataset
airquality[,c(1,2)] # all rows and 1,2nd column)
airquality$Ozone # another way to see the columns

summary(airquality$Temp)
summary(airquality)

plot(airquality$Ozone)
plot(airquality$Ozone,airquality$Temp) # temp increases ozone also increases (scatterplot)
plot(airquality)

#Points and lines

plot(airquality$Ozone,type = "b") #p = points, l = lines, b = both
plot(airquality$Ozone, xlab = 'Ozone Concentration', ylab = 'No Of Instances',
     main = 'Ozone levels in NY City',col='Red')

#Horizontal bar plots

barplot(airquality$Ozone,main = 'Ozone concentrations in air',xlab = 'Ozone layers',
        col = 'blue',horiz = T)
#Histogram 

hist(airquality$Solar.R)
hist(airquality$Solar.R, main = 'Solar radiation values in air',xlab = 'Solar red',
     col = 'blue')

#Single box plot

boxplot(airquality$Solar.R)

#Multiple box plots

boxplot(airquality[,1:4],main='Multiple')

#margin of the grid(mar),
#no of rows and columns(mfrow),
#whether a border is to be included(bty)
#and position of the
#labels(las:1 for hor, last:0 for ver)
#bty - box around the plot

par(mfrow=c(3,3),mar=c(2,5,2,1), las=1, bty="n")
plot(airquality$Ozone)
plot(airquality$Ozone,airquality$Wind)
plot(airquality$Ozone,type ="l")
plot(airquality$Ozone,type="l")
plot(airquality$Ozone,type="l")
barplot(airquality$Ozone,main = 'Ozone concentrations in air',xlab = 'Ozone layers',
        col = 'blue',horiz = T)
hist(airquality$Solar.R)
boxplot(airquality$Solar.R)
boxplot(airquality[,1:4],main='Multiple')

