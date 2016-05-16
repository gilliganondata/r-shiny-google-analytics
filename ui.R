
library(shiny)

shinyUI(fluidPage(
  
  # This feels a little hacky, but the default <h2> is just too big.
  HTML('<style type="text/css">h2 {font-size: 150%;}</style>'),
  
  # Application title
  titlePanel(
    "Traffic Explorer"),
  
  fluidRow(
    column(4,wellPanel(
      
      # 'start' is hacked to default to the last six months; this needs to be cleaned up  
      dateRangeInput('dateRange',
                     label = 'Select date range:',
                     start = as.Date(format(Sys.Date()-180, "%Y-%m-01")), end = as.Date(format(Sys.Date(), "%Y-%m-01")) - 1
      ),
      
      # Brand Selector
      uiOutput("brandSelector"),
    
      # X Dimension Selector
      uiOutput("dimXSelector"),
      
      # Y Dimension Selector
      uiOutput("dimYSelector"),
    
       # Date Granularity
      uiOutput("granularitySelector"),
           
      # Metric Selector
      uiOutput("metricSelector")
    
    )),
    
    column(8,plotOutput("plotTotal"),
           hr(),
           plotOutput("plotTrends"))
    )))
