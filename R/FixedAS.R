#' 3D alpha hull for a given alpha
#' @description Computes the alpha hull of a set of points for a given alpha.
#'
#' @param points the points given as a matrix with three columns
#' @param alpha positive number
#' @param volume Boolean, whether to return the volume of the alpha hull, 
#'   \strong{but this is not always reliable}
#'
#' @return A \code{mesh3d} object, with an attribute \code{"volume"} if 
#'   \code{volume = TRUE}.
#' @export
#' 
#' @note If you want to compute the alpha hull for several values of alpha, 
#'   then instead of using this function you can use the 
#'   \code{\link{fullAhull3d}} and the \code{\link{setAlpha}} functions.
#' 
#' @examples
#' library(AlphaHull3D)
#' library(uniformly)
#' library(rgl)
#' 
#' set.seed(666L)
#' pts <- runif_in_torus(5000L, R = 3, r = 1)
#' ahull <- ahull3d(pts, alpha = 2)
#' 
#' open3d(windowRect = c(50, 50, 562, 562))
#' points3d(pts)
#' shade3d(ahull, color = "orange", alpha = 0.4)
ahull3d <- function(points, alpha, volume = FALSE) {
  stopifnot(is.matrix(points))
  stopifnot(ncol(points) == 3L)
  stopifnot(isNonNegativeNumber(alpha))
  stopifnot(isBoolean(volume))
  vertices <- FAS_cpp(t(points), alpha, volume)
  mesh <- makeMesh(vertices)
  if(is.null(mesh)) {
    return(invisible(NULL))
  }
  if(volume) {
    attr(mesh, "volume") <- attr(vertices, "volume")
  }
  mesh
}