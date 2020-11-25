library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = "Discrete-Time Markov Chain"),

  sidebarLayout(position = "left",
  
    sidebarPanel(h4("Parameters"),
                 # se introduce los parametros comenzando con los nombres de los estados
                 textInput("fnam","Name of First State",""),
                 textInput("snam","Name of Second State",""),
                 textInput("tnam","Name of Third State",""),
                 #se introduce la matriz
                 numericInput("p","Matriz",0.80,width = "33%"),
                 numericInput("sg","",0.10,width = "33%"),
                 numericInput("t","",0.10,width = "33%"),
                 numericInput("c","",0.03,width = "33%"),
                 numericInput("q","",0.95,width = "33%"),
                 numericInput("s","",0.02,width = "33%"),
                 numericInput("se","",0.2,width = "33%"),
                 numericInput("o","",0.05,width = "33%"),
                 numericInput("n","",0.75,width = "33%"),
                 #se introduce los estados para la probabilidad de transicion
                 textInput("ftra","Name of First State of Transition",""),
                 textInput("stra","Name of Second State of Transition",""),
                 # numero de pasos de la matriz
                 sliderInput("steps",
                             "Number of steps:",
                             min = 1,
                             max = 20,
                             value = 10),
                 actionButton("btnsend", "Send")
                 
                 ),
    mainPanel(h4("Graphs and results"),
        #se imprime los resultados
              plotOutput(outputId = "chainplot", height = "500px"),
              uiOutput("mat"),
              uiOutput("steady"),
              uiOutput("st"),
              textOutput("tran")
              
              
              )
  )


  
  
  
              )
  
    )
