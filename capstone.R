setwd("D:/Machine Learning")
telecomfinal<-read.csv("telecomfinal.csv")
summary(telecomfinal)
index <- which(is.na(telecomfinal$mou_Mean))

# Removing maximum missing % na values 					

names(telecomfinal)
telecomfinal<-telecomfinal[-c(46,47,48,49,52,53,55,61,62,63,64,66,72,12)]
names(telecomfinal)

# Convert factor variable to integer

telecomfinal$dummy_crclscod=as.integer(telecomfinal$crclscod)
telecomfinal$dummy_asl_flag=as.integer(telecomfinal$asl_flag)
telecomfinal$dummy_prizm_social_one=as.integer(telecomfinal$prizm_social_one)
telecomfinal$dummy_area=as.integer(telecomfinal$area)
telecomfinal$dummy_refurb_new=as.integer(telecomfinal$refurb_new)
telecomfinal$dummy_hnd_webcap=as.integer(telecomfinal$hnd_webcap)
telecomfinal$dummy_marital=as.integer(telecomfinal$marital)
telecomfinal$dummy_ethnic=as.integer(telecomfinal$ethnic)
telecomfinal$dummy_car_buy=as.integer(telecomfinal$car_buy)
telecomfinal$dummy_csa=as.integer(telecomfinal$csa)
names(telecomfinal)
telecomfinal<-telecomfinal[-c(31,32,33,34,35,36,37,38,65,67)]
names(telecomfinal)

# Treating outlier

library(dplyr)
b<-boxplot(telecomfinal$mou_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$mou_Mean>7668)
telecomfinal[ind,"mou_Mean"]<-7668

b<-boxplot(telecomfinal$rev_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$rev_Range==13740.54)
telecomfinal[ind,"rev_Range"]<-4586

b<-boxplot(telecomfinal$mou_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$mou_Range==8075)
telecomfinal[ind,"mou_Range"]<-6233

b<-boxplot(telecomfinal$change_mou)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$change_mou==31219.250)
telecomfinal[ind,"change_mou"]<-4480

b<-boxplot(telecomfinal$drop_blk_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$drop_blk_Mean>400.6667)
telecomfinal[ind,"drop_blk_Mean"]<-340

b<-boxplot(telecomfinal$drop_vce_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$drop_vce_Range>250)
telecomfinal[ind,"drop_vce_Range"]<-200

b<-boxplot(telecomfinal$owylis_vce_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$owylis_vce_Range==699)
telecomfinal[ind,"owylis_vce_Range"]<-554

b<-boxplot(telecomfinal$mou_opkv_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$mou_opkv_Range>3000)
telecomfinal[ind,"mou_opkv_Range"]<-2791.13

b<-boxplot(telecomfinal$custcare_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$custcare_Mean>150)
telecomfinal[ind,"custcare_Mean"]<-132.3333

b<-boxplot(telecomfinal$iwylis_vce_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$iwylis_vce_Mean>400)
telecomfinal[ind,"iwylis_vce_Mean"]<-345

b<-boxplot(telecomfinal$ccrndmou_Range)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$ccrndmou_Range==1590)
telecomfinal[ind,"ccrndmou_Range"]<-693

b<-boxplot(telecomfinal$ovrmou_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$ovrmou_Mean==4320.75)
telecomfinal[ind,"ovrmou_Mean"]<-3472.25

b<-boxplot(telecomfinal$avgmou)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$avgmou>6000)
telecomfinal[ind,"avgmou"]<-5200.14

b<-boxplot(telecomfinal$avg6mou)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$avg6mou>6500)
telecomfinal[ind,"avg6mou"]<-5589

b<-boxplot(telecomfinal$actvsubs)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$actvsub==11)
telecomfinal[ind,"actvsubs"]<-8

b<-boxplot(telecomfinal$roam_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$roam_Mean>500)
telecomfinal[ind,"roam_Mean"]<-490.6175

b<-boxplot(telecomfinal$recv_sms_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$recv_sms_Mean>500)
telecomfinal[ind,"recv_sms_Mean"]<-145.33333

b<-boxplot(telecomfinal$blck_dat_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$blck_dat_Mean>100)
telecomfinal[ind,"blck_dat_Mean"]<-70

b<-boxplot(telecomfinal$mou_pead_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$mou_pead_Mean>300)
telecomfinal[ind,"mou_pead_Mean"]<-310.0933

b<-boxplot(telecomfinal$da_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$da_Mean>20)
telecomfinal[ind,"da_Mean"]<- 18.0675

b<-boxplot(telecomfinal$datovr_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$datovr_Mean>160)
telecomfinal[ind,"datovr_Mean"]<-149.5650

b<-boxplot(telecomfinal$drop_dat_Mean)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$drop_dat_Mean>85)
telecomfinal[ind,"drop_dat_Mean"]<-81.0000

