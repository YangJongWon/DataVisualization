library(shiny)
ui <- fluidPage(
  
  titlePanel("Shiny Text"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="dataset",
                  label="데이터 셋 선택:",
                  choices=c("rock", "pressure", "cars")),
      
      numericInput(inputId='obs',
                   label="관측치의 수",
                   value=10)
      
    ),
    mainPanel(
      # Output:Verbatim text for data summary ----
      verbatimTextOutput("summary"),  #코드 글자
      
      # Output: HTML table
      tableOutput("view")   # 글자 
    )
  )
  

  
  
)

server <- function(input, output){ 
  # selectInput(inputId="dataset"
  # 요청된 데이터 셋이 반환됨.
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = mtcars)
  })
  
  # data
  # verbatimTextOutput("summary")
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # 첫 n개의 관측치를 보여준다.
  output$view <- renderTable({
    head(datasetInput(), n=input$obs)
  })
}
shinyApp(ui=ui,server=server)

## 실습 1. dateset(USArrests, iris, mtcars)를 불러와서 이를 
## 확인해 보자.
## 
data(MASS)
data()
