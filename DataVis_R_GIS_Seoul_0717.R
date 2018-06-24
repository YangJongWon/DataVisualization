# R Script 
# R활용 7번째 : 서울 TOP  10 관광명소를 구글 맵 위에

# 서울의 관광 명소를 TOP 10 표시하기 

# 지명 : 주소
# 1. 동대문 쇼핑타운 서울 중구 장충단로 253
# 2. 명동            서울 중구 명동8길 27
# 3. 경복궁          서울 종로구 사직로 161
# 4. 남산서울타워    서울 용산구 남산공원길 105
# 5. 인사동길        서울 종로구 인사동길 39-1
# 6. 남대문시장      서울 중구 남대문시장4길 21

# install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages("ggmap")
library(ggplot2)
library(RgoogleMaps)
library(ggmap)

names <- c("1.동대문 쇼핑타운", "2.명동", "3.경복궁",
           "4.남산서울타워", "5.인사동길", "6.남대문시장")

addr <- c("서울 중구 장충단로 253",
          "서울 중구 명동8길 27",
          "서울 종로구 사직로 161",
          "서울 용산구 남산공원길 105",
          "서울 종로구 인사동길 39-1",
          "서울 중구 남대문시장4길 21")



gc <- geocode(enc2utf8(addr))  # 서울의 관광명소의 위도, 경도
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
