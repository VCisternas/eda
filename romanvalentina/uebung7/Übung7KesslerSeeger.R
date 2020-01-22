
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel("Histogram: Faithful dataset -durations of eruptions"),

    #Input
    selectInput(inputId = "breaks",
                label = "Number of bins in histogram (approximate):",
                choices = c(10, 20, 35, 50),
                selected = 20),
    
    selectInput(inputId = "kern",
                label = "kernel for the histogram:",
                choices = c("epanechnikov","gaussian", "rectangular"),
                selected = "rectangular"),
    
    
    checkboxInput(inputId = "individual_obs",
                  label = strong("Show individual observations"),
                  value = FALSE),
    
    checkboxInput(inputId = "density",
                  label = strong("Show density estimate"),
                  value = FALSE),
    
    plotOutput(outputId = "main_plot", height = "300px"),
    
    # Display this only if the density is shown
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",
                                 label = "Bandwidth adjustment:",
                                 min = 0.01, max = 2, value = 1, step = 0.1)
    )
)


# Define server logic required to draw a histogram
server<-function(input, output) {
    
    output$main_plot <- renderPlot({
        
        hist(faithful$eruptions,
             probability = TRUE,
             breaks = as.numeric(input$breaks),
             xlab = "Duration (minutes)",
             main = "Eruption duration")
        
        if (input$individual_obs) {
            rug(faithful$eruptions)
        }
        
        if (input$density) {
            dens <- density(faithful$eruptions,
                            kernel=input$kern,
                            adjust = input$bw_adjust)
            lines(dens, col = "blue")
        }
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
