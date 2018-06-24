# R Script 
# R활용 7번째 : 서울 TOP  10 관광명소를 구글 맵 위에

# 충청북도 단양군에 있는 명소인 단양팔경의 위치와 이름을 
# 구글 맵위에 표시해 보자.

# 지명 : 주소
# 도담삼봉/석문 매포읍 삼봉로 644-33
# 구담/옥순봉   단성면 월악로 3827
# 사인암        대강면 사인암길 37
# 하선암        단성면 선암계곡로 1337
# 중선암        단성면 선암계곡로 868-2
# 상선암        단성면 선암계곡로 790

# install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages("ggmap")
library(ggplot2)
library(RgoogleMaps)
library(ggmap)

names <- c("1.도담삼봉/석문", "2.구담/옥순봉", "3.사인암",
           "4.하선암", "5.중선암", "6.상선암")

addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암 2",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")

gc <- geocode(enc2utf8(addr))  # 단양 팔경 주소지의 위도, 경도
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

# 데이터 프레임에 있는 모든 경도, 위도에 대한 평균치
cen <- c(mean(df$lon), mean(df$lat))
cen

# 위도, 경도 평균값에 지도 중심 설정
map <- get_googlemap(center=cen,
                     maptype="roadmap", 
                     zoom=11, 
                     marker=gc)

ggmap(map, fullpage=TRUE)
