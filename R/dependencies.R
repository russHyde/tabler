#' Add all dependencies to a tag. Don't forget to set append to TRUE to preserve any existing
#' dependency
#'
#' @param   tag   An HTML tag
#' @export

add_tabler_deps <- function(tag) {
  tabler_cdn <- "https://cdn.jsdelivr.net/npm/tabler@1.0.0-alpha.7/"
  tablers_deps <- htmltools::htmlDependency(
    name = "tabler",
    version = "1.0.7", # we take that of tabler,
    src = c(href = tabler_cdn),
    script = "dist/js/tabler.min.js",
    stylesheet = "dist/css/tabler.min.css"
  )

  bs4_cdn <- "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/"
  bs4_deps <- htmltools::htmlDependency(
    name = "Bootstrap",
    version = "4.3.1",
    src = c(href = bs4_cdn),
    script = "js/bootstrap.bundle.min.js"
  )

  # contains bindings and other JS code
  tabler_custom_js <- htmlDependency(
    name = "tabler-bindings",
    version = "0.1.0",
    src = "tabler",
    package = "tabler",
    script = c(
      "tabler_tabs_init.js"
    )
  )

  # below, the order is of critical importance!
  deps <- list(bs4_deps, tablers_deps, tabler_custom_js)
  htmltools::attachDependencies(tag, deps, append = TRUE)
}
