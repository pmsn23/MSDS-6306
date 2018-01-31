# Parametric Bootstrap for location scale families;
# Investigating bootstarp CIs when the population is normally distributed
# mean = 22 & SD = 5
x<-rnorm(50,22,5)
# Find the traditional t-interval
xbar<-mean(x)
sem<-sd(x)/sqrt(50)
sampvar<-var(x)
bootnorm<-numeric(1000)
# Fund the pivot t-interval
for (i in 1:1000){
  bootsamp<-sample(x,size=50,replace=TRUE)
  bootmean=mean(bootsamp)
  bootsd=sd(bootsamp)
  tpviot=(bootmean-xbar)/(bootsd/sqrt(50))
  bootnorm[i]<-tpviot
}
quant<-quantile(bootnorm,c(0.025,0.975))
lowend<-xbar - quant[2]*sem
upend<-xbar - quant[1]*sem
# Pivot for the Standard Deviation
bootvar<-numeric(1000)
for (i in 1:1000){
  bootsamp<-sample(x,size=50,replace=TRUE)
  bootv<-var(bootsamp)
  chipivot<-(49*bootv)/sampvar
  bootvar[i]<-chipivot
}
quant<-quantile(bootvar,c(0.025,0.975))
lowend<-(49*sampvar)/ quant[2]
upend<-(49*sampvar)/quant[1]

# Clearning memory for bootnorm and bootvar
bootnorm <- numeric(1000)
bootvar <- numeric(1000)