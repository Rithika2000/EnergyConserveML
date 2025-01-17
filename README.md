# Energy Consumption Analysis

## Project Overview

This project focuses on analyzing and predicting energy consumption patterns for an energy company (eSC) serving residential properties in South Carolina and a part of North Carolina. The goal is to understand key drivers of energy usage, explore strategies to reduce energy consumption, and predict future energy demands, particularly in light of potential temperature increases due to global warming.

## Team Members

* Rithika Gurram
* Ramya Chowdary Patchala
* Akshay Joshi
* Hemanth Chowdary Thammeneni
* Kishan


## Project Goals

  * Analyze energy consumption patterns, focusing on July (typically the highest energy usage month).
  * Build predictive models for energy usage.
  * Explore factors affecting energy consumption.
  * Propose strategies to manage peak demand.
  * Assess the impact of potential temperature increases on future energy consumption.
  
## Data Sources

  * Static house data (attributes like size, number of floors, etc.)
  * Energy usage data (hourly usage profiles for each house)
  * Weather data
  
## Methodology

* Data Import and Cleanup
* Exploratory Data Analysis and Visualizations
* Model Development:
    * Linear Regression
    * XGBoost
    * XGBoost with Hyperparameter Tuning
    
* Future Energy Demand Prediction (with 5°C temperature increase)
* Shiny App Development for Interactive Data Exploration

## Key Findings

  * The XGBoost model with hyperparameter tuning achieved the highest accuracy of 88.58% in predicting energy consumption.
  * Future energy consumption is predicted to increase with a 5°C rise in temperature.
  * Weather factors (temperature, humidity, radiation, wind), appliances in buildings, and geographical factors significantly affect energy consumption.
  
## Shiny App

An interactive Shiny app was developed to visualize:

  * Current and predicted energy consumption patterns
  * Energy usage by county and city
  * Impact of temperature increase on energy demand
  
The Shiny app is published at: https://rpatchal.shinyapps.io/EnergyConsumption/

Below are the images of the working of shiny app

<img width="1239" alt="img5" src="https://github.com/user-attachments/assets/d91844fb-5f66-4ca5-a022-efc4327788c3" />


<img width="997" alt="img1" src="https://github.com/user-attachments/assets/c6c389ce-d167-46d3-9d60-7bdf475dfcbc" />


<img width="1061" alt="img2" src="https://github.com/user-attachments/assets/7a761449-b28e-4f76-a622-230851e06eb4" />


<img width="893" alt="img3" src="https://github.com/user-attachments/assets/9b95c151-ef2d-4a4b-8a18-1ddce82390a4" />


<img width="839" alt="img4" src="https://github.com/user-attachments/assets/4b37e4f3-9de2-4aae-a4c3-40fe66e0b9c5" />




## Recommendations

  * Implement Demand Response (DR) programs to manage peak energy demand.
  * Utilize time-variable pricing to encourage off-peak usage.
  * Invest in smart grid technology and IoT devices for efficient energy management.
  * Launch educational initiatives to raise awareness about energy-efficient practices.
  
## Future Work

  * Continuous model monitoring and refinement based on new data.
  * Explore additional factors that may influence energy consumption.
  * Develop more sophisticated prediction models incorporating long-term climate trends.
  
## Tools and Technologies Used
  * R (tidyverse, arrow, data.table, lubridate, caret, xgboost, shiny)
  * Jupyter Notebook
