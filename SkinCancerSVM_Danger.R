library(reticulate)
library(tensorflow)
library(utils)
library(keras)
library(EBImage)
library(stringr)
library(pbapply)
library(dplyr)
library(randomForest)
library(caret)
library(e1071)
library(splitstackshape)
library(reticulate)

# Pull in relevant data
data=read.csv('hmnist_28_28_RGB.csv')
meta=read.csv('HAM10000_metadata.csv')

# Turn data binary for melanoma
data$label[which(data$label!=6)]=0
data$label[which(data$label==6)]=1
data$label=as.factor(data$label)
w=which(data$label==1)
tr_i=sample(w, round(length(w)*0.7))
ts_i=setdiff(w, tr_i)
nd=filter(data, label!=1)
train=rbind(nd[1:2000, ], data[tr_i, ])
test=rbind(nd[2001:2500, ], data[ts_i, ])

# # Tune One Class SVM
# nu=seq(0.1, 1, 0.1)
# prec_one=vector(length=length(nu))
# for (i in 1:length(nu)){
#   s=svm(x=train[, 1:(ncol(train)-1)], y=NULL, type='one-classification', 
#         kernel='radial', nu=nu[i])
#   p=predict(s, test[, 1:(ncol(data)-1)])
#   c=confusionMatrix(test$label, as.factor(p*1))
#   prec_one[i]=c$table[2, 2]/sum(c$table[2, ])
#   print(i)
# }
# 
# # Tune Nu-Classification SVM
# prec_nu=vector(length=length(nu))
# for (i in 1:length(nu)){
#   sn=svm(formula=label~., data=train, type='nu-classification', nu=nu[i])
#   pn=predict(sn, test[, 1:(ncol(data)-1)])
#   cn=confusionMatrix(test$label, pn)
#   prec_nu[i]=cn$table[2, 2]/sum(cn$table[2, ])
#   print(i)
# }

# Test succesful models
s=svm(x=train[, 1:(ncol(train)-1)], y=NULL, type='one-classification', 
      kernel='radial', nu=0.2)
p=predict(s, test[, 1:(ncol(data)-1)])
c=confusionMatrix(test$label, as.factor(p*1))

sn=svm(formula=label~., data=train, type='nu-classification', kernel='radial',
       nu=0.01)
pn=predict(sn, test[, 1:(ncol(data)-1)])
cn=confusionMatrix(test$label, pn)

# Pull in predictions and evaluate with surface model
e=data.frame(One_Class_Pred=p*1, Nu_Class_Pred=pn, 
             Ground_Truth=test$label)
l=glm(Ground_Truth~., family=binomial(link='logit'), data=e)
e=data.frame(Image_ID=meta$image_id[c(ts_i, 2001:2500)], One_Class_Pred=p*1, 
             Nu_Class_Pred=pn, 
             Logit_Fit=ifelse(l$fitted.values>0.5, 1, 0),
             Ground_Truth=test$label)

# # Nu classification for all categories (tune and fit)
# set.seed(100)
# data=read.csv('hmnist_28_28_RGB.csv')
# tr=sample(1:nrow(data), round(nrow(data)*0.7))
# ts=setdiff(1:nrow(data), tr)
# data$label=as.factor(data$label)
# train=data[tr, ]
# test=data[ts, ]

# Run model for all categories
snm=svm(formula=label~., data=train)
pnm=predict(snm, test[, 1:(ncol(data)-1)])
cnm=confusionMatrix(test$label, pnm)
allcat_data=data.frame(Image_ID=meta$image_id[ts], Multi__Class_Pred=pnm,
                       Ground_Truth=test$label)




