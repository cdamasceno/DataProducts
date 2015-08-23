library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
        
        output$contents <- renderText({
                # input$file1 will be NULL initially. After the user selects
                # and uploads a file, it will be a data frame with 'name',
                # 'size', 'type', and 'datapath' columns. The 'datapath'
                # column will contain the local filenames where the data can
                # be found.
                
                inFile <- input$file1
                
                if (is.null(inFile))
                        return(NULL)
                
                 n <- read.csv(inFile$datapath, header = input$header,
                         sep = input$sep, quote = input$quote)
                 names(n)
        })
      
        
        output$summary <- eventReactive(input$goButton, {
                out <- input$outcome
                
                inFile <- input$file1
                
                if (is.null(inFile))
                        return(NULL)
                n <- read.csv(inFile$datapath, header = input$header,
                              sep = input$sep, quote = input$quote)
                nam <- names(n)
                g <- grep(out,nam)
                form <- paste(nam[g] , "~ .")
                fit <- step(lm(  form, n))
                f <- summary(fit)
                output$summary <- renderPrint(f)
          
        })
        
        
       
})