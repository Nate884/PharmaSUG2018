library(shiny)
library(shinydashboard)
library("haven")
library("ggplot2")

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(fluidPage(  radioButtons("variable", "Variable:",
                                         c("Arm" = "ARM",
                                           "Country" = "COUNTRY",
                                           "Age" ="AGE",
                                           "Race" = "RACE")),
                            plotOutput("plot"))
)
)



dm <-read_sas("C:\\HOW\\Day 2\\HT 03 - Saranya Duraisamy and Nate Mockler\\Day2\\dm.sas7bdat")


server <- function(input, output) {
  output$plot <- renderPlot({
    
    ggplot(dm, aes_string(input$variable)) + geom_bar() + facet_wrap(~SEX)
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
