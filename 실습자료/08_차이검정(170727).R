#####################################################
### 수업내용 : 차이검정                           ###
### 작성자 : Junhwan Jang                         ###
### 작성일자 : 2017년 7월 27일(목)                ###
#####################################################


# 교차분석

# table( )을 사용해 주어진 벡터에서 a, b, c의 출현 횟수
table(c("a", "b", "b", "b", "c", "c", "d"))

#xtabs( )는 포뮬러를 사용해 데이터를 지정
d <- data.frame(x=c("1", "1", "2", "2"),
                y=c("A", "B", "A", "B"),
                num=c(190, 230, 60, 20))
mytable<-xtabs(num ~ x + y, data=d)
mytable

(d2 <- data.frame(x=c("A", "A", "A", "B", "B")))
(xtabs(~ x, d2))


# 주변 합과 주변 비율은 margin.table( ), prop.table( )로 계산한다.

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)

#
d <- data.frame(x=c("car", "car", "truck", "truck", "doll", "doll"),
                y=c("Child1", "Child2", "Child1", "Child2", "Child1", "Child2"),
                num=c(5, 4, 11, 7, 1,3 ))
mytable<-xtabs(num ~ x + y, data=d)
mytable

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)  # Warning message:In chisq.test(mytable) : Chi-squared approximation may be incorrect
fisher.test(mytable)


# x<-matrix(c(24, 3,5,12), nc=2) 일때 검정해보자

x<-matrix(c(24, 3,5,12), nc=2)
x
colnames(x)<- c("A", "B")
rownames(x)<-c("X", "y")
margin.table(x, 1) # A frequencies (summed over B) 
margin.table(x, 2) # B frequencies (summed over A)

prop.table(x) # cell percentages
prop.table(x, 1) # row percentages 
prop.table(x, 2) # column percentages

chisq.test(x)


# 일표본 t검정
# 3-1반의 학생들의 수학 평균성적은 55점이었다. 
# 0교시 수업을 시행하고 나서 학생들의 시험 성적은 다음과 같다.
# 58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
# 교시 수업을 시행한 후, 학생들의 성적은 올랐다고 할 수 있는가?

a <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

shapiro.test(a)  #데이터가 정규분포를 하는지를 검사한다

t.test(a, mu=55, alternative="greater")  # 올랐다고 말할 수 없다


# 독립표본 t검정

pre<-c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post<-c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
G<-c(1,2,2,1,1,2,2,2,1,1)
t.test(pre~G)
t.test(post~G)


# 종속표본 t 검정
t.test(pre, post,paired=T, alternative="two.sided")  # 차이가 있다고 말할 수 있다
Diff<-post-pre
Diff
t.test(Diff~G)

# 세표본 비교
xx <- c(40, 30,50, 60)
yy <- c(60, 40, 55, 65, 60, 50)
zz <- c(70, 65, 70, 50, 60)
mydata <-c(xx,yy,zz)  #벡터형으로 자료를 생성함
mydata
group <-c(rep(1,4), rep(2,6), rep(3,5))  
group
cbind(mydata, group)
boxplot(mydata~group)
library(psych)
describe.by(mydata, group)  # 그룹별 기술통계량 계산
ANO_R<-aov(mydata~group)
anova(ANO_R)
# 사후검정
# install.packages("agricolae")
library(agricolae)
scheffe.test(ANO_R, "group", alpha=0.05, console=TRUE) # "group" 주의 
LSD.test(ANO_R, "group", alpha=0.05, console=TRUE)
duncan.test(ANO_R, "group", alpha=0.05, console=TRUE)


# 비모수 검정
# t.test(t검정)=> Wilcox.test(윌콕슨검정)
# 표본의 크기가 작고 정규성 검정을 따르지 않은 경우 
# 분포가 대칭적이라고 가정하고 비모수 검정을 한다


x<-c(1.83, 0.50, 1.62, 2.48, 2.68, 1.88, 1.55, 3.06, 1.30)
y<-c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)  
shapiro.test(x)  #데이터가 정규분포를 하는지를 검사한다
shapiro.test(y)
wilcox.test(x,y, paired=TRUE, alternative="greater")
wilcox.test(x,y, paired=TRUE, alternative="two.sided")
wilcox.test(y-x, alternative="less")
wilcox.test(y-x, alternative="less", exact=FALSE, correct=FALSE)
# 부호화 순위검정 정규근사를 이용하는 경우, exact=FALSE, correct=FALSE를 사용
# 연속성 보장하는 경우는 correct=TRUE


# anova => kruskal.test(크루스칼 왈리스검정)

x<-c(2.9, 3.0, 2.5, 2.6, 9.2)
y<-c(3.8, 5.7, 4.0, 7.4)
z<-c(2.8, 3.4, 2.2, 2.0)
shapiro.test(x)
shapiro.test(y)
shapiro.test(z)
kruskal.test(list(x,y,z))  # list 주의


# 
performance <-matrix(c(794, 86, 150, 570), nrow=2, dimnames=list("1st Survey"=c("Approve", "Disapprove"), "2nd Survey"=c("Approve", "Disapprove")))
performance
mcnemar.test(performance)
