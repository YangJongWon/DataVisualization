# Interacting with igraph
# Load igraph
library(igraph)

# Use igraph to make the graph and find membership
karate <- make_graph("Zachary")
wc <- cluster_walktrap(karate)
members <- membership(wc)

# Convert to object suitable for networkD3
karate_d3 <- igraph_to_networkD3(karate, group = members)

# Create force directed network plot
forceNetwork(Links = karate_d3$links, Nodes = karate_d3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group')

## 외부 파일로 저장
library(magrittr)

simpleNetwork(networkData) %>%
  saveNetwork(file = 'Net1.html')



# 
#output$force <- renderForceNetwork({
#  forceNetwork(Links = MisLinks, Nodes = MisNodes,
#               Source = "source", Target = "target",
#               Value = "value", NodeID = "name",
#               Group = "group", opacity = input$opacity)
#})

#forceNetworkOutput("force")
#shiny::runGitHub('christophergandrud/networkD3-shiny-example')
