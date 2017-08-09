############################################
### 수업내용 : 기초 사용법               ###
### 작성자 : Junhwan Jang                ###
### 작성일자 : 2017년 7월 17일(월)       ###
############################################

## 1. 연산자 (Operator)
## (1) 산술 연산자 : +, -, /, *, (특이연산자) **, ^, %%, %/%
3 + 4    # 더하기
3 - 4    # 빼기
3 * 4    # 곱하기
3 / 4    # 나누기
3 ** 4   # 거듭제곱
3 ^ 4    # 거듭제곱
13 %% 4  # 나머지
13 %/% 4 # 몫(portion)

## 문제1
## 루트 3은 무엇인가요?  *** 연산자 우선순위 생각!!!
3^(1/2)

## (2) 할당 연산자 : <-(많이씀), =, -> (거의쓰지않음)
x <- 3
x
y = 4
y
5 -> z
z

## (3) 비교 연산자 : >, >=, <, <=, ==, !=, !(not)
3 > 4
3 >= 4
3 < 4
3 <= 4
3 == 4

3 != 4
!(3 == 4)
# ==> 데이터를 추출할때 주로 사용

## (4) 논리 연산자 : & ; AND , |(pipe, vertical bar) ; OR
## and ==> 두 조건이 모두 참일때 True / OR ==> 둘중의 하나가 참일 때 True 리턴

(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)
# ==> 데이터를 추출할때 주로 사용


## 2. 데이터의 유형 (Type of Data)
## (1) 수치형 (Numeric)
## (2) 문자형 (Character)
## (3) 논리형 (Logical)
x = 3
y1 = 'Love is choice'
y2 = "Love is choice"
z = TRUE


## cf) 데이터 지우기 ==> In console, rm(list=ls())

## 3. 데이터 유형 알아내기 *** 해당 함수의 리턴 값의 유형을 확인 하는 것이 중요함.
## (1) mode(데이터) ==> 유형 return ==> character 값으로 줌
mode(x)

# if(mode(x) == "numeric") 이런 형태로 작성

mode(y1)
mode(z)

## (2) is.xxxx(데이터)
is.numeric(x)
# if(is.numeric(x))
is.character(y1)
is.character(z)
is.logical(z)


## 4. 강제적으로 데이터의 유형 변환(변경) 하기
## as.xxxx(데이터)

x1 = 3
x2 = "3"
x3 = "Lee"
x4 = TRUE
as.numeric(x2)
as.numeric(x3) # character ==> numeric ; error
as.numeric(x4) # true ==> 1 / false ==> 0

as.character(x1)
as.character(x4)

as.logical(x1) # 0 ==> false / 나머지 ==> True
as.logical(x2)
as.logical(x3)




