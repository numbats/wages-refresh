#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)


# LOAD THE DATA

wages_hs <- readRDS(here::here("app/wages_hs.rds")) %>%
    dplyr::select(-`X1.x`, -`X1.y`)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Customize Your Threshold"),

    # Sidebar with a slider input for number of bins
    fluidRow(
        column(width = 4,
            sliderInput("th",
                        "Set the weight threshold:",
                        min = 0.01,
                        max = 1,
                        value = 5),
            br(),
            br(),
            textInput("seed",
                      "Set the seed:",
                      value = "123")

        ),

        # Show a plot of the generated distribution
        column(width = 8,
           plotOutput("compar_plot",
                      height = 500)
        )
    ),
    fluidRow(
        column(
            width = 12,
            h2("Potential Outliers"),
            plotOutput("outlier_plot",
                       height = 800)

        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    thres_data <- reactive({
        temp_data <- wages_hs %>%
            mutate(wages_rlm = ifelse(w < input$th  & .fitted >= 0, .fitted,
                                      mean_hourly_wage)) %>%
            mutate(is_pred = ifelse(w < input$th & .fitted >= 0, TRUE,
                                    FALSE))
    })

    compare_data <- reactive({
        set.seed(input$seed)

        sample_id <- sample(unique(thres_data()$id), 30)
        sample <- subset(thres_data(), id %in% sample_id)

        wages_compare <- sample %>%
            dplyr::select(id, year, mean_hourly_wage, wages_rlm) %>%
            rename(mean_hourly_wage_rlm = wages_rlm) %>%
            pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")
    })

    pot_out_data <- reactive({
        wages_high <- filter(wages_hs, mean_hourly_wage > 500) %>%
            as_tibble()

        wages_high2 <- thres_data() %>%
            filter(id %in% wages_high$id) %>%
            dplyr::select(id, year, mean_hourly_wage, wages_rlm) %>%
            rename(mean_hourly_wage_rlm = wages_rlm) %>%
            pivot_longer(c(-id, -year), names_to = "type", values_to = "wages")
    })

    output$compar_plot <- renderPlot({
        ggplot(compare_data()) +
            geom_line(aes(x = year,
                          y = wages,
                          colour = type,
                          linetype = type),
                      alpha = 1) +
            geom_point(aes(x = year,
                           y = wages,
                           colour = type),
                       alpha = 0.5,
                       size = 1) +
            theme(axis.text.x = element_text(angle = 10, size = 5),
                  legend.position = "bottom") +
            facet_wrap(~id, scales = "free_y")
    })

    output$outlier_plot <- renderPlot({

        ggplot(pot_out_data()) +
            geom_line(aes(x = year,
                          y = wages,
                          colour = type,
                          linetype = type)) +
            geom_point(aes(x = year,
                           y = wages,
                           colour = type,
                           linetype = type),
                       size = 0.5,
                       alpha = 0.5) +
            facet_wrap(~id, scales = "free_y", ncol = 5) +
            theme(axis.text.x = element_text(angle = 10, size = 6)) +
            ylab("mean hourly wage")



    })
}

# Run the application
shinyApp(ui = ui, server = server)
