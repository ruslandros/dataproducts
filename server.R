
library(data.table)

fama_table <- function(x) {

runcit <- read.csv("RUNCIT_21_JANUARY_2016.csv")

data <- subset(runcit, Nama.Varieti == x)

sort_data <- data[order(-data$Harga.Purata),]

temp <- sort_data[,c(5,7,8, 9)]
names(temp) <- c("Price", "City", "State", "Date")

goods_table <- data.table(temp)
goods_table
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$goods})

    aaa <- reactive ({
      if (input$goods == "chicken") {
        bb <- fama_table("AYAM PROSES (STANDARD)")
    } else if (input$goods == "beef") {
        bb <- fama_table("DAGING PEJAL")
    } else if (input$goods == "lamb") {
        bb <- fama_table("KAMBING (PEJAL)")
    }
    })

    output$newTable <- renderTable(aaa())
    output$avg <- renderPrint({round(mean(aaa()$Price),2)})

    }
)