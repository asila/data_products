library(shiny)

# Define UI for plant co2 uptake
shinyUI(pageWithSidebar(
    
    # Application title
    div(headerPanel("Plant Co2 uptake: Coursera data products project"),style = "color:green"),
    
    # Sidebar with controls to select the variable to plot against co2 uptake
    # and to specify whether outliers should be included
    sidebarPanel(
        p("From the datasets library in R-CRAN we use make use of CO2 dataset. The CO2 data frame has 84 rows and 5 columns of data from an experiment on the cold tolerance of the grass species Echinochloa crus-galli. This app by default it shows the first six observations of the CO2 dataset. Boxplot is drawn for co2 plant uptake versus the variable user selected to see how the uptake is distributed. In addition to the boxplot a summary of a linear model fitting the co2 uptake against the variable selected from th dropdown list is given at the bottom."  ),
        p("To correctly use this app, select the number of observation to view. The default is set to 6"),
        numericInput("obs", "Number of observations to view:", 6),
        selectInput("variable", "Variable:",
                    list("Type" = "Type", 
                         "Treatment" = "Treatment", 
                         "Concentration" = "conc")),
        
        checkboxInput("outliers", "Show outliers", FALSE)
    ),
    
    # Show the caption and plot of the requested variable against mpg
    mainPanel(
        h4("Number of observations selected to view:"),
        tableOutput("view"),
        
        h3(textOutput("caption")),
        
        plotOutput("co2Plot"),
        
        h4("Fit a linear model for the selected variable"),
        tableOutput("aov")
    )
))
