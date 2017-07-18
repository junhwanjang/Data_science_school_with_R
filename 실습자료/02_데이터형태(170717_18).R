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

## (6) paste(벡터1, 벡터2, ..., sep=)
## 벡터의 각각의 원소들을 합쳐서 character 형태의 원소를 생성
paste(1, 1)
paste(1, 1, sep="-")
paste(1, 1, sep="")

paste("x", 1)
paste("x", 1, sep = "")

paste(1:3, 1:3) ## 원소별로 묶임 ==> 벡터화 (Vectorization)
paste(1:3, 1:3, sep = "-")

## 문제8
## "X1", "X2", "X3", "X4"를 가지는 벡터를 생성하세요.
paste("X", 1:4, sep = "") # 재사용 규칙 + 벡터화 성질 유의!


## 문제3
## "남자" 10개, "여자" 10개를
## 가지는 벡터를 생성하시오

rep(c("남자", "여자"), each=10)


## quiz
## "패캠" 10개, "데사스R" 10개를
## 가지는 벡터를 생성하시오

rep(c("패캠", "데사스R"), each=5)
rep(c("Fast", "캠퍼스"), times=10)

############################################
### 수업내용 : 데이터의 형태             ###
### 작성자 : Junhwan Jang                ###
### 작성일자 : 2017년 7월 18일(화)       ###
############################################

##############
## I. 벡터  ##
##############

## c, :, seq ==> 무조건적으로 중요함
## c ==> 규칙이 없는 경우 사용
## : ==> 연속적인 수를 다룰 경우 사용
## seq ==> 동일한 간격의 수를 다룰 경우 사용

rep(1:3, times=5, each=10)
## ==> each 인자가 우선 작동이 된 후, times 인자가 작동됨

## 문제4
## 1이 100개, 그 다음에 2가 50개, 그 다음에 3이 13개를 갖는
## 벡터를 생성하시오

# Case 1
c(rep(1, times=100), rep(2, times=50), rep(3, times=13))

# Case 2 ==> 이게 더 좋은 코드!
rep(1:3, times=c(100, 50, 13))


## 2. 벡터의 속성
## (1) length(벡터) : 벡터가 가지는 원소의 갯수
age = c(26, 27, 25)
length(age)

## (2) names(벡터) : 원소의 이름
names(age)

## <NA와 NULL 의 구분>
## NA : Not available ==> "Missing Value" (결측치, 결측값)
## NULL : 객체, 개체 (Object) ==> 데이터, 그래프, 분석된 결과 라고 함.
## ==> NULL은 객체가 없는 것을 말함.

names(age) = c("Ha", "Jeong", "Kim")
# character vector 를 리턴함
age

names(age) = NULL
age

## 3. 벡터의 슬라이싱(Slicing) = 인덱싱(Indexing)
## 벡터 중에서 일부의 원소(들)을 추출
## 벡터[index]
## R은 index가 1부터 시작함
income = c(500, 1000, 3500, 400, 300)
income[1]
income[2]
income[3]
income[4]
income[5]
income[6]
income[1:5]
income[1:length(income)]

## 문제5
## 1, 4, 5번째의 원소를 한번에 가져오세요
income[c(1, 4, 5)]

## 문제6
## 2~5번째의 원소를 한번에 가져오세요
income[2:5]

## 문제7
## 홀수 번째의 원소들을 한번에 가져오세요.
income[seq(from=1, to=length(income), by=2)] ## Best answer


## 4. 벡터의 연산 : +, -, *, /, **, ^, %%, %/%
v1 = 1:3
v2 = 4:6

v3 = v1 + v2
v3

v3 = 1:6
v1 + v3
## ==> R의 중요한 특성은 연산시 다른 변수와 연산하기 위해 길이를 맞추어 계산됨
## 재사용규칙 (Recycling Rule)

v4 = 1:7
v1 + v4
## ==> warning message 발생 (결과에 문제가 있지 않을까요?)


###############
## II. 요인  ##
###############

## 벡터의 일종
## 집단(Group)으로 인식함
## 1차원

## 1. factor(벡터, labels=, levels=, ordered=)
bt = c("ab", "ab", "a", "a", "b")
bt
## R에서 이름을 지정하는 방법 (ex> bt.factor, bt_factor, btFactor)
bt.factor = factor(bt)
bt.factor

bt.factor2 = factor(bt, labels = c("A형", "AB형", "B형"))
bt.factor2
## ==> 다른 형태로 표현하기 위함

bt.factor3 = factor(bt, levels = c("b", "ab", "a"))
bt.factor3
## ==> 집단의 순서를 정의하기 위함

