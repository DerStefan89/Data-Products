library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <-  dashboardPage(
    dashboardHeader(title = "Car Data"),
    dashboardSidebar(),
    dashboardBody(
        box(plotOutput("correlation_plot"), width = 8),
        box(
            selectInput("feature", "Feature:",
                        c("cyl", "disp", "hp", "drat","wt", "qsec", "vs", "am", "gear", "carb")), width = 4
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$correlation_plot <- renderPlot({
        plot(mtcars$mpg, mtcars[[input$feature]],
             xlab = "MPG", ylab = "Feature")
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)