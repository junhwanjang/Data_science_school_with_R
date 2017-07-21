#####################################################
### 수업내용 : 기초데이터 분석                    ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 20일(목) ~ 21일(금)     ###
#####################################################

## 예제 데이터 : hflights::hflights
options(repos = "https://cran.rstudio.com")
install.packages("hflights")
install.packages("DT")
install.packages("prettyR")
install.packages("psych")
library(hflights)
library(DT)
library(prettyR)
library(psych)

## 데이터 일부보기
DT::datatable(head(hflights))


## 자료의 종류 : 통계적인 관점
## 질적 자료 vs 양적 자료

## 질적 자료 : 글자(문자) , 숫자 x
## 기준 : 숫자가 의미가 있는가?
## 양적 자료 : 숫자 o


###############################################
### I. 일변량(Uni-variate) 질적 자료의 분석 ###
###############################################

## prettyR::freq() ==> 일변량 분석시 유용한 패키지!

## 1. 표 = 빈도표 : 빈도(frequency), 백분율(percent)
## (1) 빈도 : table(데이터명$변수명)
table(hflights$Month)
sort(table(hflights$Month), decreasing = TRUE)


## (2) 백분율 = (빈도/합계)*100
## prop.table(빈도결과)*100
prop.table(table(hflights$Month))*100
x = sort(prop.table(table(hflights$Month))*100, decreasing = TRUE)
round(x, digits = 1)

month.table = cbind(freq = sort(table(hflights$Month), decreasing = TRUE),
                    percent = round(x, digits = 1))
                    
DT::datatable(month.table)

## month.table 데이터를 csv로 저장하기
## write.csv(R데이터, file="파일위치/파일명.csv")
write.csv(month.table, file = "./sample_data/month.csv")

## 문제4
## Dest의 현황의 빈도를 내림차순으로 정렬하고,
## csv 파일로 저장하세요.

frequency = table(hflights$Dest)
sort(frequency, decreasing = TRUE)

prob = prop.table(frequency)*100
sort(prob)
round(sort(prob), digits = 1)

dest.table = cbind(freq = sort(frequency, decreasing = TRUE),
                    percent = round(sort(prob), digits = 1))

DT::datatable(dest.table)
write.csv(dest.table, file = "./sample_data/dest.csv")

prettyR::freq(hflights$Month,
              display.na = FALSE,
              decr.order = FALSE)
## % : NA를 포함하여 계산된 백분율
## %!NA : NA를 제외하고 계산된 백분율


## 2. 그래프 : 막대그래프(세로, 가로), 원그래프
## (1) 막대그래프 : barplot(빈도결과)
barplot(sort(table(hflights$Month), decreasing = TRUE))

## 막대 색깔 : col="color명"
barplot(sort(table(hflights$Month), decreasing = TRUE),
        col = "gray")

## 제목: main="제목명"
barplot(sort(table(hflights$Month), decreasing = TRUE),
        col = "gray",
        main = "월별 운행현황")

## y축 제목: ylab="축 제목"
## ylab : y label의 약자
barplot(sort(table(hflights$Month), decreasing = TRUE),
        col = "gray",
        main = "월별 운행현황",
        ylab = "운항횟수")

## y축 눈금: ylab=c(최소값, 최대값)
## ylim : y limit의 약자
barplot(sort(table(hflights$Month), decreasing = TRUE),
        col = "gray",
        main = "월별 운행현황",
        ylab = "운항횟수",
        ylim = c(0, 25000))

## 가로막대 변환: horiz=TRUE
## horiz : horizontal의 약자
barplot(sort(table(hflights$Month), decreasing = FALSE),
        col = "gray",
        main = "월별 운행현황",
        xlab = "운항횟수",
        xlim = c(0, 25000),
        horiz = TRUE)

## (2) 원그래프: pie(빈도)
pie(sort(table(hflights$Month), decreasing = FALSE))

## 반지름 : radius=0.8
pie(sort(table(hflights$Month), decreasing = FALSE), radius = 1)

## 첫째 조각의 각도 : init.angle=
pie(sort(table(hflights$Month), decreasing = FALSE), 
    radius = 1,
    init.angle = 90)

## 7/21(금)

## 그래픽 패키지: ggplot2, lattice, plotly ... , googleVis, ggmap

################################################
### II. 일변량(Uni-variate) 양적 자료의 분석 ###
################################################

## <구간의 갯수 결정법>
## i. sturge's formula (1 + 3.3 log N) ; N은 데이터 갯수
## ii. 루트 N

## <구간의 범위 지정>
## i. 최대값 - 최소값 = 범위
## ii. 범위 / 구간의 갯수 = 구간의 폭, 계급의 폭
## iii. 첫번째구간의 경우: 최소값이 포함되도록 조정
##      마지막구간의 경우: 최대값이 포함되도록 조정


## 1. 표 = 빈도표(구간의 빈도, 백분율)
DT::datatable(head(hflights))

ArrDelay.range = range(hflights$ArrDelay, na.rm = TRUE)

## 구간의 개수
interval.count = 1 + 3.3*log10(length(hflights$ArrDelay))

## sqrt() ; square root
sqrt(length(hflights$ArrDelay))

## 구간의 폭 = 계급의 폭
diff(ArrDelay.range / interval.count)


hflights$ArrDelay.group = cut(hflights$ArrDelay,
                              breaks = seq(from=-120, to=1020, by=60),
                              right = FALSE)
## ==> 양적 자료를 질적 자료로 변환 완료!

table(hflights$ArrDelay.group)
prop.table(table(hflights$ArrDelay.group))



