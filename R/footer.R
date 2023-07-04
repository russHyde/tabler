#' Create the Tabler footer wrapper
#'
#' @param left Left content.
#' @param right Right content.
#'
#' @return An HTML tag containing the footer elements.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tabler_page(
#'   tabler_body(
#'     p("Hello World"),
#'     footer = tabler_footer(
#'       left = "Rstats, 2020",
#'       right = a(href = "https://www.google.com", "More")
#'     )
#'   )
#'  )
#'  server <- function(input, output) {}
#'  shinyApp(ui, server)
#' }

tabler_footer <- function(left = NULL, right = NULL) {
  div(
    class = "container",
    div(
      class = "row text-center align-items-center
      flex-row-reverse",
      div(class = "col-lg-auto ml-lg-auto", right),
      div(class = "col-12 col-lg-auto mt-3 mt-lg-0", left)
    )
  )
}
