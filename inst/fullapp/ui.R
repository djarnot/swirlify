library(shiny)
library(shinyAce)

shinyUI(
  bootstrapPage(div(
    class="container-fluid",
    h1("swirlify authoring app"),
    div(class="row-fluid",
        div(class="span5",
    
    tags$link(
      rel = "stylesheet", 
      href = "http://fonts.googleapis.com/css?family=Source+Sans+Pro"
    ),
    
    tags$style("body { font-family: 'Source Sans Pro', sans-serif; }",
               "h1 { color: #3399ff; }",
               "button { font-family: inherit; }",
               "textarea { font-family: 'Courier New'; }",
               "select { font-family: inherit; }",
               "#addit { color: #3399ff; }",
               "#done { color: black; }",
               "#test { color: #32cd32; }",
               "#help { color: red; }"
    ),
    
    tags$h4("Instructions:"),
    
    helpText(tags$ol(tags$li("Select a content type."),
                     tags$li("Complete the form."),
                     tags$li("Press the ", strong("Add it!"), " button."),
                     tags$li("Press the ", strong("Test it!"), 
                             " button to run your lesson in swirl."),
                     tags$li("Repeat steps 1-4 until satisfied."),
                     tags$li("Press", strong("I'm done!"), 
                             " to exit the authoring tool."),
                     tags$li("Press", strong("Help me!"), 
                             " to get more help."))),
    
    hr(),
    
    # Select unit class
    selectInput("class", "Content type:",
                choices = c("Text" = "text", 
                            "Question - R Command" = "cmd_question",
                            "Question - Multiple Choice" = "mult_question",
                            "Question - Exact Numerical" = "exact_question",
                            "Question - Text" = "text_question",
                            "Video" = "video", 
                            "Figure" = "figure")
    ),
    
    textOutput("description"),
    
    hr(),
    
    # Button to add unit
    actionButton("add", "Add it!"),
    
    # Button to test lesson
    actionButton("test", "Test it!"),
    
    # Button to close the authoring tool
    actionButton("done", "I'm done!"),
    
    # Help button
    actionButton("help", "Help me!"),
    
    hr(),
        
    helpText(tags$em(tags$sm(
      "NOTE: If you're using a Mac, make sure Smart Quotes",
      "are disabled by right-clicking inside of one of the",
      "form fields below, and unchecking the Smart",
      "Quotes option (under Substitutions).",
      "It's also possible to turn this feature off globally",
      "from System Preferences.")))
  ),
  
  div(class="span7",
    
    aceEditor("ace", theme="vibrant_ink", mode="yaml",
              value=paste(readLines(getOption("swirlify_lesson_path")),
                          collapse="\n")
    ),
    
    uiOutput("ui"),
    br()
  )
))))