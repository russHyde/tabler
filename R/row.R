#' Create a row container for \link{tabler_card}
#'
#' @param ... Any Tabler element.
#'
#' @return A row tag.
#' @export
tabler_row <- function(...) {
  div(class = "row row-deck", ...)
}
