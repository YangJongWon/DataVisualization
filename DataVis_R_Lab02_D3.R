#install.packages("networkD3")
#install.packages("d3Network")

library(networkD3)
library(d3Network)

# 간단한 다이어그램
source = c("철수", "철수", "철수", "수철", "수철", "수철", "기수", "기수")
target = c("영희", "민희", "수철", "수진", "철수", "희수", "영희", "수철")

networkData = data.frame(source, target)
networkData

simpleNetwork(networkData, fontFamily = "sans-serif")


library(RCurl)
virus1 <- read.csv("D:/dataset/RLoveYou/meros.csv")
simpleNetwork(virus1)


