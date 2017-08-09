################################################################
### 수업내용 : 상관분석 (Correlation Analysis)               ###
### 작성자 : Junhwan Jang                                    ###
### 작성일자 : 2017년 7월 31일(월)                           ###
################################################################


## 1. 산점도 (Scatter plot)
## plot(데이터명$변수명, 데이터명$변수명)  ## x축, y축
plot(cars$speed, cars$dist)


## 2. 상관계수 (Coefficient of Correlation)
## cor(데이터명$변수명, 데이터명$변수명)
cor(cars$speed, cars$dist)


## 3. 상관분석 (Correlation Analysis)
## 귀무가설 : 두 양적 자료 간의 선형의 관계가 없다.
## 대립가설 : 두 양적 자료 간의 선형의 관계가 있다.

cor.test(cars$speed, cars$dist)

## 결론 : 대립가설이다.