b<-boxplot(telecomfinal$totrev)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$totrev>15000)
telecomfinal[ind,"totrev"]<-14383.97

b<-boxplot(telecomfinal$adjrev)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$adjrev>14000)
telecomfinal[ind,"adjrev"]<-13510.14

b<-boxplot(telecomfinal$avgrev)
index<-which(ntile(b$out,100)==100)
sort(b$out[index],decreasing = TRUE)
ind<-which(telecomfinal$avgrev>700)
telecomfinal[ind,"avgrev"]<-685.17

# NA Value Treatment

summary(telecomfinal)
colSums(is.na(telecomfinal))
colnames(telecomfinal)

telecomfinal<-telecomfinal[-c(38,39)]

telecomfinal%>%count(churn,levels=dummy_prizm_social_one)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_prizm_social_one%in%datC1$levels)%>%count(dummy_prizm_social_one))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_prizm_social_one",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_prizm_social_one))
telecomfinal$dummy_prizm_social_one[index]<-4
View(telecomfinal$dummy_prizm_social_one)

telecomfinal%>%count(churn,levels=dummy_csa)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_csa%in%datC1$levels)%>%count(dummy_csa))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_csa",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_csa))
telecomfinal$dummy_csa[index]<-731
View(telecomfinal$dummy_csa)

colSums(is.na(telecomfinal))

telecomfinal%>%count(churn,levels=dummy_hnd_webcap)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_hnd_webcap %in%datC1$levels)%>%count(dummy_hnd_webcap ))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_hnd_webcap ",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_hnd_webcap ))
telecomfinal$dummy_hnd_webcap [index]<-2
View(telecomfinal$dummy_hnd_webcap )

colSums(is.na(telecomfinal))

telecomfinal%>%count(churn,levels=dummy_marital)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_marital %in%datC1$levels)%>%count(dummy_marital ))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_marital ",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_marital ))
telecomfinal$dummy_marital [index]<-4
View(telecomfinal$dummy_marital )

colSums(is.na(telecomfinal))

telecomfinal%>%count(churn,levels=dummy_ethnic)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_ethnic %in%datC1$levels)%>%count(dummy_ethnic ))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_ethnic ",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_ethnic ))
telecomfinal$dummy_ethnic [index]<-9
View(telecomfinal$dummy_ethnic )

colSums(is.na(telecomfinal))

telecomfinal%>%count(churn,levels=dummy_car_buy)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(dummy_car_buy %in%datC1$levels)%>%count(dummy_car_buy ))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("dummy_car_buy ",nrow(datC1))

View(datC1)

index<-which(is.na(telecomfinal$dummy_car_buy ))
telecomfinal$dummy_car_buy [index]<-1
View(telecomfinal$dummy_car_buy )

colSums(is.na(telecomfinal))

telecomfinal%>%count(churn,levels=age2)%>%filter(churn==1)->datC1
datC1$N<-unclass(telecomfinal%>%filter(age2%in%datC1$levels)%>%count(age2))[[2]]
datC1$ChurnPerc<-datC1$n/datC1$N
datC1$Var.Name<-rep("age2",nrow(datC1))

index<-which(is.na(telecomfinal$age2))
telecomfinal$age2[index]<-84
View(telecomfinal$age2[index])

telecomfinal%>%mutate(dec=ntile(avg6qty,n=10))%>%count(churn,dec)%>%filter(churn==1)->dat45
dat45$N<-unclass(telecomfinal%>%mutate(dec=ntile(avg6qty,n=10))%>%count(dec)%>%unname())[[2]]
dat45$churn_perc<-dat45$n/dat45$N
dat45$GreaterThan<-unclass(telecomfinal%>%mutate(dec=ntile(avg6qty,n=10))%>%group_by(dec)%>%summarise(min(avg6qty)))[[2]]
dat45$LessThan<-unclass(telecomfinal%>%mutate(dec=ntile(avg6qty,n=10))%>%group_by(dec)%>%summarise(max(avg6qty)))[[2]]
dat45$varname<-rep("avg6qty",nrow(dat45))

index<-which(is.na(telecomfinal$avg6qty))
telecomfinal$avg6qty[index]<-397
View(telecomfinal$avg6qty[index])


telecomfinal%>%mutate(dec=ntile(change_mou,n=10))%>%count(churn,dec)%>%filter(churn==1)->dat45
dat45$N<-unclass(telecomfinal%>%mutate(dec=ntile(change_mou,n=10))%>%count(dec)%>%unname())[[2]]
dat45$churn_perc<-dat45$n/dat45$N
dat45$GreaterThan<-unclass(telecomfinal%>%mutate(dec=ntile(change_mou,n=10))%>%group_by(dec)%>%summarise(min(change_mou)))[[2]]
dat45$LessThan<-unclass(telecomfinal%>%mutate(dec=ntile(change_mou,n=10))%>%group_by(dec)%>%summarise(max(change_mou)))[[2]]
dat45$varname<-rep("change_mou",nrow(dat45))

