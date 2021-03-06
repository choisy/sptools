% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remove_var.R
\name{remove_var}
\alias{remove_var}
\title{Removes variable(s) from a Spatial*DataFrame}
\usage{
remove_var(spdf, var = NULL)
}
\arguments{
\item{spdf}{A Spatial*DataFrame object}

\item{var}{A vector of variable names or indexes to remove.}
}
\value{
An object of the same class as \code{spdf}.
}
\description{
Removes variable(s) from a Spatial*DataFrame
}
\examples{
# An example with a SpatialPointsDataFrame object:
# devtools::install_github("epix-project/imhen")
library(sf)
stations <- as(imhen::stations, "Spatial")
stations
remove_var(stations, "elevation")
remove_var(stations, 2)
remove_var(stations)

# An example with a SpatialPoints object:
# download vietnam admin1 administrative map in the internal library and in
# the working direction
vn <- sptools::gadm("vietnam", "sp", 1, intlib = TRUE, save = TRUE)
vn
remove_var(vn, c(6, 9))
}
