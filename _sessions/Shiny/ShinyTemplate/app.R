# Load packages
library(shiny)
library(tidyverse)
library(DT)

# Load data
# You must have a "1_Data" folder inside of your app folder!

data <- read_csv("1_Data/baselers.csv") %>%
  slice(1:500)

# User Interface ---------------

ui <- fluidPage(
  
  # Title
  titlePanel("My First Shiny App!"),
  
  # Sidebar Layout
  sidebarLayout(
    
    sidebarPanel(
      
      textInput(inputId = "title",
                label = "Title",
                value = "Plot Title"),
  
      # Add subtitle
      
      # Add caption
      
      # Add x
      
      # Add y
      
      # Add color
      
      # Add alpha
      
      sliderInput("size",
                  "size",
                  min = 0,
                  max = 5,
                  value = 1, 
                  step = .1)
      
      
      # Add smooth
      
      # Add downloadPlot
      
    ),
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                  # Plot Tab
                  
                  tabPanel("Plot", br(), plotOutput("my_plot")),
                  
                  # Description Tab
                  
                  tabPanel("Description",
                           h3("text text text"),
                           p("text text text"))
                  
                  
                  # Add Table tab
   
                  
      )
    )
  )
)

# Server --------------------------------

server <- function(input, output) {
  
  # Create my_plot
  my_plot <- reactive({
    
    p <- ggplot(data = data,
                aes_string(x = "age", 
                           y = "income")) + 
      geom_point(alpha = 1, 
                 col = "black",
                 size = input$size) +
      labs(title = input$title,
           subtitle = "My Subtitle",
           x = "age",
           y = "income",
           caption = "My Caption") +
      theme_minimal()
    
    
    # ADD smooth
    
    
    # Return the plotting object!
    print(p)
    
  })
  

  
  # Send my_plot to output
  output$my_plot <- renderPlot({
    
    my_plot()
    
  })
  
  
  # Add output$table

  # Add  output$downloadPlot!

  
  
}

# Run the application
shinyApp(ui = ui, server = server)

