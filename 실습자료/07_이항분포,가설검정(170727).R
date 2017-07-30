#####################################################
### 수업내용 : 이항분포, 가설검정                 ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 27일(목)                ###
#####################################################


# 이항분포 계산
# B(n, p)
# dbinom(x, n, p) : 이항확률밀도함수 pbinom(x, n, p) : 누적확률함수
x<-seq(0, 10)
win.graph()
plot(x, dbinom(x, 10, 0.2), type="h", ylab="P(X=x)", lwd=5)  # lwd 선두 type=h histogram-like vertical lines
win.graph()
plot(x, dbinom(x, 10, 0.5), type="h", ylab="P(X=x)", lwd=5)
win.graph()
plot(x, dbinom(x, 10, 0.8), type="h", ylab="P(X=x)", lwd=5)


# 이항분포의 정규분포근사
n1=5; n2=10; n3=20; n4=30
x<-seq(0,10)
plot(x, dbinom(x, n1, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T) #   이전에 실행한 그래프에 겹쳐서 
plot(x, dbinom(x, n2, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n3, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n4, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")

# x~B(50, 0.4), p(X>=25)
x<-seq(0, 50)
plot(x, dbinom(x, 50, 0.4), type="h", xlab="", ylab="")
par(new=T)
lines(x, dnorm(x, 20, sqrt(12)), col="red") # np=50*0.4=20, npq=50*0.4*0.6=12



# 가설검정 문제
xbar<-66; n<-25
z<-(xbar-60)/(15/sqrt(25))
z #  2
1-pnorm(z) # 0.02275013

# 표본의 수가 적은 관계로 t검정 사용
# t.test(x,y=NULL, alternative=c("two-sided", "less", "greater"), mu=0)
x<-c(65, 70, 60, 55, 75, 65, 55, 60, 70, 60)
t.test(x, alternative="greater", mu=60)
#
#
#One Sample t-test
#
#data:  x
#t = -16.813, df = 50, p-value = 1
#alternative hypothesis: true mean is greater than 60
#95 percent confidence interval:
#  21.51133      Inf
#sample estimates:
#  mean of x 
#    25 
#

#유의확률 계산
n<-length(x)
t<-(mean(x)-60)/(sd(x)/sqrt(n))
t  # 1.655032
1-pt(t, df=n-1) #  0.06615148

##
x<-c(3.4, 3.3, 4.2, 4.4, 3.7, 4.5, 4.6, 3.8, 4.1)
t.test(x, alternative="two.sided", mu=3.5)


#One Sample t-test
#
#data:  x
#t = 3.1623, df = 8, p-value = 0.01335
#alternative hypothesis: true mean is not equal to 3.5
#95 percent confidence interval:
#  3.635389 4.364611
#sample estimates:
#  mean of x 
#   4 


n<-length(x)
t<-abs((mean(x)-3.5)/(sd(x)/sqrt(n)))
t   # 3.162278
2*(1-pt(t, df=n-1))  #0.01334906


# 

xbar<-19; n<-36; s<-3.4
z<-(xbar-20)/(s/sqrt(n)) 
z #  -1.764706
pnorm(z) # 0.0388066

# 모비율검정 함수
# prop.test(x, n, p, alternative=c("two-sided", "less", "greater"))
#prop.test(x=6, n=200, alternative="less")
#
#1-sample proportions test with continuity correction
#
#data:  6 out of 200, null probability 0.5
#X-squared = 174.84, df = 1, p-value < 2.2e-16
#alternative hypothesis: true p is less than 0.5
#95 percent confidence interval:
#  0.00000000 0.06015521
#sample estimates:
#  p 
#  0.03 
p<-0.032; n<-200
phat=0.03
var=p*(1-p)/n
z<-(phat-p)/sqrt(var)
z  # -0.1607061
pnorm(z) # 0.4361624
