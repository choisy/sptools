% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cut_sppoly.R
\name{cut_sppoly}
\alias{cut_sppoly}
\title{Cuts Polygons object into 2 lines of which it returns the coordinates}
\usage{
cut_sppoly(sppoly, pt1, pt2)
}
\arguments{
\item{sppoly}{A Polygon object as defined the sp package.}

\item{pt1}{A single-point SpatialPoint object as defined in the sp package.}

\item{pt2}{A single-point SpatialPoint object as defined in the sp package.}
}
\description{
Each polygon is cut between the points of the polygons that are closest to
pt1 and pt2
}
\examples{
library(sf)

# SpatialPolygonsDataFrame
vn <- sf::as_Spatial(gadmVN::gadm(level = "province"))
# SpatialPoints
stations <- as(imhen::stations, "Spatial")
stations <- df2splist(as.data.frame(stations@coords))
cut_sppoly(vn, stations[[1]], stations[[2]])

}
