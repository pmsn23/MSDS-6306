# Simple Normal Distribution;
x<-rnorm(50, 22, 5)
xbar <- mean(x)
nsims<-1000
bootnorm<-numeric(nsims)
for (i in 1:nsims){
  temp<-sample(x, 50, replace=TRUE)
  bootnorm[i]<-mean(temp)
}
summary(bootnorm)
hist(bootnorm)
abline(v=xbar,col="red",lwd=2)
abline(v=mean(bootnorm),col="blue",lwd=2, lty=2)
abline(v=22,col="green",lwd=3, lty=3)
sd(x)
sd(bootnorm)
est.bias<-xbar-mean(bootnorm)
