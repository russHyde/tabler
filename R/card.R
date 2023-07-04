#' Create a Tabler card element
#'
#' This is to be inserted in \link{tabler_body}.
#'
#' @param ... Card content.
#' @param title Card title.
#' @param status Card status color. Valid statuses are given at
#' \url{https://preview-dev.tabler.io/docs/colors.html}.
#' @param width Card width. Numeric between 1 and 12 according to the
#' Bootstrap 4 grid system.
#' @param stacked Apply a stacked effect to the card.
#' @param padding Card padding. Leave NULL or "sm", "md" and "lg".
#'
#' @return A card tag.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tabler_page(
#'    tabler_body(
#'      tabler_row(
#'        lapply(
#'         1:2,
#'         tabler_card,
#'         title = "Card",
#'         status = "success",
#'         "My amazing card"
#'        )
#'      )
#'    )
#'  )
#'  server <- function(input, output) {}
#'  shinyApp(ui, server)
#' }

tabler_card <- function(..., title = NULL, status = NULL,
                        width = 6, stacked = FALSE,
                        padding = NULL) {

  card_cl <- paste0(
    "card",
    if (stacked) " card-stacked",
    if (!is.null(padding)) paste0(" card-", padding)
  )

  status_tag <- if (!is.null(status)) {
    div(class = paste0("card-status-top bg-", status))
  }

  body_tag <- div(
    class = "card-body",
    # we could have a smaller title like h4 or h5...
    if (!is.null(title)) {
      h3(class = "card-title", title)
    },
    ...
  )

  main_wrapper <- div(class = paste0("col-md-", width))
  card_wrapper <- div(class = card_cl)

  card_wrapper <- tagAppendChildren(
    card_wrapper, status_tag, body_tag
  )
  tagAppendChild(main_wrapper, card_wrapper)
}
