% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/button.R
\name{tabler_button}
\alias{tabler_button}
\title{Custom Tabler action button}
\usage{
tabler_button(inputId, label, status = NULL, icon = NULL, width = NULL, ...)
}
\arguments{
\item{inputId}{The \code{input} slot that will be used to access the value.}

\item{label}{The contents of the button or link--usually a text label, but
you could also use any other HTML, like an image.}

\item{status}{Button color.}

\item{icon}{An optional \code{\link[shiny:icon]{icon()}} to appear on the button.}

\item{width}{The width of the input, e.g. \code{'400px'}, or \code{'100\%'};
see \code{\link[shiny:validateCssUnit]{validateCssUnit()}}.}

\item{...}{Named attributes to be applied to the button or link.}
}
\value{
A Tabler action button tag.
}
\description{
Custom Tabler action button
}
\examples{
if (interactive()) {
 library(shiny)
 ui <- tabler_page(
  tabler_body(
    tabler_button(
      "btn",
      HTML(paste("Value", textOutput("val"), sep = ":")),
      icon = icon("thumbs-up"),
      width = "25\%"
    )
  )
 )

 server <- function(input, output) {
   output$val <- renderText(input$btn)
 }

 shinyApp(ui, server)
}
}
