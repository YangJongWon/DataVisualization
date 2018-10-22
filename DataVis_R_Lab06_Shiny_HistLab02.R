library(shiny)
ui <- fluidPage(
  # *Input()  함수로 입력받는 요소 
  # *Output() 함수로 결과물을 출력 후, 배치 
  
  ## titlePanel, sidebarLayout, mainPanel로 구성 
  # App title 
  titlePanel("Hello My Shiny!"),
  
  # sidebarLayout
  # sidebar panel for inputs
  sidebarLayout (
    
    sidebarPanel(
      
      # Input : bins의 수를 slider로 구현
      sliderInput(inputId="bins",
                  label = "Number of bins:",
                  min=1,
                  max=50,
                  value=30)
    ),
    
    mainPanel(
      # Output: Histgram
      plotOutput(outputId="distPlot")
    )
  )
)

server <- function(input, output){ 
  output$distPlot <- renderPlot( {
    x = faithful$waiting
    bins = seq(min(x), max(x), length.out=input$bins + 1)
    
    hist(x, breaks=bins, col="#75AADB")
  })
  
}
shinyApp(ui=ui,server=server)
