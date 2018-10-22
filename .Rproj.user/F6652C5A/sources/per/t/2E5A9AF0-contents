
##  01. shiny 설치하기
##  02. 예제 확인하기
## 01. shiny 설치하기
## 01. shiny 설치하기
## 01. shiny 설치하기


## ====================
##  01. shiny 설치하기
## ====================
install.packages("shiny")
library(shiny)

## Github 설치 방법
'''
install.packages("devtools")
devtools::install_packages("rstudio/shiny")
'''

## ====================
##  02. 예제 확인하기 
## ====================
runExample()
runExample("01_hello")
runExample("04_mpg")
runExample("08_html")

install.packages("shinydashboard")

library(shinydashboard)

# install.packages("leaflet") # error 발생시 설치 후, 재실행

### github의 username, repo이름, 폴더를 이용하여
### 경로내의 shiny 앱을 가져와 실행이 가능
### 필요한 패키지 설치 필요. 
runGitHub(repo="shiny-examples", username="rstudio",
                 subdir="086-bus-dashboard")

## 51-movie-explorer 실행하기
install.packages(c('shiny', 'ggvis', 'dplyr', 'RSQLite'))
runGitHub(repo="shiny-examples", username="rstudio",
          subdir="051-movie-explorer")

runGitHub(repo="shiny-examples", username="rstudio",
          subdir="050-kmeans-example")


## ====================
##  03. 기본 소스 코드
## ====================
library(shiny)
ui <- fluidPage()
server <- function(input, output){ }
shinyApp(ui=ui,server=server)


## ====================
##  04. 기본 소스 코드(확장)
## ====================
library(shiny)
ui <- fluidPage(
  titlePanel(),
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
)

server <- function(input, output){ 

}
shinyApp(ui=ui,server=server)


## ====================
##  05. 기본 소스 코드(확장)
## ====================
library(shiny)
ui <- fluidPage(
  titlePanel("test"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = 'slider1',
        label='slider',
        min=0,
        max=100,
        value=50
      ),
      
      dateInput(
        inputId = 'date',
        label='Date input',
        value='2014-01-01'
      ),
      
      fileInput(
        inputId = "file",
        label = "File input"
      )
    ),
    mainPanel("mainPanel Area")
  )
)
# 입력받은 데이터를 사용하기 위한 input 변수
#  --> input는 웹 페이지의 입력을 통해 들어온다.
# Output 함수로 출력된 결과물을 저장을 위한 output
#  --> output는 웹 페이지에 R연산 결과물을 저장하기 위해 사용.
# R객체를 web에서 사용하기 위한 render함수
server <- function(input, output){ 
  output$plot1 <- renderPlot({
    plot(input$slider1)
  })
}
shinyApp(ui=ui,server=server)


## ====================
##  05. 기본 소스 코드(확장)
## ====================
library(shiny)
ui <- fluidPage(
  titlePanel("test"),
  sidebarLayout(
    sidebarPanel()
    ,
    mainPanel(
      # Output: Histgram
      plotOutput(outputId="distPlot")
    )
  )
)
server <- function(input, output){ 
  output$distPlot <- randerPlot({ 
    # data <- faithful[faithful$eruptions >3, ]
    # plot(data)
    # R코드 문법
  })
}
shinyApp(ui=ui,server=server)


