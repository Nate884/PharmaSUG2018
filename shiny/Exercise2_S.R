library("haven")
library("ggplot2")

dm <-read_sas("C:\\HOW\\Day 2\\HT 03 - Saranya Duraisamy and Nate Mockler\\Day2\\dm.sas7bdat")

ui <- fluidPage(  radioButtons("variable", "Variable:",
                               c("Arm" = "ARM",
                                 "Gender" = "SEX",
                                 "Country" = "COUNTRY",
                                 "Age"= "AGE",
                                 "Race" = "RACE")),
                  plotOutput("plot")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    
    ggplot(dm, aes_string(input$variable)) + geom_bar() + facet_wrap(~SEX)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
