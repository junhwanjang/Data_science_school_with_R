############################################
### 수업내용 : 외부데이터 읽어오기       ###
### 작성자 : Junhwan Jang                ###
### 작성일자 : 2017년 7월 18일(화)       ###
############################################

## 외부 데이터: txt, csv, excel(xls, xlsx)

## 1. 텍스트 데이터 : txt
## (1) 구분자 (Separator) : 공백 하나 (blank, white space)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                       header=TRUE,
##                       sep=" ")

hope = read.table(file = "./hope.txt", 
                  header = FALSE,
                  sep = " ")
hope

hope = read.table(file = "./hope.txt", 
                  header = TRUE,
                  sep = " ")
hope

## (2) 구분자 (Separator) : comma (,)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                       header=TRUE,
##                       sep=",")

books = read.table(file = "./books.txt",
                   header = TRUE,
                   sep = ",")
books

## (3) 구분자 (Separator) : tab (\t)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                       header=TRUE,
##                       sep="\t")

body = read.table(file = "./body.txt",
                  header = TRUE,
                  sep = "\t")
body

## 2. CSV(Comma Separated Value)
## 엑셀의 특수한 형태
## 데이터명 = read.csv(file="파일위치/파일명.csv",
##                     header=TRUE)

bundesliga = read.csv(file="./Bundesliga.csv",
                      header = TRUE)
bundesliga

## 3. 엑셀 : xls, xlsx
## R의 기본 기능에서는 못 읽어옴...
## 추가기능을 설치하면 가능하다 : 패키지 설치

## 패키지명: readxl
## 패키지 설치하기 : install.packages("패키지명")

options(repos = "https://cran.rstudio.com")
install.packages("readxl")

## 패캐지 로딩하기 (패키지 구동하기)
## R과 패키지를 연결하는 기능 : library(패키지명)

library(readxl)

## 데이터명 = readxl::함수이름 *** 좋은 코드의 예!!!
## 데이터명 = readxl::read_excel(path="파일위치/파일명.xlsw",
##                               sheet=index or "시트명",
##                               col_names=TRUE)

time2 = readxl::read_excel(path = "./time.xlsx",
                           sheet = 1,
                           col_names = TRUE)
time2











