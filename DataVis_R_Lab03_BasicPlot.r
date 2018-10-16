
#Create Data
x1 = rnorm(100)
x2 = rnorm(100, mean=2)
par(mfrow=c(2,1))
 
#Make the plot
# mar : 여백크기 설정 - 아래쪽, 왼쪽, 위쪽 및 오른쪽 순서
# xaxt="n" 넣기 
par(mar=c(0,5,3,3))   
plot(density(x1) , main="" , 
             xlab="", ylim=c(0,1) , 
             las=1 ,                       
             col="slateblue1" , 
             lwd=4 )

par(mar=c(5,5,0,3))
plot(density(x2) , main="" , 
             xlab="Value of my variable", 
             ylim=c(1,0) , 
             las=1 , 
             col="tomato3" , 
             lwd=4)

# 데이터 만들기
Ixos=rnorm(4000 , 100 , 30)     
Primadur=rnorm(4000 , 200 , 30) 
 
# 각각 그래프 표현 
par(mfrow=c(1,2))
hist(Ixos, breaks=30 , 
     xlim=c(0,300) , 
     col=rgb(1,0,0,0.5) , 
     xlab="높이" , ylab="nbr of plants" , main="" )
hist(Primadur, breaks=30 , 
     xlim=c(0,300) , 
     col=rgb(0,0,1,0.5) , 
     xlab="높이" , ylab="nbr of plants" , main="")


