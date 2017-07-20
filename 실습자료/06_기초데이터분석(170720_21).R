#####################################################
### 수업내용 : 기초데이터 분석                    ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 20일(목) ~ 21일(금)     ###
#####################################################

## 예제 데이터 : hflights::hflights
options(repos = "https://cran.rstudio.com")
install.packages("hflights")
install.packages("DT")
library(hflights)
library(DT)

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
