library(shiny)
library(lubridate)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Simple Linear Regression Analysis Application"),
        
        # Sidebar with controls to select a dataset and specify the number
        # of observations to view
        sidebarPanel(
                h4("Upload a file in csv format, with the variables in the header." ),

                h4("Once processed the file, the names of the variables will appear at the left side, with a space separating them"),

                  h4("Write the name of the  outcome in the input field at the bottom of the letf side and press SUBMIT.
"), 
                   h4("A best model will be fitted and the summary presented at the right side"),
                h4("The names of the variables will only appear if the right combinations of HEADER, SEPARATOR and QUOTES are chosen"),
                
                fileInput('file1', 'Choose file to upload',
                          accept = c(
                                  'text/csv',
                                  'text/comma-separated-values',
                                  'text/tab-separated-values',
                                  'text/plain',
                                  '.csv',
                                  '.tsv'
                          )
                ),
                tags$hr(),
                checkboxInput('header', 'Header', TRUE),
                radioButtons('sep', 'Separator',
                             c(Comma=',',
                               Semicolon=';',
                               Tab='\t'),
                             ','),
                radioButtons('quote', 'Quote',
                             c(None='',
                               'Double Quote'='"',
                               'Single Quote'="'"),
                             '"'),
               
        textInput("outcome", "Enter the Outcome variable : "),
        actionButton("goButton", "Submit")
        ),
        
        # Show a summary of the dataset and an HTML table with the requested
        # number of observations
        mainPanel(
    
                h4 ("Names of the variables "),
                h4(textOutput("contents")),
                verbatimTextOutput("summary"),
                textOutput("outcome")
         
                
        )
))