View(dat45)

index<-which(is.na(telecomfinal$change_mou))
telecomfinal<-telecomfinal[-c(index),]

colSums((is.na(telecomfinal)))

telecomfinal%>%mutate(dec=ntile(avg6mou,n=10))%>%count(churn,dec)%>%filter(churn==1)->dat45
dat45$N<-unclass(telecomfinal%>%mutate(dec=ntile(avg6mou,n=10))%>%count(dec)%>%unname())[[2]]
dat45$churn_perc<-dat45$n/dat45$N
dat45$GreaterThan<-unclass(telecomfinal%>%mutate(dec=ntile(avg6mou,n=10))%>%group_by(dec)%>%summarise(min(avg6mou)))[[2]]
dat45$LessThan<-unclass(telecomfinal%>%mutate(dec=ntile(avg6mou,n=10))%>%group_by(dec)%>%summarise(max(avg6mou)))[[2]]
dat45$varname<-rep("avg6mou",nrow(dat45))

View(dat45)

index<-which(is.na(telecomfinal$avg6mou))
telecomfinal$avg6mou[index]<-3000
View(telecomfinal$avg6mou[index])

View(dat45)

telecomfinal%>%mutate(dec=ntile(hnd_price,n=4))%>%count(churn,dec)%>%filter(churn==1)->dat45
dat45$N<-unclass(telecomfinal%>%mutate(dec=ntile(hnd_price,n=4))%>%count(dec)%>%unname())[[2]]
dat45$churn_perc<-dat45$n/dat45$N
dat45$GreaterThan<-unclass(telecomfinal%>%mutate(dec=ntile(hnd_price,n=4))%>%group_by(dec)%>%summarise(min(hnd_price)))[[2]]
dat45$LessThan<-unclass(telecom%>%mutate(dec=ntile(hnd_price,n=4))%>%group_by(dec)%>%summarise(max(hnd_price)))[[2]]
dat45$varname<-rep("hnd_price",nrow(dat45))

index<-which(is.na(telecomfinal$hnd_price))
telecomfinal$hnd_price[index]<-200
View(telecomfinal$hnd_price[index])

colnames(telecomfinal)
colSums((is.na(telecomfinal)))
telecomfinal<-na.omit(telecomfinal)

# Sampling

sampling<-sort(sample(nrow(telecomfinal), nrow(telecomfinal)*.7))

length(sampling)

train<-telecomfinal[sampling,]
test<-telecomfinal[-sampling,]
nrow(train)
nrow(test)

# Running Logistic regression 

reduced<-step(myresult,direction="both")

myresult<-glm(data=train,churn ~ mou_Mean + totmrc_Mean + rev_Range + mou_Range + change_mou + 
                drop_blk_Mean + drop_vce_Range + owylis_vce_Range + mou_opkv_Range + 
                months + totcalls + eqpdays + custcare_Mean + callwait_Mean + 
                iwylis_vce_Mean + callwait_Range + ccrndmou_Range + adjqty + 
                ovrrev_Mean + rev_Mean + ovrmou_Mean + comp_vce_Mean + plcd_vce_Mean + 
                avg3mou + avgmou + avg3qty + avgqty + avg6mou + avg6qty + 
                age2 + models + hnd_price + actvsubs + uniqsubs + forgntvl + 
                opk_dat_Mean + roam_Mean + recv_sms_Mean + blck_dat_Mean + 
                mou_pead_Mean + da_Mean + da_Range + datovr_Mean + datovr_Range + 
                drop_dat_Mean + drop_vce_Mean + adjmou + totrev + adjrev + 
                avgrev + dummy_crclscod + dummy_prizm_social_one + dummy_area + 
                dummy_refurb_new + dummy_hnd_webcap + dummy_marital + dummy_ethnic + 
                dummy_car_buy + dummy_csa , family=binomial)   
summary(myresult)

predicted <- myresult$fitted.values
predicted
predbkt<-ifelse(predicted>0.5,1,0)
table(predbkt,train$churn)

# Confusion Matrix  # to find the accuracy

(34432+62)/(34432+10716+62+94)

library(ROCR)

pred<-prediction(predicted,train$churn)

perf <- performance(pred,"acc")

perf<-performance(pred,"tpr","fpr") #tpr=TP/P fpr=FP/N
plot(perf,col="red")

abline(0,1, lty = 8, col = "blue")

auc<-performance(pred,"auc")
auc
auc<-unlist(slot(auc,"y.values"))
auc



