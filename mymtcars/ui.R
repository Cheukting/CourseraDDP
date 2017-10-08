library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict MPG from Horsepower"),
  sidebarLayout(
    sidebarPanel(
      h4("You can predict the mile per gallon of your car by inputing the horsepower and selecting the respective model to predict from."),
      br(),
      sliderInput("sliderhp", "What is the horsepower of your car? (drag to slide)", 50, 350, value = 200),
      br(),
      h4("You can use all data to model or choose the one that matches with the number of cylinders of your car:"),
      br(),
      checkboxInput("showModel1", "Show/Hide Model 1: all data", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Model 2: 4 cylinders", value = FALSE),
      checkboxInput("showModel3", "Show/Hide Model 3: 6 cylinders", value = FALSE),
      checkboxInput("showModel4", "Show/Hide Model 4: 8 cylinders", value = FALSE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h4("Predicted from Model 1 - all data:"),
      textOutput("pred1"),
      h4("Predicted from Model 2 - 4 cylinders:"),
      textOutput("pred2"),
      h4("Predicted from Model 3 - 8 cylinders:"),
      textOutput("pred3"),      
      h4("Predicted from Model 4 - 6 cylinders:"),
      textOutput("pred4")
    )
  )
))
    