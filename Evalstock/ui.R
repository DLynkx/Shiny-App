#' Downloading and plotting stock prices for visual inspection
#'
#' The app allows you to compare the stock prices of 3 selected stock over a
#' period at a time. The version 1.0 limits you to 10 pre-selected stocks
#' Apple - AAPL, Anglo Gold - AU, Boeing - BA, General Electric - GE, Google - GOOG,
#' Microsoft - MSFT, Newmont _ NEM, Pfizer Inc - PFE, Virgin Galactic Holdings Inc - SPCE,
#' and Walmart Inc - WMT.
#' 
#' @param Symb1 is the ticker code of the stock of interest
#' @param Symb2 is the ticker code of the stock of interest
#' @param Symb3 is the ticker code of the stock of interest
#' @param Get Stock is the ticker code of the stock of interest
#' @param dates of interest provides for you to enter the start and end dates for
#' the evaluation period
#' @return A plot of selected stocks
#' @author Franklin X. Dono
#' @description The app requires you to select 3 (for comparison) out of 10 selected
#' stocks by tickers and a period of interest for it to plot.
#' @importFrom quantmod, tidyr, dplyr, shiny, ggplot2



# Load libraries

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Historical stock prices"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
        selectInput("symb1", "Symbol", c("AAPL", "AU", "BA", "GE", "GOOG", "MSFT", "NEM", "PFE", "SPCE", "WMT"), selected = "AAPL"),
        selectInput("symb2", "Symbol", c("AAPL", "AU", "BA", "GE", "GOOG", "MSFT", "NEM", "PFE", "SPCE", "WMT")),
        selectInput("symb3", "Symbol", c("AAPL", "AU", "BA", "GE", "GOOG", "MSFT", "NEM", "PFE", "SPCE", "WMT")),
            dateRangeInput("dates", "Period of interest", start = "2013-01-01", end = "2020-11-16"),
            submitButton("Get Stock")
         
        ),

        # Show a plot of the selected stocks
        mainPanel(
            plotOutput("distPlot"),
            uiOutput('columns')
        )
    )
))
