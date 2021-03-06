#' Adds variable(s) to a Spatial*DataFrame
#'
#' @param spdf A Spatial*DataFrame object
#' @param df A vector or a data frame
#'
#' @return An object of the same class than \code{sp}.
#'
#' @export
#'
#' @examples
#'
#' # download vietnam admin1 administrative map in the internal library and in
#' # the working direction
#' vn <- sptools::gadm("vietnam", "sp", 1, intlib = TRUE, save = TRUE)
#' vn
#' vn <- add_variable_spdf(vn, rnorm(63))
#' vn
#'
#' # The name of the new variable will be "df". To prevent that we could choose
#' # the data frame format:
#' vn <- add_variable_spdf(vn, data.frame(normal = rnorm(63)))
#' vn
#'
#' # The data frame format allows the additional possibility to add several
#' # additional variables all at once:
#' vn <-  add_variable_spdf(vn,
#'   data.frame(uniform = runif(63), exponential = rexp(63)))
#' vn
add_variable_spdf <- function(spdf, df) {
  spdf@data <- cbind(spdf@data, df)
  spdf
}

# ------------------------------------------------------------------------------

#' Adds variable(s) to a SpatialPolygons
#'
#' @param sp A SpatialPolygons object.
#' @param df A vector or a data frame.
#'
#' @return A SpatialPolygonsDataFrame
#'
#' @importFrom sp SpatialPolygonsDataFrame
#'
#' @export
#'
#' @examples
#' # download vietnam admin1 administrative map in the internal library and in
#' # the working direction
#' vn <- sptools::gadm("vietnam", "sp", 1, intlib = TRUE, save = TRUE)
#' vn_nodata <- remove_data_spatialpolygons(vn)
#' vn_nodata
#'
#' a <- runif(63)
#' vn_data <- add_variable_sp(vn_nodata, a)
#' vn_data
#'
#' # An example with a data frame:
#' vn_data2 <- add_variable_sp(vn_nodata,
#'    data.frame(b = rnorm(63), c = rexp(63)))
#' vn_data2
#'
add_variable_sp <- function(sp, df) {
  SpatialPolygonsDataFrame(sp, data.frame(df), FALSE)
}


# ------------------------------------------------------------------------------

#' Adds variable(s) to a SpatialPoints
#'
#' @param sp A SpatialPoints object.
#' @param df A vector or a data frame.
#'
#' @return A SpatialPointsDataFrame
#'
#' @importFrom sp SpatialPointsDataFrame
#'
#' @examples
#' stations <- imhen::stations
#' stations <- sf::as_Spatial(stations)
#' stations <- remove_data_spatialpoints(stations)
#' stations
#' add_variable_spts(stations, 1:length(stations))
#' @export
add_variable_spts <- function(sp, df) {
  SpatialPointsDataFrame(coordinates(sp), data.frame(df),
                         proj4string = CRS(proj4string(sp)))
}
