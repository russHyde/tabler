#' Create the Tabler navbar
#'
#' @param ... Extra elements.
#' @param brand_url Navbar brand url.
#' @param brand_image Navbar brand image.
#' @param nav_menu Slot for \link{tabler_navbar_menu}.
#' @param nav_right Right elements.
#'
#' @return The navbar HTML tag, which drives the template navigation.
#' @export
#'
#' @import htmltools
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   # example without JS
#'   ui <- tabler_page(
#'     tabler_navbar(
#'       brand_url = "https://preview-dev.tabler.io",
#'       brand_image = "https://preview-dev.tabler.io/static/logo.svg",
#'       nav_menu = tabler_navbar_menu(
#'         tabler_navbar_menu_item(
#'           text = "Tab 1",
#'           icon = NULL,
#'           tabName = "tab1",
#'           selected = TRUE
#'         ),
#'         tabler_navbar_menu_item(
#'           text = "Tab 2",
#'           icon = NULL,
#'           tabName = "tab2"
#'         )
#'       )
#'     ),
#'     tabler_body(
#'       tabler_tab_items(
#'         tabler_tab_item(
#'           tabName = "tab1",
#'           p("Hello World")
#'         ),
#'         tabler_tab_item(
#'           tabName = "tab2",
#'           p("Second Tab")
#'         )
#'       ),
#'       footer = tabler_footer(
#'         left = "Rstats, 2020",
#'         right = a(href = "https://www.google.com")
#'       )
#'     )
#'   )
#'   server <- function(input, output) {}
#'   shinyApp(ui, server)
#'
#'   # example with custom JS code to activate tabs
#'   shinyAppDir(system.file("tabler/tabler_tabs", package = "OSUICode"))
#' }
tabler_navbar <- function(..., brand_url = NULL, brand_image = NULL, nav_menu, nav_right = NULL) {
  header_tag <- tags$header(class = "navbar navbar-expand-md")
  container_tag <- tags$div(class = "container-xl")

  # toggler for small devices (must not be removed)
  toggler_tag <- tags$button(
    class = "navbar-toggler",
    type = "button",
    `data-toggle` = "collapse",
    `data-target` = "#navbar-menu",
    span(class = "navbar-toggler-icon")
  )

  # brand elements
  brand_tag <- if (!is.null(brand_url) || !is.null(brand_image)) {
    a(
      href = if (!is.null(brand_url)) {
        brand_url
      } else {
        "#"
      },
      class = "navbar-brand navbar-brand-autodark d-none-navbar-horizontal pr-0 pr-md-3",
      if (!is.null(brand_image)) {
        img(
          src = brand_image,
          alt = "brand Image",
          class = "navbar-brand-image"
        )
      }
    )
  }

  dropdown_tag <- if (!is.null(nav_right)) {
    div(class = "navbar-nav flex-row order-md-last", nav_right)
  }

  navmenu_tag <- div(
    class = "collapse navbar-collapse",
    id = "navbar-menu",
    div(
      class = "d-flex flex-column flex-md-row flex-fill align-items-stretch align-items-md-center",
      nav_menu
    ),
    if (length(list(...)) > 0) {
      div(
        class = "ml-md-auto pl-md-4 py-2 py-md-0 mr-md-4 order-first order-md-last flex-grow-1 flex-md-grow-0",
        ...
      )
    }
  )

  container_tag <- container_tag %>% tagAppendChildren(
    toggler_tag,
    brand_tag,
    dropdown_tag,
    navmenu_tag
  )

  header_tag %>% tagAppendChild(container_tag)
}

#' Create the Tabler navbar menu
#'
#' @param ... Slot for \link{tabler_navbar_menu_item}.
#' @param inputId Optional: used to recover the currently selected tab item.
#' @export
tabler_navbar_menu <- function(..., inputId = NULL) {
  tags$ul(id = inputId, class = "nav nav-pills navbar-nav", ...)
}

#' Create a tabler navbar menu item
#'
#' This item is used to navigate. Must match with the
#' \link{tabler_tab_item} function.
#'
#' @param text Item title.
#' @param tabName Unique tab name. Must exactly match with the
#' tabName parameter of \link{tabler_tab_item} on the body side.
#' @param icon Item icon.
#' @param selected Whether to select the current item at start.
#'
#' @return A Tabler navigation item tag.
#' @export
tabler_navbar_menu_item <- function(text, tabName, icon = NULL, selected = FALSE) {
  item_cl <- paste0("nav-link", if (selected) " active")

  tags$li(
    class = "nav-item",
    a(
      class = item_cl,
      `data-toggle` = "pill", # see https://getbootstrap.com/docs/4.0/components/navs/
      `data-target` = paste0("#", tabName),
      `data-value` = tabName,
      href = "#",
      role = "tab",
      span(class = "nav-link-icon d-md-none d-lg-inline-block", icon),
      span(class = "nav-link-title", text)
    )
  )
}
