% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heat_tree--shape_generators.R
\name{line_coords}
\alias{line_coords}
\title{Makes coordinates for a line}
\usage{
line_coords(x1, y1, x2, y2, width)
}
\arguments{
\item{x1}{(\code{numeric} of length 1) x coordinate of the center of one end}

\item{y1}{(\code{numeric} of length 1) y coordinate of the center of one end}

\item{x2}{(\code{numeric} of length 1) x coordinate of the center of the other end}

\item{y2}{(\code{numeric} of length 1) y coordinate of the center of the other end}

\item{width}{(\code{numeric} of length 1) The width of the line.}
}
\description{
Generates an n x 2 matrix containing x and y coordinates between 1 and 0 for the points of a 
line with a specified width in cartesian coordinates.
}
\examples{
\dontrun{
library(ggplot2)
ggplot(data = line_coords(x1 = 1, y1 = 1, x2 = 2, y2 = 2, width = .1)) + 
  geom_polygon(aes(x = x, y = y, fill = group))
ggplot(data = line_coords(x1 = rnorm(10), y1 = rnorm(10), x2 = rnorm(10),
                          y2 = rnorm(10), width = rnorm(10)/5)) + 
  geom_polygon(aes(x = x, y = y, fill = group))
}
}
\keyword{internal}
