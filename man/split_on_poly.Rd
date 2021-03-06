% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split_on_poly.R
\name{split_on_poly}
\alias{split_on_poly}
\title{Splits a raster on a spatial polygon}
\usage{
split_on_poly(rstr, plgns)
}
\arguments{
\item{rstr}{A RasterLayer}

\item{plgns}{A SpatialPolygon* object}
}
\value{
A list of \code{RasterLayer} objects.
}
\description{
This function combines the above functions \code{\link[sptools]{as_list}} and
\code{\link[sptools]{crop_on_poly}}. to split a \code{RasterLayer} object on
the features of a \code{SpatialPpolygons*} object. Of course, the
\code{RasterLayer} and the \code{SpatialPpolygons*} objects need to
superpose.
}
\examples{
library(worldpopVN)

provinces <- sptools::gadm("vietnam", "sp", 1, intlib = FALSE, save = TRUE)
ppp2010 <- worldpopVN::getpop(2010)
class(ppp2010)

ppp2010_split <- split_on_poly(ppp2010, provinces[1:3, ])
class(ppp2010_split)
table(sapply(ppp2010_split, class))
}
