#' Create the Tabler body wrapper
#'
#' @param ... Any Tabler element, especially \link{tabler_tab_items} and
#' \link{tabler_tab_item} if used in combination with \link{tabler_navbar}.
#' @param footer Slot for \link{tabler_footer}.
#'
#' @return An HTML tag containing the page elements.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'
#'  ui <- tabler_page(tabler_body(h1("Hello World")))
#'  server <- function(input, output) {}
#'  shinyApp(ui, server)
#' }

tabler_body <- function(..., footer = NULL) {
  div(
    class = "content",
    div(class = "container-xl", ...),
    tags$footer(class = "footer footer-transparent", footer)
  )
}
