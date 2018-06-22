
## 
# Load package
library(networkD3)

# Create fake data
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData)


## forceNetwork
# Load data
data(MisLinks)
data(MisNodes)

MisLinks
MisNodes

# forceNetwork function
# https://www.rdocumentation.org/packages/networkD3/versions/0.4/topics/forceNetwork

# Link : 노드들 사이의 링크를 갖는 데이터 프레임 객체. 
# 여기에는 각 링크에 대한 소스 및 대상이 포함되어야합니다. 
# 0부터 시작하여 번호가 매겨 져야합니다. 선택적 Value 변수를 사용하여 
# 노드가 얼마나 가까이 있는지 지정할 수 있습니다.
# > MisLinks
#       source target value
# 1        1      0     1
# 2        2      0     8
# 3        3      0    10

# Node : 노드 ID 및 노드의 특성을 포함하는 데이터 프레임. 
# ID가 지정되지 않은 경우 노드는 링크 데이터 프레임의 소스 변수 열과 동일한 
# 순서여야합니다. 현재 그룹화 변수 만 허용됩니다.

# > MisNodes
#                name   group   size
# 1             Myriel     1     15
# 2           Napoleon     1     20
# 3    Mlle.Baptistine     1     23

# Source
# character string naming the network source variable in the Links data frame.


# Target
# character string naming the network target variable in the Links data frame.



# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)


# Load energy projection data
URL <- paste0(
  "https://cdn.rawgit.com/christophergandrud/networkD3/",
  "master/JSONdata/energy.json")

# data : https://cdn.rawgit.com/christophergandrud/networkD3/master/JSONdata/energy.json
# 

Energy <- jsonlite::fromJSON(URL)
Energy

#
#$nodes
#                                 name
#1                Agricultural 'waste'
#2                      Bio-conversion
#3                              Liquid
#4                              Losses

# $links
#     source target   value
#1       0      1     124.729
#2       1      2       0.597
#3       1      3      26.862
#4       1      4     280.322


# Plot
sankeyNetwork(Links = Energy$links, Nodes = Energy$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name",
              units = "TWh", fontSize = 12, nodeWidth = 30)

# radialNetwork
URL <- paste0(
  "https://cdn.rawgit.com/christophergandrud/networkD3/",
  "master/JSONdata//flare.json")

## Convert to list format
Flare <- jsonlite::fromJSON(URL, simplifyDataFrame = FALSE)
Flare
# Use subset of data for more readable diagram
Flare$children = Flare$children[1:3]

radialNetwork(List = Flare, fontSize = 10, opacity = 0.9)

##
diagonalNetwork(List = Flare, fontSize = 10, opacity = 0.9)


## dendroNetwork
hc <- hclust(dist(USArrests), "ave")

dendroNetwork(hc, height = 600)


### REF : https://christophergandrud.github.io/networkD3/
