library(shiny)
library(ggplot2)
library(httr)

# Function to load data from private GitHub repo
load_data_from_github <- function(url, pat) {
  res <- GET(url, authenticate("token", pat))
  if (status_code(res) != 200) {
    stop("Failed to retrieve data: ", status_code(res))
  }
  read.csv(text = content(res, "text"), stringsAsFactors = FALSE)
}

# Define UI
ui <- fluidPage(
  plotOutput("biomarkerPlot")
)

# Define server logic
server <- function(input, output) {
  output$biomarkerPlot <- renderPlot({
    # URL to the private CSV file
    url <- "https://raw.githubusercontent.com/joosefupas/labs_checks_trends/main/data/trends.csv"
    
    # Retrieve your PAT from an environment variable or a secure place
    pat <- Sys.getenv("GITHUB_PAT")
    
    # Load the data
    data <- load_data_from_github(url, pat)
    
    # Convert Date to proper Date format
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    
    # Create the plot
    ggplot(data, aes(x=Date, y=Value, color=Item)) +
      geom_line() +
      geom_hline(data=data, aes(yintercept=Threshold, color=Item), linetype="dashed") +
      scale_x_date(date_breaks = "3 month", date_labels = "%b %Y") + # Increase x-axis ticks, change to suit your data
      scale_y_continuous(breaks = seq(0, 200, by = 10)) + # Increase y-axis ticks, adjust 'by' as needed
      theme_minimal() +
      labs(title="Biomarker Levels Over Time", x="Date", y="Value (mg/dL)")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
