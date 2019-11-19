library(shiny)

ui <- bootstrapPage(
  column(100, offset = 10, titlePanel("Uebung 7 Doess Rohrer", col("red"))) ,
  sidebarPanel(
    
  selectInput(inputId = "colour",
              label = "Farbe:",
              choices = c("red", "blue", "green", "white"),
              selected = "white"),
  selectInput(inputId = "n_breaks",
              label = "Anzahl der Breaks:",
              choices = c(10, 20, 35, 50),
              selected = 20),
  selectInput(inputId = "kernel",
              label = "Kernschätzer:",
              choices = c("rectangular", "gaussian", "epanechnikov"),
              selected = "gaussian"),
  
  checkboxInput(inputId = "individual_obs",
                label = strong("Show individual observations"),
                value = FALSE),
  
  checkboxInput(inputId = "density",
                label = strong("Show density estimate"),
                value = FALSE),
  
  # Display this only if the density is shown
  conditionalPanel(condition = "input.density == true",
                   sliderInput(inputId = "bw_adjust",
                               label = "Bandwidth adjustment:",
                               min = 0.01, max = 2, value = 1, step = 0.01)
  )),
  mainPanel(
    plotOutput("main_plot"),
    titlePanel(
      "supported by: https://shiny.rstudio.com/gallery/faithful.html"
    )
    
  )
  
)

server <- function(input, output) {
  output$main_plot <- renderPlot({
    
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Duration (minutes)",
         main = "Geyser eruption duration",
         col = input$colour)
    
    if (input$individual_obs) {
      rug(faithful$eruptions)
    }
    
    if (input$density) {
      kernel <- input$kernel
      dens <- density(faithful$eruptions,
                      adjust = input$bw_adjust,
                      kernel= kernel)
      lines(dens, col = "blue")
    }
    
  })
}

shinyApp(ui = ui, server = server)