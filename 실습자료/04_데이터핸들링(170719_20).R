#####################################################
### 수업내용 : 데이터 핸들링 = 데이터 전처리      ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 19일(수)                ###
#####################################################

## Data Handling = Data Pre-processing

options(repos="https://cran.rstudio.com")
install.packages("readxl")
install.packages("data.table")
install.packages("DT")
library(readxl)
library(data.table)
library(DT)

## 작업공간 (Working directory)
## 설정 : setwd("파일위치")
getwd()
#setwd()


## 0. 데이터 읽어오기
student = readxl::read_excel(path = "./student.xlsx", 
                             sheet = "data")
student

## 1. 데이터 전체 보기
## (1) View(데이터)
View(student)
## ==> 이게 더 좋은 방법

## (2) 데이터 : 콘솔(console )에 출력
student

## 2. 데이터의 구조(Structure) 보기
## str(데이터)
str(student)

student$id


## 3. 데이터의 일부 보기
## (1) head(데이터)
head(student)
head(student, n = 3)

## (2) tail(데이터)
tail(student)


## 4. 데이터 프레임의 속성
## (1) 행의 갯수 : nrow(데이터)
nrow(student)

## (2) 열의 갯수 : ncol(데이터) == 변수의 갯수
ncol(student)

## (3) 행의 이름 : rownames(데이터)
rownames(student)

## (4) 열의 이름 : colnames(데이터) == 변수의 이름
colnames(student)

## (5) 차원(dimension) : 행, 열
## dim(데이터)
dim(student)
dim(student)[1]
dim(student)[2]

## (6) 차원의 이름 : 행의 이름, 열의 이름
## dimnames(데이터)

## 리스트형태로 가져오기
dimnames(student)[1]
dimnames(student)[2]

## 벡터형태로 가져오기
dimnames(student)[[1]]
dimnames(student)[[2]]

dimnames(student)[[2]][1]


## 5. 데이터(데이터 프레임)의 슬라이싱
## 데이터[ 행 index, 열 index ]

## (1) 열(Column)
## 데이터 [ , index]
student[ , 1]
student[ , 2]

## 문제1 : 2, 3, 6 번째 열을 가져오세요.
student[ , c(2, 3, 6)]

## 문제2 : 4~8 번째 열을 가져오세요.
student[ , 4:8]

## 문제3 : 짝수 번째 열을 가져오세요.
student[ , seq(from=2, to=ncol(student), by=2)]

## 변수명으로 직접 가져오기
student[ , "age"]
student[ , c("age", "height")]

## 변수명에 특정한 패턴이 있는 것을 추출
## 글자를 포함 또는 시작 또는 끝
## grep("패턴", 문자열)
## 정규표현식 (Regular Expression)


colnames(student)

## 변수명 중에서 "e"라는 글자를 포함하고 있는 변수명의 위치
grep("e", colnames(student)) # 위치 리턴

## 변수명 중에서 "e"라는 글자를 포함하고 있는 변수명
grep("e", colnames(student), value = TRUE) # 변수명 리턴


## 변수명 중에서 "e"라는 글자를 포함하고 있는 데이터를 추출
student[ , grep("e", colnames(student))]


## 변수명 중에서 "a"라는 글자로 시작하는 데이터를 추출
student[ , grep("^a", colnames(student))]


## 변수명 중에서 "t"라는 글자로 끝나는 데이터를 추출
student[ , grep("t$", colnames(student))]


## (2) 행
student[1, ]
student[c(1, 4, 6), ]
student[4:6, ]

## 비교연산자 활용 row 추출하기
## 성별이 여자인 데이터 가져오기
student[student$gender == "여자", ]
student.female = student[student$gender == "여자", ]
student.female

## 문제4
## 거주지가 수원이 아닌 사람들의 데이터를 가져오기
student[student$address != "수원", ]

## 몸무게가 50이하인 사람들의 데이터를 가져오기
student[student$weight <= 50, ]

## 문제5
## 나이가 30대이상이고 키는 175이상인 사람들의 데이터를 가져오기
student[(student$age >= 30) & (student$height >= 175), ]

## 문제6
## 나이가 30대이상 또느 키는 175이상인 사람들의 데이터를 가져오기
student[(student$age >= 30) | (student$height >= 175), ]

## (3) 행과 열
student[4:10, c("weight", "height")]

## 문제7
## 키가 170 이상이고, 몸무게는 60 이상인 사람들의
## 변수명에 "e"라는 글자가 들어가는 데이터를 추출하시오.
student[(student$height >= 170) & (student$weight >= 60), 
        grep("e", colnames(student))]


## 6. 변수 생성하기
## 데이터$변수명 = 연산(수식)
## bmi 지수 추가하기
student$bmi = student$weight / ((student$height / 100)^2)

