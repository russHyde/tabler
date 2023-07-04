#' Create a Tabler body item container
#'
#' @param ... Slot for \link{tabler_tab_item}.
#' @export
tabler_tab_items <- function(...) {
  div(class = "tab-content", ...)
}



#' Create a Tabler body tab item
#'
#' This works with the navbar \link{tabler_navbar_menu_item} function
#'
#' @param tabName Unique tab name.
#' @param ... Tab content.
#' @export
tabler_tab_item <- function(tabName = NULL, ...) {
  div(
    role = "tabpanel",
    class = "tab-pane fade container-fluid",
    id = tabName,
    ...
  )
}
