#' Remove NULL list elements
#'
#' @param x list from which to drop NULL elements.
#' @export
dropNulls <- function (x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}
