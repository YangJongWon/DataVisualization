shinyUI(pageWithSidebar (
     headerPanel("Example Hello Shiny"),
     sidebarPanel( 
          sliderInput("obs", "", 0, 1000, 500)
     ),
     mainPanel(
       plotOutput("distPlot")
     )
))