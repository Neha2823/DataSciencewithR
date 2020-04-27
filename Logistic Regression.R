claimants<-read.csv("c:/users/NEHA_BGL/desktop/claimants.csv")
# Linear Regression

fit=lm(ATTORNEY ~ factor(CLMSEX) + factor(CLMINSUR) + factor(SEATBELT)	
       + CLMAGE + LOSS,data=claimants)
summary(fit)

plot(fit)

# Logistic Regression

logit=glm(ATTORNEY ~ factor(CLMSEX) + factor(CLMINSUR) + factor(SEATBELT)
         + CLMAGE + LOSS,family= "binomial",data=claimants)
summary(logit)

# Odds Ratio

exp(coef(logit))

# Confusion Matrix Table

prob=predict(logit,type=c("response"),claimants)

confusion<-table(prob>0.5,claimants$ATTORNEY)
confusion
# Model Accuracy

Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy

library(pROC)
roccurve <- roc(claimants$ATTORNEY ~ prob)
plot(roccurve)
auc <- auc(claimants$ATTORNEY ~ prob)
auc
