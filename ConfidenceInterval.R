install.packages("gmodels")
install.packages('nycflights13')
library(gmodels)
library(nycflights13)
data<-nycflights13::flights
dep_delay<-data$dep_delay
dep_delay1<-dep_delay[!is.na(dep_delay)]
ci(dep_delay1)