## 2. 그래프 : 히스토그램(Histogram), 상자그림(Box plot)
## (1) 히스토그램
## i. hist(데이터명$변수명) : Sturge 공식 적용
hist(hflights$ArrDelay)

## ii. hist(데이터명$변수명, breaks=구간의 개수)
hist(hflights$ArrDelay, breaks = 50)

## iii. hist(데이터명$변수명, breaks=구간의 정보)
hist(hflights$ArrDelay, 
     breaks = seq(from=-120, to=1020, by=60),
     xlim = c(-120, 1020))


## (2) 상자그림 (Box Plot) : 이상치 유무 판단에 용이
## i. boxplot(데이터명$변수명)
boxplot(hflights$ArrDelay)

money = c(40, 50, 50, 50, 40, 50, 40, 70, 30, 40,
          50, 60, 250)

money2 = c(40, 50, 50, 50, 40, 50, 40, 40, 30, 40,
           50, 60, 25)
boxplot(money) ## 원이 있다면 이상치가 존재한다고 해석
boxplot(money2) ## 원이 없다면 이상치가 존재하지 않는다고 해석

## ii.  집단별 상자그림
## boxplot(데이터명$변수명 ~ 데이터명$변수명)
## boxplot(양적 자료 ~ 질적 자료)
boxplot(hflights$ArrDelay ~ hflights$Origin)
boxplot(hflights$ArrDelay ~ hflights$Month)


## 3. 기술통계량 = 요약통계량 = 숫자
## Descriptive Statistics = Summary Statistics

## 모수 (Parameter) vs 통계량 (Statistics)
## 모집단 (Population) vs 표본 (Sample)
## ==> 표본에서 추출된 결과임!


## (1) 중심 = 대표값
## 평균, 절사평균; 이상치를 제거하고 대표값을 찾음, 중위수(중앙값), 최빈수(최빈값)

## i. 평균 : mean(데이터명$변수명, (opt)na.rm = TRUE)
mean(hflights$ArrDelay, na.rm = TRUE)
## ==> 이상치가 있기 때문에 섣불리 판단하면 안됨

## ii. 절사평균(Trimmed mean) 
## mean(데이터명$변수명, trim=0.05, na.rm=TRUE)
mean(hflights$ArrDelay, trim = 0.01, na.rm = TRUE)

## iii. 중위수 : median(데이터명$변수명, na.rm=TRUE)
median(hflights$ArrDelay, na.rm = TRUE)

## iv. 최빈수(mode)
## which.max(table(데이터명$변수명))
which.max(c(10, 5, 3, 200))
which.max(table(hflights$ArrDelay)) # -4가 54번으로 가장 많았다는 의미

## prettyR::Mode()
prettyR::Mode(hflights$ArrDelay)


## (2) 퍼짐 = 산포 = 다름
## 범위, 사분위범위(사분위수범위), 분산, 표준편차, 중위수 절대 편차

## i. 범위(Range)
range(hflights$ArrDelay, na.rm = TRUE)
diff(range(hflights$ArrDelay, na.rm = TRUE))

## ii. 사분위범위 = 사분위수범위(IQR) ; Inter Quartile Range
## IGQ(데이터명$변수명)
IQR(hflights$ArrDelay, na.rm = TRUE)

## iii. (표본) 분산(Variance)
## var(데이터명$변수명, na.rm=TRUE)
var(hflights$ArrDelay, na.rm = TRUE)

## iv. (표본)표준편자 (SD : Standard Deviation)
## sd(데이터명$변수명, na.rm=TRUE)
sd(hflights$ArrDelay, na.rm = TRUE)

## v. 중위수 절대 편차 (MAD : Median Absolute Deviation)
## mad(데이터명$변수명, na.rm=TRUE)

## ex> 1, 2, 3, 5, 7, 8, 1000
## 1) 중위수 : 5
## 2) 데이터 - 중위수 : 편차 ==> -4, -3, -2, 0, 2, 3, 995
## 3) (2) 결과의 절대값 ==> 4, 3, 2, 0, 2, 3, 995
## 4) (3) 의 중위수 ==> 3
## ==> 대략적으로 5-3과 5+3 범위의 데이터를 가지고 있다고 해석

mad(hflights$ArrDelay, na.rm = TRUE)



## 3. 분포의 모양
## i. 왜도 (Skewness) : 대칭여부 (0 ; 대칭 / 양수 ; 비대칭(큰값이 존재하여 좌편향) / 
##                                음수 ; 비대칭(작은값이 존재하여 우편향))

## ii. 첨도 (Kurtosis) : 중심 ( 0 ; 중심이 보통 / 양수 ; 비슷한 데이터가 많음 / 
##                              음수 ; 비슷한 데이터가 적음)
## R의 기본 기능에서는 구하지 못함.
## psych::describe(), describeBy()

psych::describe(hflights$ArrDelay)
## se: standard error ==> 다른 표본의 경우 얼마나 차이가 나는지 알려주는 값

## psych::describeBy(데이터명$변수명, 데이터명$변수명)
## psych::describeBy(양적 자료, 질적 자료)
psych::describeBy(hflights$ArrDelay, hflights$Origin)


## summary(데이터명$변수명)
summary(hflights$Month)
hflights$Month = as.factor(hflights$Month)
summary(hflights$Month)

summary(hflights$ArrDelay)

## summary(데이터명)
summary(hflights)

## by(양적 자료, 질적 자료, 함수명)
## 양적자료를 질적자료(그룹)으로 묶어서 특정 함수를 실행한다
by(hflights$ArrDelay, hflights$Origin, mean, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, sd, na.rm = TRUE)

## <() ; 괄호의 역할>
## 실행되고, 결과도 출력하라는 의미
x = 3
x

(x=3)






