## ifelse(조건문, 참일때 표현식, 거짓일때 표현식)
student$age.group = ifelse(student$age >= 30, "30대 이상", "20대 이하")

## 문제8
## age.group2 : 20대 초반, 20대 중반, 30대 이상
## 25세미만 / 25-29 / 30-

student$age.group2 = ifelse(student$age >= 30, "30대 이상", 
                            ifelse(student$age >= 25, "20대 중반", "20대 초반"))

## cut(데이터$변수명, breaks=구간정보)
student$bmi.group = cut(student$bmi,
                        breaks = c(0, 18.5, 23, 25, 30))

## ex> (18.5, 23) : 18.5 초과 ~ 23이하
## ex> [18.5, 23) : 18.5 이상 ~ 23미만

## ( ): 소괄호 옆에 있는 숫자는 포함되지 않음
## [ ]: 대괄호 옆에 있는 숫자는 포함됨

student$bmi.group = cut(student$bmi,
                        breaks = c(0, 18.5, 23, 25, 30),
                        right = FALSE)

student$bmi.group3 = cut(student$bmi,
                        breaks = 0:30,
                        right = FALSE)

View(student)

score = readxl::read_excel(path = "score.xlsx",
                           sheet = 1,
                           col_names = TRUE)

score$avg = rowMeans(score[ , 2:6])


## 7. 데이터의 값을 수정하기
home = readxl::read_excel(path = "./home.xlsx",
                          sheet = 1,
                          col_names = TRUE)
home
home[home$price == 500, "price"] = 50
home

home[home$price == 50, "price"] = NA



## 8. 데이터 정렬하기
## (1) 벡터를 정렬하기 : sort(벡터, decreasing=)
money = c(45, 50, 40, 50, 50, 30, 500)
money
sort(money) # 오름차순
sort(money, decreasing = TRUE) # 내림차순


## (2) order(데이터명$변수명, decreasing=)
order(money) # argsort와 같은 개념

money[order(money)]


student[order(student$height), ]
student[order(student$height, decreasing = TRUE), ]

## 성별 : 오름차순
## 키   : 오름차순
student[order(student$gender, student$height), ]

## 문제9
## 성별 : 내림차순
## 키   : 내림차순
student[order(student$gender, student$height, decreasing = TRUE), ]

## 문제10
## 성별 : 오름차순
## 키   : 내림차순
student[order(student$gender, -student$height), ]

## 문제11
## 성별 : 내림차순
## 키   : 오름차순
student[order(student$gender, -student$height, decreasing = TRUE), ]

## 문제12
## 성별 : 오름차순
## 거주지: 내림차순
## ==> 추가기능 필요 ==> data.table 설치


## data.table 패키지를 이용함
studentDT = as.data.table(student)
str(studentDT)
studentDT[order(gender, -address) , ]

## 시간이 얼마나 소요되는지를 알려주는 함수
## system.time(작업)
DF = data.frame(id=1:10,
                type=sample(letters, size = 10, replace = TRUE))
View(DF)

DT = as.data.table(DF)

system.time(x <- DF[DF$type == "a", ])

data.table::setkey(DT, type)
system.time(x <- DT[J("a"), ])

## 07/20(목)

## DT

## <데이터 핸들링 패키지>
## 1. readxl
## 2. openxl
## 3. data.table
## 4. DT

## 9. 데이터 합치기
## (1) rbind(데이터1, 데이터2)
df1 = data.frame(id=1:3, 
                 age=10:12, 
                 gender=c("F", "F", "M"))

df2 = data.frame(id=4:5, 
                 age=c(20, 30), 
                 gender=c("M", "M"))

df1;df2
df3 = rbind(df1, df2)
df3

## (2) merge(데이터1, 데이터2, by=) ***
df4 = data.frame(id = c(1, 2, 4, 7),
                 age = c(10, 20, 40, 70))
df5 = data.frame(id = c(1, 2, 3, 6, 10),
                 gender = c("M", "M", "F", "M", "F"))

df4;df5

merge(df4, df5, by = "id", all = TRUE)

## <Join 방법>
## i. inner join
## merge(데이터1, 데이터2, by=)

merge(df4, df5, by = "id")
## ==> df4와 df5의 같은 id가 있는 특정 데이터만을 합친다.


## ii. outer join
##  - full join
## merge(데이터1, 데이터2, by=, all=TRUE)

merge(df4, df5, by = "id", all = TRUE)
DT::datatable(merge(df4, df5, by = "id", all = TRUE))
## ==> df4와 df5의 id를 기준으로 모든데이터를 합친다. 


## - left join
## merge(데이터1, 데이터2, by =, all.x = TRUE)
merge(df4, df5, by = "id", all.x = TRUE)


## - right join
## merge(데이터1, 데이터2, by=, all.y = TRUE)
merge(df4, df5, by = "id", all.y = TRUE)

df4;df5

