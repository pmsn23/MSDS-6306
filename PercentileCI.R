# Percentile CI from normal distribution
x=rnorm(50,22,5)
sem<-sd(x)/sqrt(50)
sampvar<-var(x)

bootnorm<-numeric(1000)
for (i in 1:1000){
  bootsamp<-sample(x,size=50,replace=TRUE)
  bootnorm[i]<-mean(bootsamp)
  bootvar[i]<-var(bootsamp)
}
quantile(bootnorm,c(0.025,0.975))
quantile(bootvar,c(0.025,0.975))
library(boot)
mymean<-function(d,i) mean(d[i])
myboot<-boot(x,mymean, R=1000)
boot.ci(myboot, type=c("perc","bca"))