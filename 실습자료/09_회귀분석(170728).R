#####################################################
### 수업내용 : 차이검정                           ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 28일(금)                ###
#####################################################

# 상관관계분석
x <- c(170, 172, 162, 164, 171, 176, 160,165,174,172)
y <- c(70,74, 65, 68, 72, 74, 61, 66, 76, 75)
plot(x, y,  xlab="키", ylab="몸무게", pch=19,
     col="black", bg="yellow", cex=1.5 )
cor.test(x,y,method="pearson")  


data(mtcars)
mtcars
car_Cor<-cor(mtcars)
round(car_Cor, 2)
pairs(car_Cor, pch=19, bg=c("red", "green", "blue"))  # 행렬 산점도

install.packages("corrplot")
library(corrplot)
corrplot(car_Cor)  
# 상관원계수가 클수록 크기가 크고 색깔이 진하다
# 양수면 파란색, 음수면 붉은색
corrplot(car_Cor, method="number") # 수와 색깔로 표현
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_Cor, 
         method="color",   # 색깔로 표현
         col=col(200),     # 색상 200개 선정
         type="lower",     # 왼쪽 아래 행렬만 표기
         order="hclust",   # 유사한 상관계수끼리 군집화
         addCoef.col="blank", # 상관계수 색깔
         t1.col="blank",   # 변수명 색깔  
         t1.srt=45,        # 변수명 45도 기울임
         diag=F)           # 대각행렬 제외

# Refression
setwd("D:/BD_R_Test") # 실습 디렉토리 설정
R1=read.csv("Regression_Data.csv")
names(R1)
RgFit<-lm(Y ~ X, data=R1) # 단순회귀식
summary(RgFit) #회귀계수와 R-square, F값 표시
coefficients(RgFit) # model coefficients
confint(RgFit, level=0.95) # 모델에서 적합된 회귀계수의95% 신뢰구간(CI) 표기 
fitted(RgFit) # 예측된 값 표시
residuals(RgFit) # 잔차
deviance(RgFit)
anova(RgFit) # anova table 
vcov(RgFit) # covariance matrix for model parameters 
influence(RgFit) # regression diagnostics

# diagnostic plots 
# Error in plot.new() : figure margins too large error 
graphics.off()
par("mar")
par(mar=c(1,1,1,1))
#
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(RgFit)
plot(RgFit, which=c(4,6)) 
# residuals vs Fitted : 선형회귀는 오차평균 0, 분산일정가정하므로 기울기 0인 직성이 이상적 
# Sclae -location : 기울기가 0인 직선이 이상적
# nornal Q-Q : 잔아의 정규분포를 따르는지 검정
# Residuals vs Leverage : 
# leverage (지렛점-성멸병수가 얼마나 극단적으로 치우치는지 보여줌)
# 빨간 점 : Cook Distance 영향점 을 의미함

#회귀직선의 시각화
plot(Y~X, data=R1) # X축 Y축 표
abline(coef(RgFit)) # 예측회귀선 표기


#다중회귀분석

RgFit2<-lm(Y ~ X1+X2, data=R1) 
summary(RgFit2) #회귀계수와 R-square, F값 표시
coefficients(RgFit2) # model coefficients
confint(RgFit2, level=0.95) # 모델에서 적합된 회귀계수의95% 신뢰구간(CI) 표기 
fitted(RgFit2) # 예측된 값 표시
residuals(RgFit2) # 잔차
deviance(RgFit2)
anova(RgFit2) # anova table 
vcov(RgFit2) # covariance matrix for model parameters 
influence(RgFit2) # regression diagnostics


# beta표기
install.packages("lm.beta")
library(lm.beta)
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
# standardize
lm.D9.beta <- lm.beta(lm.D9)
print(lm.D9.beta)
summary(lm.D9.beta)
coef(lm.D9.beta)

RgFit2<-lm(Y ~ X1+X2, data=R1) 
RgFit2.beta <- lm.beta(RgFit2)
print(RgFit2.beta)
summary(RgFit2.beta) #회귀계수와 R-square, F값 표시


# 자료변환 I()사용

x<-1:1000
x
y<-x^2+3*x+5+rnorm(1000)
y
lm(y~I(x^2)+x)

x<-101:200
y<-exp(3*x+rnorm(100))
lm(log(y)~x)


x<-101:200
y<-log(x)+rnorm(100)
lm(y~log(x))


x1<-1:10000
x2<-3*x1
y<-3*(x1+x2)+rnorm(1000)
lm(y~x1+x2)

# 변수선택법

install.packages("mlbench")
library(mlbench)
data(BostonHousing)
m<-lm(medv~., data=BostonHousing)
m2<-step(m, directory="both")
formula(m2)  # 최종모형 선택
m3<-step(m, directory="forward")
formula(m3) # 최종모형 선택
m4<-step(m, directory="backward")
formula(m4) # 최종모형 선택


# 다중공선성

R2=read.csv("Regression_Data.csv")
names(R2)
RgFit2<-lm(Y ~ X1+X2, data=R2) # 다중회귀식
install.packages("car")
library(car)
vif(RgFit2)  # 10이상이면 다중공선성이 있다고 판단
sqrt(vif(RgFit2)) > 2 # problem?


# Assume that we are fitting a multiple linear regression
# on the MTCARS data
install.packages("car")
data(mtcars)
library(car)
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

# Assessing Outliers
rstudent(fit) # 외면 스튜던터 잔차 표기 
outlierTest(fit) # Bonferonni p-value for most extreme obs
qqPlot(fit, main="QQ Plot") #qq plot for studentized resid 
leveragePlots(fit) # leverage plots

# Cook's D plot
# identify D values > 4/(n-k-1) 
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)

# Influence Plot 
influencePlot(fit,	id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )
