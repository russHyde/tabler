#' Custom Tabler switch input
#'
#' Similar to the shiny checkbox
#'
#' @inheritParams shiny::checkboxInput
#'
#' @return A toggle input tag.
#' @export
#'
#' @seealso \link{update_tabler_switch}.

tabler_switch <- function(inputId, label, value = FALSE,
                          width = NULL) {
  value <- shiny::restoreInput(id = inputId, default = value)

  input_tag <- tags$input(
    id = inputId,
    type = "checkbox",
    class = "form-check-input"
  )

  if (!is.null(value) && value) {
    input_tag <- tagAppendAttributes(
      input_tag,
      checked = "checked"
    )
  }

  input_wrapper <- tags$label(
    class = "form-check form-switch",
    style = if (!is.null(width)) {
      paste0("width: ", validateCssUnit(width), ";")
    }
  )

  input_wrapper |> tagAppendChildren(
    input_tag,
    span(class = "form-check-label", label)
  )
}

#' Update \link{tabler_switch} on the client
#'
#' @inheritParams shiny::updateCheckboxInput
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tabler_page(
#'   tabler_body(
#'     tabler_row(
#'       tabler_button("update", "Go!", width = "25%", class = "mr-2"),
#'       tabler_switch("toggle", "Switch", value = TRUE, width = "25%")
#'     )
#'   )
#'  )
#'
#'  server <- function(input, output, session) {
#'    observe(print(input$toggle))
#'    observeEvent(input$update, {
#'      update_tabler_switch(
#'        session,
#'        "toggle",
#'        value = !input$toggle
#'      )
#'    })
#'  }
#'
#'  shinyApp(ui, server)
#' }
update_tabler_switch <- function (session, inputId, label = NULL, value = NULL) {
  message <- dropNulls(list(label = label, value = value))
  session$sendInputMessage(inputId, message)
}
