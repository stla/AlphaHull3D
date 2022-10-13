#' @useDynLib AlphaHull3D, .registration=TRUE
#' @importFrom Rcpp evalCpp
NULL


#' 3D alpha hull
#' @description Computes the alpha hull of a set of points.
#'
#' @param points the points given as a matrix with three columns
#' @param alpha positive number
#'
#' @return A \code{mesh3d} object.
#' @export
#' 
#' @importFrom rgl tmesh3d
#' @importFrom Rvcg vcgClean
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
ahull3d <- function(points, alpha) {
  stopifnot(is.matrix(points))
  stopifnot(ncol(points) == 3L)
  stopifnot(alpha >= 0)
  vertices  <- FAS_cpp(t(points), alpha)
  nvertices <- ncol(vertices)
  if(nvertices == 0L) {
    message("The alpha-shape is empty.")
    return(invisible(NULL))
  }
  mesh0 <- tmesh3d(
    vertices    = vertices,
    indices     = matrix(1L:nvertices, nrow = 3L),
    homogeneous = FALSE
  )
  mesh <- vcgClean(mesh0, sel = c(0L, 7L), silent = TRUE)
  mesh[["remvert"]] <- NULL
  mesh[["remface"]] <- NULL
  mesh
}