library(shiny)
require(stats); require(graphics)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
    
    output$distPlot <- renderPlot({
        
        # generate an rnorm distribution and plot it
      degree <- input$degree  
      speed <- input$speed
        plot(cars, xlab = "Speed [mph]", ylab = "Stopping distance [ft]", las = 1, xlim = c(0, 25), lwd = 2, cex.lab = 1.5)
        title(main = "cars data, source:Ezekiel, M. (1930) Methods of Correlation Analysis. Wiley.")
        fm <- lm(dist ~ poly(speed, degree), data = cars)
        assign(paste("cars", degree, sep = "."), fm)
        d <- seq(0, 25, length.out = 200)
        pred <- predict(fm, data.frame(speed = d))
        lines(d, pred, col = 3, lwd = 2)
        y <- predict(fm, data.frame(speed = speed))
        output$y <- renderPrint(y[[1]])
        lines(c(speed,speed), c(0,y), col = 2)
        lines(c(0,speed), c(y,y), col = 2)
        points(speed, y, pch = 10, col = 2)
    })
    output$summary <- renderText({
      h3("text1")
      h4('text2')
    })
})