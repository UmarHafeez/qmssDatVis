#Hw1 UI
#Umar Hafeez

library(shiny)
# ui.R

shinyUI(fluidPage(
  titlePanel("Keywords from tweets per Candidate"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a specific candidate, visualize the most prominent words from tweets associated with each candidate"),
      
      selectInput("var", 
                  label = "Choose a candidate to display",
                  choices = c("Hillary Clinton", "Bernie Sanders",
                              "Ted Cruz", "Marco Rubio","Donald Trump"),
                  selected = "Hillary Clinton"),
      
      sliderInput("range", 
                  label = "Range of time",
                  min = 0, max = 200, value = c(0, 200))
    ),
    
    mainPanel(
      
      plotOutput("wordcloudHC",click = "plot_click"),
      plotOutput("wordcloudBS",click = "plot_click"),
      verbatimTextOutput("info_click"),
      plotOutput("freq_plot")
      
    )
    
  )
  
))