#####################################################
### 수업내용 : 반복문, 조건문, 사용자 함수        ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 20일(목)                ###
#####################################################


## 1. 반복문 : for문
## 동일한 일을 여러 번 하거나
## 비슷한 일을 여러 번 할 때

## print("메세지") ==> 다음줄로 
print("hello, world")

for (i in 1:10){
    print(i)
    print("hello, world")
}

## cat(메세지1, 메세지2, 메세지3, 메세지4 ...) ==> escape code
cat("Hello,", 1)

for (i in 1:10){
    cat("Hello,", i, "\n")
}

## 문제1
## 구구단 짜기
## 1 x 1 = 1, 1 x 2 = 2... 9 x 9 = 81

for(i in 1:9){
    for (j in 1:9){
        cat(i, " x ", j, " = ", i*j, "\n")
    }
    cat("\n")
}


## 2. 조건문
## if, if ~ else, if ~ else if ~ else
## ifelse

## (1) if
x = 100
if(x > 50){
  print("Very large number!!!")
}

x = c(100, 30, 60)
if(x > 50){
  print("Very large number!!!")
}
## ==> 벡터에 대한 연산은 불가능!

for(i in 1:3){
    if(x[i] > 50){
        print("Very large number!!!")
    }
}

## (2) if ~ else
## if(조건문){조건이 참일때 실행문1}
## else{조건이 거짓일때 실행문2}
y = 10
if(y > 5){
    print("Large!!!")
} else{
    print("Small!!!")
}
  
y = c(10, 4, 6)
if(y > 5){
  print("Large!!!")
} else{
  print("Small!!!")
}
## ==> 벡터에 대한 연산은 불가능!

for(i in 1:length(y)){
    if(y[i] > 5){
        print("Large")
    }
}

for(i in 1:length(y)){
  if(y[i] > 5){
    print("Large")
  }else{
    print("Small!!!")
  }
}

## (3) if ~ else if ~ else
## if(조건문1){실행문1}
## else if(조건문2){실행문2}...
## else{실행문3}
z = 7
if(z > 10){
    print("Large!!!")
}else if(z > 5){
    print("Medium!!!")
}else{
    print("Small!!!")
}
## ==> 벡터에 대한 연산은 불가능
## ==> for문을 이용하여 연산!


## 3. 사용자 함수
## 함수명 = function(){실행문}
## 함수명 = function(){return 실행문}
hello = function(){
    print("Hello, world!!!")
}

## 함수호출 : 함수명()
hello()

x = hello()
x  
  
hello = function(){
    print("Hello, world!!!")
    return("Hello, Junhwan")
}

y = hello()
y

## 문제2
## 숫자데이터일때 3배를 해주는 함수를 작성하세요
## 또한 숫자데이터가 아닐때 오류 메세지를 출력하세요
## case1
triple = function(x){
    if(class(x) == "numeric"){
        tmp = 3*x
        return(tmp)
    }else{
        print("숫자형 데이터를 넣어주세요.")
    }
}

## case2
triple = function(x){
  if(is.numeric(x)){
    tmp = 3*x
    return(tmp)
  }else{
    print("It is not number. Please input number!")
  }
}

triple(10)
triple("Junhwan")


## 문제3
## 숫자를 받아 구구단을 출력하는 프로그램을 작성하세요
multiplication = function(x){
   if(is.numeric(x)){
      for(i in 1:9){
          cat(x, " x ", i, " = ", x*i, "\n")
      }
   }else{
      print("숫자를 넣어주세요")
   }
}
multiplication(2)








  
  
  
  
  
