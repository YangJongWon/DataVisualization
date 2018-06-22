
rm(list=ls())
search()

# 두 지점사이의 거리: 동작구청, 관악구청 
# 위도,경도
# 37.51245,126.9395002
# 37.5059546,126.9403928
# 37.4964553,126.9405994
# 37.4958369,126.941362
# 37.4900359,126.945008
# 37.4823951,126.9465463
# 37.4812365,126.9526738
# 37.4781547,126.951485

setwd("C:/Users/WITHJS/Documents/R/00_RGis")
getwd()
a <- read.csv("3_1_path.csv", header=TRUE, encoding="UTF-8")
a

# 02 데이터 정리, 원하는 정보 추출
names(a) <- c("경도", "위도"); a
ll <- data.frame(longitude=a$경도, latitude=a$위도)
ll

# 03 지리좌표계 구성 
#install.packages("sp")
library(sp)
cs = CRS("+proj=longlat + datum=WGS84")
ll.sp = SpatialPoints(ll, proj4string=cs)
ll.sp

# 04 UTM 좌표계 변환 
#install.packages("rgdal")
library(rgdal)
cs2 = CRS("+proj=utm +zone=51 +ellps=WGS84 +units=km")
ll.sp2 = spTransform(ll.sp, cs2)
ll.sp2
is(ll.sp2)
ll = data.frame(ll.sp2)
ll; is(ll)
ss = Line(ll); 
ss; is(ss)
LineLength(ss)

# 결과: 동작구청과 관악구청 도로상의 실제거리 : 4.375(km)

