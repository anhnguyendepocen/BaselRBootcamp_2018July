# Load packages
library(shiny)
library(tidyverse)
library(DT)

# Load data
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
        
        textInput(inputId = "subtitle",
                  label = "Subtitle",
                  value = ""),
        
        textInput(inputId = "caption",
                  label = "Caption",
                  value = ""),
         
         selectInput(inputId = "x",
                     label = "x",
                     choices = names(data)),
         
         selectInput(inputId = "y",
                     label = "y",
                     choices = names(data)),
        
        selectInput(inputId = "color",
                    label = "Point colors",
                    choices = colors(),
                    selected = "black"),
         
         sliderInput("alpha",
                     "alpha",
                     min = 0,
                     max = 1,
                     value = 1),
        
         sliderInput("size",
                     "size",
                     min = 0,
                     max = 10,
                     value = 1, step = .2),
        
         checkboxInput(inputId = "smooth",
                       label = "Add Regression line?",
                       value = FALSE),
        
         downloadButton(outputId = "downloadPlot",
                        label = "Download Plot!")

      ),

      mainPanel(

              tabsetPanel(type = "tabs",
                          
                  # Description Tab
                          
                  tabPanel("Description",
                           h3("This is my first Shiny App!"),
                           p("I wrote this app as part of the Basel R Bootcamp"),
                           a("Click me to go to the Shiny page",
                             href = "https://shiny.rstudio.com/gallery/")),
                  
                  # Plot Tab
                  
                  tabPanel("Plot", br(), plotOutput("my_plot")),
                  
                  # Table tab
                  tabPanel("Data", br(), dataTableOutput("table"))
                  
      )
      )
   )
)

# Server --------------------------------

server <- function(input, output) {

  # Create my_plot
  my_plot <- reactive({
    
    p <- ggplot(data = data,
                aes_string(x = input$x, 
                           y = input$y)) + 
      geom_point(alpha = input$alpha, 
                 col = input$color,
                 size = input$size) +
      labs(title = input$title,
           subtitle = input$subtitle,
           x = input$x,
           y = input$y,
           caption = input$caption) +
      theme_minimal()
    
    
    if(input$smooth) {
      
      p <- p + geom_smooth(method = "lm")
      
    }
    
    # Return the plotting object!
    p
    
  })
  
  # Send my_plot to output
   output$my_plot <- renderPlot({
           
     my_plot()
    
   })

   # Generate a summary of the data ----
   output$table <- renderDT({
    
     datatable(data %>%
                 select(1:8))
     
   })
   
   # Download!
   output$downloadPlot <- downloadHandler(
     filename = "myplot.png",
     content = function(file) {
       ggsave(file, plot = my_plot(), device = "png")
     }
   )
   
}

# Run the application
shinyApp(ui = ui, server = server)

