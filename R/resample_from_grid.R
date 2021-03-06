#' Resample a Raster object from a Grid
#'
#' This function is a wrapper around the \code{\link[raster]{resample}}
#' function. Instead of resampling a Raster object from another Raster object as
#' in \code{\link[raster]{resample}}, this function resamples a Raster object
#' from a \code{SpatialPoints*} grid object. In case of a \code{RasterBrick} or
#' a \code{RasterStack} object, it resamples only the first layer and returns it
#' as a \code{RasterLayer} object.
#'
#' @param rstr A \code{Raster*} object (i.e. a \code{RasterLayer} or a
#' \code{RasterBrick} object).
#' @param grd A \code{SpatialPoint} object with points regularly spaced.
#'
#' @return A \code{RasterLayer} object.
#'
#' @importFrom raster rasterFromXYZ raster resample
#' @importFrom sp spTransform proj4string
#'
#' @export
#'
#' @examples
#' library(sp)
#' library(raster)
#'
#' vn <- gadmVN::gadm(level = "country")
#' vn <- sf::as_Spatial(vn)
#' # The raster of population
#' r <- raster(ncol = 5, nrow = 2)
#' # A grid of 100 points over the country:
#' proj <- proj4string(vn)
#' grid5 <- makegrid(vn, 5)
#' grid5 <- SpatialPoints(grid5, CRS(proj))
#' # Let's resample:
#' resample_from_grid(r, grid5)
#' # Also works for RasterBrick
#' resample_from_grid(brick(r), grid5)
#'
#' \dontrun{
#' library(worldpopVN)
#' library(sf)
#' # download vietnam country administrative map in the internal library and in
#' # the working direction
#' country <- sptools::gadm("vietnam", "sf", 0, intlib = TRUE, save = TRUE)
#' # The raster of population
#' ppp2010 <- worldpopVN::getpop(2010)
#'
#' # A grid of 100 points over the country:
#' proj <- proj4string(country)
#' grid100 <- makegrid(country, 100)
#' grid100 <- SpatialPoints(grid100, CRS(proj))
#'
#' # Let's resample:
#' ppp2010rspld <- resample_from_grid(ppp2010, grid100)
#'
#' # Let's compare:
#' ppp2010
#' ppp2010rspld
#'
#' plot(ppp2010rspld)
#' plot(grid100, add = TRUE)
#' plot(st_geometry(st_as_sf(vn)), add = TRUE)
#' }
resample_from_grid <- function(rstr, grd) {
# test if object superpose
  overlap <- try(raster::intersect(rstr, grd), silent = TRUE)
  if (class(overlap) == "try-error") stop("objects extents do not overlap")
# projection
  crs <- proj4string(rstr)
# this function manages RasterLayer or Bricks (or Stack)
  layer_or_brick <- function(x) {
    if (class(x) == "RasterLayer") return(x)
    raster(x, 1) #nocov
  }
# the pipeline:
  grd <- spTransform(grd, crs)
  grd <- as.data.frame(grd)
  grd <- move_xy(grd) # ordered required by rasterFromXYZ
  grd <- rasterFromXYZ(grd, crs = crs)
  grd <- layer_or_brick(grd)
  grd <- resample(rstr, grd)
  grd
}
