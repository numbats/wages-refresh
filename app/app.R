#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(tidyverse)


# LOAD THE DATA

wages_hs <- readRDS(here::here("app/wages_hs.rds")) %>%
    dplyr::select(-`X1.x`, -`X1.y`)


## Make it separate tab for these three plots

## Add progress bar for how long will it take to recalculate threshold and resample the ids

ui <- bootstrapPage(
    navbarPage(theme = shinytheme("cerulean"),
               collapsible = TRUE,
               # Application title
               "Customize Your Threshold",
               tabPanel("Set the weight threshold",
                        sidebarLayout(
                            sidebarPanel(width = 4,
                                   sliderInput("th",
                                               "Set the weight threshold:",
                                               min = 0.01,
                                               max = 1,
                                               value = 5),
                                   br(),
                                   br(),
                                   actionButton("resample",
                                             "Compare individuals")

                            ),

                            # Show a plot of the samples of indivudial before and after
                            mainPanel(width = 8,
                                      plotOutput("compar_plot",
                                              height = 500)
                                      # h3("Before"),
                                      # plotOutput("spag1"),
                                      # br(),
                                      # textOutput("summary_before"),
                                      # textOutput("n_obs"),
                                      # textOutput("n_id"),
                                      #
                                      # h3("After"),
                                      # plotOutput("spag2"),
                                      # br(),
                                      # textOutput("summary_after"),
                                      # textOutput("n_obs_pred"),
                                      # textOutput("n_id_pred")

                            )
                        )),
               tabPanel(
                   "Inspect the Potential Outliers",
                   column(
                       width = 12,
                       plotOutput("outlier_plot",
                       height = 800))
                   ),

               tabPanel(
                   "The Spaghetty Plots",
                   column(
                       width = 6,
                       h3("Before"),
                       plotOutput("spag1"),
                       br(),
                       textOutput("summary_before"),
                       textOutput("n_obs"),
                       textOutput("n_id")),
                   column(
                       width = 6,
                       h3("After"),
                       plotOutput("spag2"),
                       br(),
                       textOutput("summary_after"),
                       textOutput("n_obs_pred"),
                       textOutput("n_id_pred")
        )
    )
)
)


# SERVER
server <- function(input, output, session) {

    thres_data <- reactive({
        temp_data <- wages_hs %>%
            mutate(wages_rlm = ifelse(w < input$th  & .fitted >= 0, .fitted,
                                      mean_hourly_wage)) %>%
            mutate(is_pred = ifelse(w < input$th & .fitted >= 0, TRUE,
                                    FALSE))
    })

    compare_data <- eventReactive(input$resample, {

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

    output$spag1 <- renderPlot({

        ggplot(wages_hs) +
            geom_line(aes(x = year,
                          y = mean_hourly_wage,
                          group = id),
                      alpha = 0.1)
    })

    output$spag2 <- renderPlot({

        ggplot(thres_data()) +
            geom_line(aes(x = year,
                          y = wages_rlm,
                          group = id),
                      alpha = 0.1)
    })

    output$summary_before <- renderText({

        summary(wages_hs$mean_hourly_wage)
    })

    output$summary_after <- renderText({
        summary(thres_data()$wages_rlm)
    })

    output$n_obs <- renderText({
        paste0("Number of observations: ", nrow(wages_hs))
    })

    output$n_id <- renderText({
        n_id <- wages_hs %>%
            group_by(id) %>%
            count(id) %>%
            nrow()

        paste0("Number of IDs: ", n_id)
    })

    output$n_obs_pred <- renderText({
        n_obs_pred <- filter(thres_data(), is_pred == TRUE) %>%
            nrow()
        paste0("Number of observations predicted: ", n_obs_pred)
    })

    output$n_id_pred <- renderText({
        n_id_pred <- filter(thres_data(), is_pred == TRUE) %>%
            group_by(id) %>%
            count(id) %>%
            nrow()

        paste0("Number of IDs predicted: ", n_id_pred)
    })
}

# Run the application
shinyApp(ui = ui, server = server)
