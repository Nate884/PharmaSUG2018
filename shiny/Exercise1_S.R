library(shiny)
library(haven)
dm <-read_sas("C:\\HOW\\Day 2\\HT 03 - Saranya Duraisamy and Nate Mockler\\Day2\\dm.sas7bdat")
ui <-fluidPage(
  radioButtons("variable", "Variable:",
              c("Arm" = "ARM",
                "Country" = "COUNTRY",
                "Age"="AGE",
                "Race" = "RACE")),
  tableOutput("data")
  
)
server <- function(input, output) {
  output$data<-renderTable({
    dm[, c("USUBJID",input$variable), drop = FALSE]
  },rownames= TRUE)
}
# Run the application
shinyApp(ui=ui, server = server) 

