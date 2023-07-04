#' Create a Tabler HTML page
#'
#' This is the main wrapper
#'
#' @param ... Slot for \link{tabler_body} and \link{tabler_navbar}.
#' @param dark Whether to apply the dark theme. Default to TRUE.
#' @param title Page title.
#' @param favicon Site favicon.
#'
#' @return The Tabler page main wrapper.
#'
#' @import   htmltools
#' @export

tabler_page <- function(..., dark = TRUE, title = NULL, favicon = NULL){

  # head
  head_tag <- tags$head(
    tags$meta(charset = "utf-8"),
    tags$meta(
      name = "viewport",
      content = "
        width=device-width,
        initial-scale=1,
        viewport-fit=cover"
    ),
    tags$meta(`http-equiv` = "X-UA-Compatible", content = "ie=edge"),
    tags$title(title),
    tags$link(
      rel = "preconnect",
      href = "https://fonts.gstatic.com/",
      crossorigin = NA
    ),
    tags$meta(name = "msapplication-TileColor", content = "#206bc4"),
    tags$meta(name = "theme-color", content = "#206bc4"),
    tags$meta(name = "apple-mobile-web-app-status-bar-style", content = "black-translucent"),
    tags$meta(name = "apple-mobile-web-app-capable", content = "yes"),
    tags$meta(name = "mobile-web-app-capable", content = "yes"),
    tags$meta(name = "HandheldFriendly", content = "True"),
    tags$meta(name = "MobileOptimized", content = "320"),
    tags$meta(name = "robots", content = "noindex,nofollow,noarchive"),
    tags$link(rel = "icon", href = favicon, type = "image/x-icon"),
    tags$link(rel = "shortcut icon", href = favicon, type="image/x-icon")
  )

  # body
  body_tag <- tags$body(
    tags$div(
      class = paste0("antialiased ", if(dark) "theme-dark"),
      style = "display: block;",
      tags$div(class = "page", ...)
    )
  ) %>% add_tabler_deps()

  tagList(head_tag, body_tag)
}
