data<-read.csv("Data.V7.csv")
feature<-data[1:20]
a<-cor(feature)
pca<-princomp(feature,cor=T)
pca
pca$loadings
s<-pca$sdev
s
round(s^2,4)
t<-sum(s^2)
round(s^2/t,4)
cumsum(s^2/t)
screeplot(pca,type="lines")

data1<-data[c(-21,-22)]
library(rpart)
ctree<-rpart(Change~.,data=data1,method="class")
plot(ctree,asp=2)
text(ctree,use.n=T,cex=0.6)

n<-nrow(data1)
set.seed(123456)
id<-sample(1:n,size=3000)
d1<-data1[id,]
d2<-data1[-id,]
ctree<-rpart(Change~.,data=d1,method="class")
summary(ctree)
plot(ctree,asp=2)
text(ctree,use.n=T,cex=0.6)
pr<-predict(ctree)
cl<-max.col(pr)
table(cl,d1$Change)
pr<-predict(ctree,d2)
cl<-max.col(pr)
table(cl,d2$Change)

