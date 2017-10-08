library(shiny)
shinyServer(function(input, output) {

  mtcars4 <- mtcars[mtcars$cyl==4,]
  mtcars6 <- mtcars[mtcars$cyl==6,]
  mtcars8 <- mtcars[mtcars$cyl==8,]
  model1 <- lm(mpg ~ hp, data = mtcars)
  model2 <- lm(mpg ~ hp, data = mtcars4)
  model3 <- lm(mpg ~ hp, data = mtcars6)
  model4 <- lm(mpg ~ hp, data = mtcars8)
  
  model1pred <- reactive({
    hpInput <- input$sliderhp
    predict(model1, newdata = data.frame(hp = hpInput))
  })
  
  model2pred <- reactive({
    hpInput <- input$sliderhp
    predict(model2, newdata = data.frame(hp = hpInput))
  })
  
  model3pred <- reactive({
    hpInput <- input$sliderhp
    predict(model3, newdata = data.frame(hp = hpInput))
  })
  
  model4pred <- reactive({
    hpInput <- input$sliderhp
    predict(model4, newdata = data.frame(hp = hpInput))
  })
  
  output$plot1 <- renderPlot({
    hpInput <- input$sliderhp
    
    plot(mtcars$hp, mtcars$mpg, ylab = "Miles Per Gallon", 
         xlab = "Horsepower", bty = "n", pch = 16, col=factor(mtcars$cyl),
         ylim = c(10, 35), xlim = c(50, 350))
    if(input$showModel1){
      abline(model1, col = "blue", lwd = 2)
      points(hpInput, model1pred(), col = "blue", pch = 19, cex = 2)
    }
    if(input$showModel2){
      abline(model2, col = "black", lwd = 2)
      points(hpInput, model2pred(), col = "black", pch = 19, cex = 2)
    }
    if(input$showModel3){
      abline(model3, col = "red", lwd = 2)
      points(hpInput, model3pred(), col = "red", pch = 19, cex = 2)
    }
    if(input$showModel4){
      abline(model4, col = "green", lwd = 2)
      points(hpInput, model4pred(), col = "green", pch = 19, cex = 2)
    }

    legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction","Model 3 Prediction", "Model 4 Prediction"), pch = 16, 
           col = c("blue", "black","red", "green"), bty = "n", cex = 1.2)

  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
  
  output$pred3 <- renderText({
    model3pred()
  })
  
  output$pred4 <- renderText({
    model4pred()
  })
})