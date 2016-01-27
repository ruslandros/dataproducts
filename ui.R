shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Average Goods price by State"),
    sidebarPanel(
#      numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
      selectInput("goods", "Goods Name:",
                  c("Lamb" = "lamb",
                    "Beef" = "beef",
                    "Chicken" = "chicken")),
            submitButton('Submit'),
      
      br(),
      br(),
      tags$a(href="https://ruslandros.shinyapps.io/readme-goods-price/", "README supporting documentation")
      
    ),
    mainPanel(
      h3('Results of Query'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
        tableOutput('newTable'),
      h4('Average price for goods per kilogram in MYR'),
      verbatimTextOutput("avg")
    )
  )
)