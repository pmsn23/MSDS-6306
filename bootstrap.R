x<-c(23.3,26.1,19.0,28.8,29.0)
bootsample1<-sample(x,size=length(x), replace=TRUE)
bootsample2<-sample(x,size=length(x), replace=TRUE)
bootsample3<-sample(x,size=length(x), replace=TRUE)
R<-1000
bootmean<-numeric(R)
x<-c(23.3,26.1,19.0,28.8,29.0)
se.trad<-sd(x)/sqrt(length(x))
meanVect<-mean(x)
for (i in 1:R){
  bootsample<-sample(x,size=length(x), replace=TRUE)
  bootmean[i]<-mean(bootsample)
}
StdDev<-sd(bootmean)
par(mfrow=c(1,2))
hist(bootmean)
qqnorm(bootmean)
qqline(bootmean)