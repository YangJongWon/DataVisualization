
### Violin
### 바이올린 플롯을 사용하면 하나 또는 여러 그룹에 대한 숫자 변수의 분포를 시각화
### 할 수 있다.

# Library
library(ggplot2)

# mtcars data
head(mtcars)

# First type of color
ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_violin(aes(fill = cyl))

# Second type
ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_violin(aes(fill = factor(cyl))) 


## Boxplot
a=seq(129,1)+4*runif(129,0.4)
b=seq(1,129)^2+runif(129,0.98)

nf=layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
layout.show(nf)