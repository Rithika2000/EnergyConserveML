
library(shiny)
library(ggplot2)
library(dplyr)

# Assuming you have loaded your dataframe df2_filtered earlier in your code
# Group by the bins and calculate the average daily electricity consumption

library(tidyverse)
file <- "/Users/rithikagurram/Documents/IDS Project/final_data.csv"
df2_filtered <- read.csv(file)
df2_filtered


ui <- fluidPage(
  titlePanel("Energy Consumption Analysis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("county", "Select County:", 
                  choices = c("All" = "All", unique(df2_filtered$in.county))),
      dateRangeInput("dateRange", "Select Date Range:", 
                     start = min(df2_filtered$day), end = max(df2_filtered$day))
    ),
    mainPanel(
      plotOutput("totalEnergyPlot"),
      plotOutput("countyEnergyPlot"),
      plotOutput("cityEnergyPlot"),
      plotOutput("applianceEnergyPlot"),
      
    )
  )
)

server <- function(input, output) {
  
  # Reactive expression for filtered data
  filteredData <- reactive({
    if (input$county == "All") {
      df2_filtered %>%
        filter(day >= input$dateRange[1], day <= input$dateRange[2])
    } else {
      df2_filtered %>%
        filter(in.county == input$county, day >= input$dateRange[1], day <= input$dateRange[2])
    }
  })
  
  # Total energy consumption plot
  output$totalEnergyPlot <- renderPlot({
    data <- tryCatch({
      filteredData()
    }, error = function(e) {
      return(data.frame())  # Return an empty data frame in case of error
    })
    
    if (nrow(data) > 0) {
      unique_dates <- unique(data$day)
      num_colors <- length(unique_dates)
      color_palette <- viridisLite::viridis(num_colors)  # Using the viridis color palette
      
      ggplot(data, aes(x = day, y = daily_total_electricity, fill = as.factor(day))) +
        geom_bar(stat = "identity") +
        scale_fill_manual(values = color_palette) +
        labs(title = "Daily Energy Usage Patterns", x = "Day", y = "Total Energy") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
              axis.title.x = element_text(size = 14),
              axis.title.y = element_text(size = 14),
              axis.text = element_text(size = 10),
              axis.text.x = element_text(angle = 45, hjust = 1))
    }
  })
  
  # Energy consumption by appliances plot (Scatter Plot)
  output$applianceEnergyPlot <- renderPlot({
    # Assuming df2_filtered is your dataframe
    library(ggplot2)
    
    ggplot(df2_filtered, aes(x = day, y = daily_total_electricity)) +
      geom_point(size = 0.5, color = "#d73027", alpha = 0.7) +  # Using a different color
      labs(title = "Daily Energy Consumption vs Date",
           x = "Date",
           y = "Daily Energy Consumption") +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14),
            axis.text = element_text(size = 10),
            axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  # Energy consumption by county plot (Box Plot)
  output$countyEnergyPlot <- renderPlot({
    # Assuming df2_filtered is your dataframe
    ggplot(df2_filtered, aes(x = in.county, y = daily_total_electricity)) +
      geom_boxplot(fill = "#4daf4a", alpha = 0.7) +  # Using a different color
      labs(title = "Distribution of Energy Usage in the month July by County",
           x = "County",
           y = "Daily Energy Consumption",
           caption = "Source: Your Company") +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14),
            axis.text = element_text(size = 10),
            axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  # Daily total electricity consumption by city (Stacked Bar Plot)
  output$cityEnergyPlot <- renderPlot({
    data <- tryCatch({
      filteredData()
    }, error = function(e) {
      return(data.frame())  # Return an empty data frame in case of error
    })
    
    if (nrow(data) > 0) {
      ggplot(data, aes(x = day, y = daily_total_electricity, fill = in.city)) +
        geom_bar(stat = "sum") +
        labs(title = "Daily Total Energy used by City", x = "Day", y = "Daily Total Energy") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
              axis.title.x = element_text(size = 14),
              axis.title.y = element_text(size = 14),
              axis.text = element_text(size = 10),
              axis.text.x = element_text(angle = 45, hjust = 1))
    }
  })
  
}

shinyApp(ui = ui, server=server)