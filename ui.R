library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Survivor - Titanic Edition"),
    
    # Sidebar with a passenger profile
    sidebarLayout(
        sidebarPanel(
            h3("Passenger Profile"),
            radioButtons("Sex", "Gender:",
                         list("Male" = "1",
                              "Female" = "2"
                           )),
            radioButtons("Pclass","Socio-ecnomic status:",
                         list("Upper" = "1",
                              "Middle" = "2",
                              "Lower" = "3"
                         )),
            sliderInput("Age",
                        "Age:",
                        min = 1,
                        max = 99,
                        value = 30),
            sliderInput("SibSp", "How many Siblings/Spouses Aboard:",
                        min = 0,
                        max = 10,
                        value = 0),         
            sliderInput("Parch", 
                        "How many Parents/Children Aboard:", 
                        min = 0,
                        max = 10,
                        value = 0)         
        ),        
        # Show a plot of the generated distribution
        mainPanel(
            h3("Description"),
            p("On April 15, 1912, the RMS Tatanic sank after colloding with an iceberg at her maiden voyage.
             1502 out of 2224 passengers and crew were killed in this tragedy. Your challenge is to compile
             a passenger profile who is likely to survive in this diaster."),
            h3("How to construct a passenger profile?"),
            p("Please use the side bar panel on the left to create a passenger profile. 
             Any change on these variables will be processed immedately for the result."),
            hr(),
            h2("The passenger's fate:"),
            h4(textOutput("message")),
            imageOutput("preImage")
        )
    )
))
