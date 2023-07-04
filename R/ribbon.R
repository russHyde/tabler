#' Create a Tabler ribbon component
#'
#' This is a good complement to \link{tabler_card}. The ribbon
#' parameters are listed at \url{https://preview-dev.tabler.io/docs/ribbons.html}.
#'
#' @param ... Ribbon text.
#' @param position Ribbon position.
#' @param color Ribbon color.
#' @param bookmark Ribbon style. FALSE by default.
#'
#' @return A ribbon shiny tag.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  my_card <- tabler_card(title = "Ribbon", status = "info")
#'  my_card$children[[1]] <- my_card$children[[1]] %>%
#'  tagAppendChild(
#'    tabler_ribbon(
#'      icon("info-circle", class = "fa-lg"),
#'      bookmark = TRUE,
#'      color = "red"
#'    )
#'  )
#'
#'  ui <- tabler_page(
#'   tabler_body(
#'     my_card
#'   )
#'  )
#'  server <- function(input, output) {}
#'  shinyApp(ui, server)
#' }

tabler_ribbon <- function(..., position = NULL, color = NULL,
                          bookmark = FALSE) {

  ribbon_cl <- paste0(
    "ribbon",
    if (!is.null(position)) sprintf(" bg-%s", position),
    if (!is.null(color)) sprintf(" bg-%s", color),
    if (bookmark) " ribbon-bookmark"
  )
  div(class = ribbon_cl, ...)
}