bt.factor4 = factor(bt, levels = c("b", "ab", "a"), 
                    labels = c("B형", "AB형", "A형"))
bt.factor4
## ==> levels 에 맞게 labels 를 지정해주어야함

bt.factor5 = factor(bt, levels = c("b", "ab", "a"), 
                    labels = c("B형", "AB형", "A형"),
                    ordered = TRUE)
bt.factor5
## ==> 순위를 지정해주기 위함
## cf) shift+enter ==> 긴코드를 직관적으로 표현해주기 위해 자동으로 맞추어줌


## factor의 속성 
## (1) levels(요인)
levels(bt.factor)

## (2) ordered(요인) : 집단의 순서가 의미 있도록 변경


################
## III. 행렬  ##
################

## 행(row)과 열(column)로 구성되어 있음
## 2차원
## 벡터의 확장
## 데이터의 유형을 하나만 가짐

## 1. 행렬을 만드는 방법
## (1) rbind(벡터1, 벡터2, ...), cbind(벡터1, 벡터2, ...)
v1 = 1:3
v2 = 4:6
M1 = rbind(v1, v2)
M1

M2 = cbind(v1, v2)
M2

v3 = 1:6
M3 = cbind(v1, v2, v3)

## (2) matrix(벡터, nrow=, ncol=, byrow=)
matrix(1:4, nrow=2, ncol=2) ## R은 열이 우선순위를 가짐
matrix(1:4, nrow=2, byrow = TRUE) ## 행을 우선으로 함.

## 2. 행렬의 슬라이싱
## 행렬[ 행 index, 열 index ]
M1[1 , ]
M1[1:2 , ]
M1[ , 1]

## 3. 행렬의 덧셈과 뺄셈
A = matrix(1:4, nrow=2, ncol=2)
B = matrix(5:8, nrow=2, ncol=2)
A + B
A - B

## 4. 행렬의 곱셈 : A %*% B
## 조건 : c1 = r2 ==> 곱셈가능
## 최종 곱셈 결과 : r1 by c2 matrix
A %*% B
B %*% A

## 문제9
## 1 3 와 5
## 2 4    6
## 행렬의 곱을 구하세요.
A1 = matrix(1:4, nrow = 2, ncol = 2)
B1 = matrix(5:6)
A1 %*% B1

## 문제10
## 1 3 와 5 7
## 2 4    6 8
## 행렬의 곱을 구하세요.
A2 = matrix(1:4, nrow = 2, ncol = 2)
B2 = matrix(5:8, nrow = 2, ncol = 2)
A2 %*% B2

## 5. 역행렬 (Reverse Matrix)
## 조건 : 1) 정방행렬(Square Matrix) ; 행과 열의 갯수가 같은 행렬
##        2) 행렬식이 0이 아닌 경우
## solve(행렬)
solve(A)
A %*% solve(A)
## ==> 단위행렬(Identity matrix)


## 6. 전치행렬 (Transpose Matrix)
## 행과 열을 바꿈
## t(행렬)
t(A)



################
## IV. 배열   ##
################

## 다차원
## 벡터, 행렬의 확장
## 데이터의 유형을 하나만 가짐

## array(벡터, dim=)
array(1:10, dim=12)
array(1:10, dim=3) # 1차원
array(1:10, dim=c(3, 4)) # 2차원
array(1:10, dim=c(3, 4, 2)) # 3차원

#######################
## V. 데이터 프레임  ##
#######################

## 행과 열로 구성됨, 2차원 구조
## 여러 개의 데이터 유형을 가질 수 있음
## 단, 하나의 열은 하나의 데이터 유형을 가짐

## data.frame(벡터1, 벡터2, 행렬, ...)
id = 1:5
gender = c("m", "m", "m", "f", "m")
address = c("구파발", "강동", "압구정", "수원", "용인")
survey = data.frame(id, gender, address)
survey


#################
## VI. 리스트  ##
#################

## 분석한 결과를 저장할 때에 많이 사용하는 형태
## 가장 유연한 데이터 형태
## ==> 각각의 벡터의 길이와 유형이 달라도 상관없다는 의미
## ==> 리스트의 원소로 벡터, 요인, 행렬, 배열, 데이터 프레임, 리스트를
##     가질 수 있음

## list(벡터, 요인, 행렬, 배열, 데이터 프레임, 리스트, ...)

v1 = 1:10
v2 = 1:3
M1 = cbind(v1, v2)
result = list(v1, v2, M1, survey)

result
result[1]
result[[1]]

result[4]
result[[4]]

