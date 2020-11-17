# Load libraries

library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)
library(quantmod)

# Define server logic required to draw stock prices
shinyServer(function(input, output) {

output$distPlot <- renderPlot({  
        symb <- c(input$symb1, input$symb2, input$symb3)
        mystock <- lapply(symb, function(x) {getSymbols(x, from = input$dates[1] , to = input$dates[2], periodicity = "daily", auto.assign = FALSE)})
        names(mystock) <- symb
    
        adj.prices <- lapply(mystock, Ad)
        adj.prices <- do.call(merge, adj.prices )
        stocks <- as.data.frame(adj.prices) %>% gather(index, price) %>% mutate(time = rep(time(adj.prices), length(symb)))

        # draw the stock price
        g <- ggplot(stocks, aes(time, price, color = index))
        g <- g + geom_line()
        g
        })
})
