## basic exercise

install.packages("rvest")
library(rvest)

url <- "http://www.tripadvisor.com/Hotel_Review-g37209-d1762915-Reviews-JW_Marriott_Indianapolis-Indianapolis_Indiana.html"

reviews <- url %>% 
  read_html() %>%
  html_nodes(".innerBubble")
reviews

id <- reviews %>%
  html_node(".quote a") %>%
  html_attr("id")

quote <- reviews %>%
  html_node(".quote span") %>%
  html_text()

date <- reviews %>%
  html_node(".rating .ratingDate,relativeDate") %>%
  html_attr("title")


review <- reviews %>%
  html_node(".entry .partial_entry") %>%
  html_text()

data.frame(id, quote, date, review, stringsAsFactors = FALSE) %>% View()


##practice!!! (champion win rate from op.gg)
op<-"https://www.op.gg/champion/statistics"

champions <- op %>%
  read_html() %>%
  html_node(".ChampionTrendSummaryChampionList")

wins <- champions %>%
  html_nodes(" a .Value b") %>%
  html_text()

chamurl <- champions %>%
  html_nodes(" a") %>%
  html_attr("href")
chamurl
  


wins
pics <- champions %>%
  html_nodes(" a .Value span") %>%
  html_text()
pics

wins<- op %>% 
  read_html() %>%
  html_nodes(".ChampionTrendSummaryChampionList a")
wins

champion<-wins %>% 
  html_nodes(".ChampionName")%>%
  html_text()


rate<-wins %>% 
  html_nodes(".Value b")%>%
  html_text()


pick<-wins %>% 
  html_node(".Value span")%>%
  html_text()

data.frame(champion, rate, pick) %>% View()



## advanced exercise
url <- "http://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=1" 
usedCar <- read_html(url) 
carname <- usedCar %>%
  html_nodes(".carinfo a.title") %>%
  html_text()

specs<-usedCar %>%
  html_nodes(".sub_01") %>%
  html_text()

data.frame(carname, specs) %>% View()


install.packages("stringr")
library(stringr)
str_split(carInfos[1] %>% html_nodes('.sub_01') %>% html_text(), 'คำ')
str_replace('20,000km', '0', '')
str_replace_all('20,000km', '0', '')
str_replace_all('20,000Km', '[a-zA-Z]', '')


splitFunction <- function(row){ 
  return(str_split(row, 'คำ')[[1]]) } 
carDetailInfo <- lapply(carInfos %>% html_nodes('.sub_01') %>% 
                          html_text(), splitFunction) 

head(carDetailInfo)


carDetailInfo <- matrix(unlist(carDetailInfo), ncol=3, byrow=T)

transmission <- carDetailInfo[,1] 
fuel <- carDetailInfo[,2] 
distance <- as.numeric(str_replace_all(carDetailInfo[,3], '[,a-z]','')) 


data.frame(carname, transmission, fuel, distance) %>% View()



##ผ๗มฆ

bobaecrawl<-function(x){
  return(
    for (i in 1:x){
      url<-paste0("http://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=", i)
      read_html(url) %>%
        html_nodes(".carinfo a.title") %>%
        html_text()%>%
        print()
    }
  )
}




library(XML)
inven<-readHTMLTable("http://lol.inven.co.kr/dataninfo/match/playerList.php", header=T)


str(inven)
inven<-inven[[2]]

inven<-inven[, -c(1, 2,5)]
names(inven)<-c("name", "cmp", "result", "k", "d", "a", "kda", "help")
str(inven)



inven[, 4:7]<-sapply(inven[, 4:7], function(a){as.numeric(as.character(a))})
inven$help<-as.numeric(sub("%", "", inven$help))/100



inven$name<-as.character(inven$name)
temp<-as.data.frame(do.call(rbind, strsplit(inven$name, ' (?=[^ ]+$)', perl=TRUE)))

inven$name<-temp$V2
inven$team<-temp$V1
View(inven)
