color_settings_box <- function(width = 12, collapsible = T, collapsed = F) {
  box(title = HTML('<p style="font-size:120%;">Color Settings</p>'),
      width = width, solidHeader = T, status = "primary",
      collapsible = collapsible, collapsed = collapsed,
      sidebarLayout(
        sidebarPanel(
          width = 3,
          selectInput(inputId = "Settings.Color.Scheme", label="Color schemes", choices = c("Default", "Variant 1", "Variant 2", "Custom")),
          conditionalPanel(condition = 'input["Settings.Color.Scheme"] == "Custom"',
                           downloadButton("Settings.Color.Example","Download an example color settings file"),
                           fileInput("Settings.Color.Upload","Upload a color settings file")
                           )
        ),
        mainPanel(
          width = 9,
          column(
            width = 12,
            align = "center",
            HTML_P('Example of the current colorscheme.'),
            plotlyOutput.IOHanalyzer('Settings.Color.Plot')
          )
          
          
        )
      )
  )
}