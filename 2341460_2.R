

# ===============================
# R SHINY APP: CLUSTER SAMPLING
# ===============================

library(shiny)
library(ggplot2)

# -------------------------------
# UI
# -------------------------------
ui <- fluidPage(
  
  titlePanel("Cluster Sampling Design – Population Mean Estimation"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("clusters",
                  "Number of Clusters:",
                  min = 2,
                  max = 10,
                  value = 6),
      
      sliderInput("units",
                  "Units per Cluster:",
                  min = 10,
                  max = 50,
                  value = 20),
      
      numericInput("cost",
                   "Cost per Cluster (₹):",
                   value = 1500),
      
      numericInput("time",
                   "Time per Cluster (hours):",
                   value = 3)
    ),
    
    mainPanel(
      plotOutput("clusterPlot"),
      hr(),
      h4("Survey Summary"),
      verbatimTextOutput("summary")
    )
  )
)

# -------------------------------
# SERVER
# -------------------------------
server <- function(input, output) {
  
  generate_data <- reactive({
    set.seed(123)
    data <- data.frame()
    
    for (i in 1:input$clusters) {
      x <- rnorm(input$units, mean = i * 5, sd = 0.6)
      y <- rnorm(input$units, mean = i * 5, sd = 0.6)
      value <- rnorm(input$units, mean = 50 + i, sd = 5)
      
      temp <- data.frame(
        Cluster = paste("Cluster", i),
        X = x,
        Y = y,
        Value = value
      )
      
      data <- rbind(data, temp)
    }
    data
  })
  
  output$clusterPlot <- renderPlot({
    ggplot(generate_data(),
           aes(x = X, y = Y, color = Cluster)) +
      geom_point(size = 3) +
      labs(title = "Cluster Sampling Design",
           x = "Unit Dimension 1",
           y = "Unit Dimension 2") +
      theme_minimal()
  })
  
  output$summary <- renderText({
    
    data <- generate_data()
    
    population_mean <- mean(data$Value)
    total_cost <- input$clusters * input$cost
    total_time <- input$clusters * input$time
    
    paste(
      "Estimated Population Mean:", round(population_mean, 2), "\n",
      "Number of Clusters:", input$clusters, "\n",
      "Units per Cluster:", input$units, "\n",
      "Expected Total Cost (₹):", total_cost, "\n",
      "Expected Total Time (hours):", total_time, "\n",
      "Sampling Bias: Possible if clusters are internally homogeneous"
    )
  })
}

# -------------------------------
# RUN APP
# -------------------------------
shinyApp(ui = ui, server = server)
