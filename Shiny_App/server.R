library(shiny)
library(datasets)

# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
co2Data <- CO2

# Define server logic required to plot various variables against co2
shinyServer(function(input, output) {
    
    # Compute the forumla text in a reactive expression since it is 
    # shared by the output$caption and output$co2Plot expressions
    formulaText <- reactive({
       paste("uptake ~", input$variable)
    })
    
    # Return the formula text for printing as a caption
    output$caption <- renderText({
        formulaText()
    })
    # Show the first "n" observations
    output$view <- renderTable({
        head(co2Data, n = input$obs)
    })
    
    # Generate a plot of the requested variable against co2 uptake and only 
    # include outliers if requested
    output$co2Plot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = co2Data,
                outline = input$outliers,
                ylab="CO2 uptake",xlab=input$variable)
    })
    
    #Run anova
    output$aov<-renderTable({
        lm(as.formula(formulaText()), 
                data = co2Data)
    })
      
    
})