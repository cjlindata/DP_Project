library(shiny)
library(randomForest)

# Define server logic required to draw a histogram
    
    ###### Build A Prediction model using RandForest
    ## Get titanic data set - Kaggle.com 
    tiTrain <- read.csv("./train.csv", stringsAsFactors = FALSE)
    set.seed(1135)  
    ## remove irrlevent columns: PassengerId, Name, Ticket, Fare
    tiTrain <- tiTrain[,-c(1,4,9,10,11,12)]   
    ## convert Sex to Factor type male: 1 , female: 2
    tiTrain$Sex <- as.factor(sapply(tiTrain$Sex,function(x){if(x == 'male') '1' else '2'}))
    tiTrain$Survived <- as.factor(tiTrain$Survived)
    tiTrain$Pclass <- as.factor(tiTrain$Pclass)
    ## Identify NA value and set them to mean of the column value
    ageMean <- round(mean(tiTrain$Age, na.rm = TRUE), digits=1)
    tiTrain$Age[is.na(tiTrain$Age)] <- ageMean

    ## Training model -- RandomForest
    rfmodel <- randomForest(Survived ~ ., data = tiTrain) 

          
    ###### Interact with UI
    # construct input dataframe
    ## variables: pclass,sex,age,sibsp,parch
shinyServer(function(input, output) {
 
 
# Reactive expression to compose a data frame containing all of the values
profileValues <- reactive({
    data.frame(
        Pclass = factor(input$Pclass,levels=c("1","2","3")),
        Sex = factor(input$Sex,levels=c("1","2")),
        Age = as.numeric(input$Age),
        SibSp = as.integer(input$SibSp),
        Parch = as.integer(input$Parch))
    
}) 

# Get prediction result 
result <- reactive({
    toString(predict(rfmodel,profileValues()))
})

# Generate Result message
output$message <- renderText({
    ifelse(result() == "1","The passenger survived","The passenger did not survive")
})

# Send a pre-rendered image, and don't delete the image after sending it
output$preImage <- renderImage({
    if(result() == "1")
        filename <- "./www/TitanicLifeSaver.jpg"
    else
        filename <- "./www/RIP.jpg"
    
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image file", filename))
    
}, deleteFile = FALSE)


})
