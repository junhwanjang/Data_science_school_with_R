############################################
### 수업내용 : 데이터의 형태             ###
### 작성자 : Junhwan Jang                ###
### 작성일자 : 2017년 7월 17일(월)       ###
############################################

## 1. 벡터 ( Vector ) ****
## 2. 요인 ( Factor )
## 3. 행렬 ( Matrix )
## 4. 배열 ( Array )
## 5. 데이터 프레임 (Data.F) ****
## 6. 리스트 (List)
## 7. 데이터 테이블 (Data.Table)
## 8. 시계열(Time Series)

#############
## I. 벡터 ##
#############

## 하나 이상의 값( 원소: element )
## 하나의 열(column) 로 되어 있음
## 하나의 데이터 유형만 가짐

## 1. 벡터를 생성하는 방법
## (1) c(원소1, 원소2, 원소3, ...)
## c : combine, concatenate 의 약자
## numeric, character, logical 벡터를 만들 수 있음
## 원소들 간의 규칙이 없을 때에 사용함
age = c(29, 21, 25, 24, 27)
mode(age)
is.numeric(age)

gender = c("female", "male", "male", "female", "male")
mode(gender)
is.character(gender)

marry = c(FALSE, FALSE, TRUE)
marry

v1 = c(1, "Lee", FALSE)
v1
## character 가 가장 우선순위에 있음!!!

v2 = c(1, TRUE)
v2
## ==> 데이터 유형의 우선순위 : character > numeric > logical

v1 = c(7, 36, 96)
v2 = c(8, 18, 28, 38)
c(v1, v2)

## (2) : (콜론)
## numeric vector에만 적용됨
## 1씩 증가되는 숫자나 또는 1씩 감소되는 숫자로
## 이루어진 벡터를 생성함
## 규칙이 있는 숫자들

## start:end
## start < end : 1씩 증가함
## start > end : 1씩 감소함
## start = end : start or end

## start부터 시작해서 end를 넘지 않을 때까지
## 1씩 증가 또는 1씩 감소

1:5
5:1
-2.3:1

## (3) seq(from=, to=, by=)
## seq : sequence의 약자
## numeric vector에만 적용됨
## :의 확장

## from, to, by : arguments
## from : start
## to : end
## by : 증가 또는 감소의 폭

seq(from=1, to=5, by=0.1)

## 문제2
## 5부터 시작해서 1을 넘지 않을 때까지
## 0.1씩 감소하는 벡터를 생성하시오.
seq(from=5, to=1, by=-0.1)

seq(from=6, to=1, by=-0.5)

## (4) sequence(숫자)
## numeric vector에만 적용됨
## 1 ~ '숫자' 사이의 정수로 이루어진 벡터
sequence(3.7)

## (5) rep(vector, times=, each=)
## numeric, character, logical vector 에 적용됨
## rep : replicate의 약자

rep(1, times=10)
rep(1, each=10)

rep(1:2, times=10)
rep(1:2, each=10)
## ==> 집단에 대한 표시 (라벨링)을 할 경우 사용됨

## 문제3
## "남자" 10개, "여자" 10개를
## 가지는 벡터를 생성하시오

rep(c("남자", "여자"), each=10)


## quiz
## "패캠" 10개, "데사스R" 10개를
## 가지는 벡터를 생성하시오

rep(c("패캠", "데사스R"), each=5)
rep(c("Fast", "캠퍼스"), times=10)































