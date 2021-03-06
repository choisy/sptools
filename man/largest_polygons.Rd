% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/largest_polygons.R
\name{largest_polygons}
\alias{largest_polygons}
\title{Filter the Largest Polygon of each polygon slot of a SpatialPolygon* object}
\usage{
largest_polygons(sppoly, subset)
}
\arguments{
\item{sppoly}{\code{SpatialPolygon*} object as defined in package \code{sp}.}

\item{subset}{a subsetting condition}
}
\value{
An object of the same class as \code{sppoly} where each slot of the
\code{polygons} element is made on one single \code{Polygon} object that is
the largest \code{Polygon} is the input \code{sppoly}.
}
\description{
Filter the Largest Polygon of each polygon slot of a SpatialPolygon* object
}
\examples{
library(sf)
# working on the provinces polygons of Vietnam:
vn_prov <- gadmVN::gadm()
vn_prov <- sf::as_Spatial(vn_prov)
vn_prov2 <- largest_polygons(vn_prov)
sp::plot(vn_prov)
sp::plot(vn_prov2)
# same with the country level:
vn <- gadmVN::gadm(level = "country")
vn <- sf::as_Spatial(vn)
vn2 <- largest_polygons(vn)
rgeos::gEnvelope(vn)
# extracting the largest polygon only for Da Nang:
vn_prov3 <- largest_polygons(vn_prov, province == "Da Nang")
sp::plot(vn_prov3)
# extracting the largest polygon only for Da Nang and Khanh Hoa:
vn_prov4 <- largest_polygons(vn_prov, province \%in\% c("Da Nang", "Khanh Hoa"))
sp::plot(vn_prov4)

}
\seealso{
\code{\link[sptools]{rm_largest_polygons}}
}