# 분포의 차이를 보는 것은 어렵다. 
# 이 경우, 그래프를 같은 그래프 위로 두는 것이 흥미로울 것이다.
# 전체 그래프를 보기 위한 투명도
hist(Ixos, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="높이", 
     ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties" )

hist(Primadur, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)

legend("topright", 
       legend=c("Ixos","Primadur"), 
       col=c(rgb(1,0,0,0.5), 
       rgb(0,0,1,0.5)), pt.cex=2, pch=15 )

#Create Data
x1 = rnorm(100)
x2 = rnorm(100)+rep(2,100)
par(mfrow=c(2,1))
 
#Make the plot
par(mar=c(0,5,3,3))
hist(x1 , main="" , xlim=c(-2,5), 
          ylab="x1에 대한 횟수", xlab="", 
          ylim=c(0,25) , xaxt="n", las=1 , 
          col="slateblue1", breaks=10)
par(mar=c(5,5,0,3))
hist(x2 , main="" , xlim=c(-2,5), 
          ylab="x2에 대한 횟수", xlab="변수의 값", 
          ylim=c(25,0) , las=1 , 
          col="tomato3"  , breaks=10)

# Create data
names=c(rep("A", 80) , rep("B", 50) , rep("C", 70))
value=c( rnorm(80 , mean=10 , sd=9) , rnorm(50 , mean=2 , sd=15) , rnorm(70 , mean=30 , sd=10) )
data=data.frame(names,value)
 
# Basic boxplot
boxplot(data$value ~ data$names , col=terrain.colors(4) )
 
# Add data points
mylevels<-levels(data$names)
levelProportions<-summary(data$names)/nrow(data)
 
for(i in 1:length(mylevels)){
 
  thislevel<-mylevels[i]
  thisvalues<-data[data$names==thislevel, "value"]
   
  # take the x-axis indices and add a jitter, proportional to the N in each level
  myjitter<-jitter(rep(i, length(thisvalues)), amount=levelProportions[i]/2)
  points(myjitter, thisvalues, pch=20, col=rgb(0,0,0,.2)) 
   
}

# create data :
sample= paste(rep("sample_",40) , seq(1,40) , sep="")
specie= c(rep("carot" , 10) , 
          rep("cumcumber" , 10) , 
          rep("wheat" , 10) , 
          rep("Potatoe" , 10) )  # 각각 10개씩 있음.

gene1=c( seq(5,14)+rnorm(10 , 4 , 1) , 
        seq(5,14)+rnorm(10 , 4 , 1) , 
        seq(5,14)+rnorm(10 , 4 , 1) , 
        seq(5,14)+rnorm(10 , 4 , 1) )

gene2=c( seq(5,14)+rnorm(10 , 4 , 1) , 
        seq(5,14)+rnorm(10 , 2 , 0.2) , 
        seq(5,14)+rnorm(10 , 4 , 4) , 
        seq(5,14)+rnorm(10 , 4 , 3) )

data=data.frame(sample,specie,gene1,gene2)
 
# Make the graph
library(lattice)
xyplot(gene1 ~ gene2 | specie , 
       data=data , 
       pch=20 , 
       cex=3 , 
       col=rgb(0.2,0.4,0.8,0.5) )

# 2개의 이산형 변수
a=c(1,1,3,4,5,5,1,1,2,3,4,1,3,2,1,1,5,1,4,3,2,3,1,0,2)
b=c(1,2,3,5,5,5,2,1,1,3,4,3,3,4,1,1,4,1,4,2,2,3,0,0,1)
 
# 발생할 수 있는 경우의 수와 횟수를 표시
# I count the occurence of each couple of values. Eg : number of time a=1 and b=1, number of time a=1 and b=2 etc...
AA=xyTable(a,b)
AA

# Now I can plot this ! I represent the dots as big as the couple occurs often
coeff_bigger=2
plot(AA$x , AA$y , cex=AA$number*coeff_bigger  , pch=16 , col=rgb(0,0,1,0.5) , xlab= "value of a" , ylab="value of b" , xlim=c(0,6) , ylim=c(0,6) )
text (AA$x , AA$y , AA$number )
 
#Note : It's easy to make a function that will compute this kind of plot automaticaly :
represent_discrete_variable=function(var1, var2 , coeff_bigger){
  AA=xyTable(var1,var2)
  plot(AA$x , AA$y , 
       cex=AA$number*coeff_bigger  , 
       pch=16 , 
       col="chocolate1" , 
       xlab= "value of a" , ylab="value of b" )
  text (AA$x , AA$y , AA$number )
}

# Data
name= c("DD","with himself","with DC","with Silur" ,"DC","with himself","with DD","with Silur" ,"Silur","with himself","with DD","with DC" )
average= sample(seq(1,10) , 12 , replace=T)
number= sample(seq(4,39) , 12 , replace=T)
data=data.frame(name,average,number)
 
# Basic Barplot
my_bar=barplot(data$average , 
               border=F , 
               names.arg=data$name , 
               las=2 , 
               col=c(rgb(0.3,0.1,0.4,0.6) , 
                     rgb(0.3,0.5,0.4,0.6) , 
                     rgb(0.3,0.9,0.4,0.6) ,  
                     rgb(0.3,0.9,0.4,0.6)) , 
               ylim=c(0,13) , main="" )

abline(v=c(4.9 , 9.7) , col="grey")
 
# Add the text 
text(my_bar, data$average+0.4 , paste("n = ",data$number,sep="") ,cex=1) 
 
#Legende
legend("topleft", legend = c("Alone","with Himself","With other genotype" ) , 
     col = c(rgb(0.3,0.1,0.4,0.6) , 
             rgb(0.3,0.5,0.4,0.6) , 
             rgb(0.3,0.9,0.4,0.6) ,  
             rgb(0.3,0.9,0.4,0.6)) , 
            bty = "y", 
            pch=20 ,       # 범례의 표시 점
            pt.cex = 3,    # 범례의 점의 크기 
            cex = 0.8, 
            horiz = FALSE, 
            inset = c(0.05, 0.05))
 

# install.packages("treemap")
# library
library(treemap)

# Create data
group=c("group-1","group-2","group-3")
value=c(13,5,22)
data=data.frame(group,value)
 
# treemap
treemap(data,
            index="group",
            vSize="value",
            type="index"
            )

# install.packages("ellipse")
# install.packages("RColorBrewer")
# Libraries
library(ellipse)
library(RColorBrewer)

# Use of the mtcars data proposed by R
data=cor(mtcars)
 
# Build a Pannel of 100 colors with Rcolor Brewer
my_colors <- brewer.pal(5, "Spectral")
my_colors=colorRampPalette(my_colors)(100)
 
# Order the correlation matrix
ord <- order(data[1, ])
data_ord = data[ord, ord]
plotcorr(data_ord , col=my_colors[data_ord*50+50] , mar=c(1,1,1,1)  )

# Packages
library(car)
library(RColorBrewer)
 
# Let's use the car dataset proposed by R
data=mtcars
 
# Make the plot
my_colors <- brewer.pal(nlevels(as.factor(data$cyl)), "Set2")
scatterplotMatrix(~mpg+disp+drat|cyl, data=data , 
                  reg.line="" , 
                  smoother="", 
                  col=my_colors , 
                  smoother.args=list(col="grey") , 
                  cex=1.5 , 
                  pch=c(15,16,17) , 
                  main="Scatter plot with Three Cylinder Options")
