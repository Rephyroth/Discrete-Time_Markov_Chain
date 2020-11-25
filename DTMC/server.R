library(shiny)
library(markovchain)
shinyServer(
  function(input,output)
  {
    #se crea un evento cuando se oprime el boton , se toman los valores de los inputs para llenar lo necesario para el modelo 
    matr <- eventReactive(input$btnsend,{ statesNames= c(input$fnam,input$snam,input$tnam)
    output$tst <- renderText("Matrix")  
    # se guarda la matriz en una variable para luego imprimirla 
    a<-matrix(c(input$p,input$sg,input$t,input$c,input$q,input$s,input$se,input$o,input$n),nrow = 3,byrow = TRUE, dimnames =list(statesNames,statesNames))
    print("Matrix:")
    print(a)
    })        
    #se crea un evento cuando se oprime el boton , se toman los valores de los inputs para llenar lo necesario para el modelo 
    pasos <- eventReactive(input$btnsend,{ statesNames= c(input$fnam,input$snam,input$tnam)
    mc<-new("markovchain",transitionMatrix=matrix(c( input$p,input$sg,input$t,input$c,input$q,input$s,input$se,input$o,input$n),nrow = 3,byrow = TRUE, dimnames =list(statesNames,statesNames)))
    # se guarda el objeto markoviano en una variable para luego imprimiro
    #se utiliza el ^ para elevar la matriz al valor de los pasos 
    a<-mc^input$steps
    print("Steps Probabilities: ")
    print(a)
    })      
    #se crea un evento cuando se oprime el boton , se toman los valores de los inputs para llenar lo necesario para el modelo 
    draw <- eventReactive(input$btnsend,{ statesNames= c(input$fnam,input$snam,input$tnam)
    mc<-new("markovchain",transitionMatrix=matrix(c( input$p,input$sg,input$t,input$c,input$q,input$s,input$se,input$o,input$n),nrow = 3,byrow = TRUE, dimnames =list(statesNames,statesNames)))
    # plot es para dibujar el diagrama 
    plot(mc)
     })
    #se crea un evento cuando se oprime el boton , se toman los valores de los inputs para llenar lo necesario para el modelo 
    steadys <- eventReactive(input$btnsend,{ statesNames= c(input$fnam,input$snam,input$tnam)
    output$steadys <- renderText("SteadyStates:")
    mc<-new("markovchain",transitionMatrix=matrix(c( input$p,input$sg,input$t,input$c,input$q,input$s,input$se,input$o,input$n),nrow = 3,byrow = TRUE, dimnames =list(statesNames,statesNames)))
    # se guarda el objeto markoviano en una variable para luego imprimiro
    # se utiliza steadystates para saber la probabilidad en el estado estable
     a<- steadyStates(mc)
    print("SteadyStates Probabilities: ")
    print(a)
    
    }) 
    #se crea un evento cuando se oprime el boton , se toman los valores de los inputs para llenar lo necesario para el modelo 
    transp <- eventReactive(input$btnsend,{ statesNames= c(input$fnam,input$snam,input$tnam)
    mc<-new("markovchain",transitionMatrix=matrix(c( input$p,input$sg,input$t,input$c,input$q,input$s,input$se,input$o,input$n),nrow = 3,byrow = TRUE, dimnames =list(statesNames,statesNames)))
    # se guarda el objeto markoviano en una variable para luego imprimiro
    # se utiliza transitionProbability para obtener la probabilidad de que de un estado llegue a otro 
     a<- transitionProbability(mc,t0=input$ftra,t1=input$stra)
    print("Transition Probability: ")
    print(a)
    
    })
    # se mandan como output los eventos creados para cuando se da click en el boton 
    output$mat <- renderPrint({matr()})
    output$st <- renderPrint({pasos()})
    output$steady <- renderPrint({steadys()})
    output$chainplot <- renderPlot({draw()}) 
    output$tran <- renderText({transp()})
    
          
    
    
  }
  
)