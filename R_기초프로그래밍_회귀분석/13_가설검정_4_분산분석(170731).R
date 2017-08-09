################################################################
### 수업내용 : 독립k표본 검정(Independent k samples test)    ###
### 작성자 : Junhwan Jang                                    ###
### 작성일자 : 2017년 7월 31일(월)                           ###
################################################################

install.packages("nparcomp") # 비모수에서 다중 비교 지원
library(nparcomp)

## 3개 이상의 모집단의 평균이 다른지를 통계적으로 검정하는 방법
## 독립k표본 검정 또는 분산분석이라 부름.

## 귀무가설 : 살충제의 종류(6가지)에 따라 살충 효과는 없다. (mu1 = mu2 ... = mu6)
## 대립가설 : 살충제의 종류에 따라 살충효과가 있다.

## 예제 데이터 : InsectSprays
## 변수명      : count, spray

## 1단계: 정규성검정
by(InsectSprays$count, InsectSprays$spray, shapiro.test)

## ==> c / d 가 깨져서 비모수 검정으로 가야함.

## 결론: 정규성 가정이 깨짐

## 2단계: Kruskal-Wallis rank sum test
## kruska.test(데이터$변수명 ~ 데이터명$변수명)
## kruska.test(양적자료 ~ 질적자료)
kruskal.test(InsectSprays$count ~ InsectSprays$spray)

## 결론 : 유의확률이 0.000 이므로 유의수준 0.05에서
## 살충제의 종류에 따라 통계적으로 유의한
## 살충 효과가 있는 것으로 나타났다.

## 3단계 : 다중비교(Multiple Comparisons)
##        = 사후분석(Post-Hoc)
## nparcomp::nparcomp(변수명 ~ 변수명, type="Tukey", data=데이터명)
nparcomp::nparcomp(count ~ spray, type = "Tukey", data = InsectSprays)
## ==> $Analysis 에서 각각을 비교하여 차이가 있는지 없는지 보여줌.



## 만약에 정규성 가정이 만족되었다면
## 2단계: 분산분석 (ANOVA : Analysis of variance)
## 분산분석결과 = aov(변수명 ~ 변수명, data=데이터명)
## summary(분산분석결과)
anova.result = aov(count ~ spray, data=InsectSprays)
summary(anova.result)

## 결론: 대립가설이다. 집단간의 유의한 차이가 있다.


## 만약에 정규성 가정이 만족이 되고,
## 집단간에 차이가 있다고 결론이 나면
## 3단계 : 다중비교 = 사후비교
## TukeyHSD(분산분석결과)
TukeyHSD(anova.result)
















