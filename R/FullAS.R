#' @title 3D alpha hull for all alpha
#' @description Computes the complete alpha hull of a set of points. The result 
#'   is an external pointer to be used in the function \code{\link{setAlpha}}.
#'
#' @param points the points given as a matrix with three columns
#'
#' @return An external pointer for usage in the function \code{\link{setAlpha}}.
#' @export
#'
#' @examples
#' library(AlphaHull3D)
#' ahull <- fullAhull3d(gissid)
#' mesh <- setAlpha(ahull, alpha = "solid")
#' mesh$normals <- NULL
#' library(rgl)
#' open3d(windowRect = c(50, 50, 562, 562))
#' shade3d(mesh, color = "purple")
fullAhull3d <- function(points) {
  stopifnot(is.matrix(points))
  stopifnot(ncol(points) == 3L)
  ahull <- AS_cpp(t(points))
  class(ahull) <- "ahull"
  ahull
}

#' @title Integer for the computation of an optimal alpha
#' @description This function simply returns the given integer with a special 
#'   class; it is intended to be used in the \code{alpha} argument of the 
#'   \code{\link{setAlpha}} function to compute and set the optimal value of 
#'   alpha for which the alpha hull has no more than \code{n} connected 
#'   components.
#'
#' @param n a non-negative integer, the maximal number of connected 
#'   components of the alpha hull
#'
#' @return The value is the input integer \code{n} with a special class. 
#' @export
#'
#' @examples
#' library(AlphaHull3D)
#' library(uniformly)
#' # sample some points in a torus ans some points in a sphere:
#' set.seed(666L)
#' pts_torus <- runif_in_torus(1000L, R = 3, r = 1)
#' pts_sphere <- runif_in_sphere(1000L, d = 3L, r = 1)
#' # shift the points in the sphere:
#' pts_sphere <- sweep(pts_sphere, 2L, c(0, 0, 2), FUN = "+")
#' # full alpha hull:
#' ahull <- fullAhull3d(rbind(pts_torus, pts_sphere))
#' # set optimal alpha for 2 connected components:
#' mesh <- setAlpha(ahull, alpha = optimal(2))
#' # plot:
#' library(rgl)
#' open3d(windowRect = c(50, 50, 562, 562))
#' shade3d(mesh, color = "yellow")
optimal <- function(n) {
  stopifnot(isStrictPositiveInteger(n))
  n <- as.integer(n)
  class(n) <- "nc"
  n
}

#' @title Set alpha value to a full alpha hull and computes this alpha hull
#' @description Given a full alpha hull, this function allows to set the 
#'   value of alpha, either an arbitrary positive number, or an optimal value 
#'   for a desired number of connected components, or a value for which the 
#'   alpha hull is solid. 
#'
#' @param ahull a full alpha hull, i.e. an output of \code{\link{fullAhull3d}}
#' @param alpha there are three possibilities for this parameter: it can be 
#'   a positive number, or the character string \code{"solid"} to get and set 
#'   the smallest alpha for which the alpha hull is solid, or a positive 
#'   integer obtained with the \code{\link{optimal}} function to get and set 
#'   the optimal alpha for which the alpha hull has no more than a desired 
#'   number of connected components 
#'
#' @return A \strong{rgl} mesh (class \code{mesh3d}) with the value of 
#'   alpha in the \code{"alpha"} attribute.
#' @export
#' 
#' @seealso \code{\link{fullAhull3d}}, \code{\link{optimal}}.
#'
#' @examples
#' library(AlphaHull3D)
#' ahull <- fullAhull3d(gissid)
#' mesh <- setAlpha(ahull, alpha = optimal(1))
#' mesh$normals <- NULL
#' library(rgl)
#' open3d(windowRect = c(50, 50, 562, 562))
#' shade3d(mesh, color = "maroon")
setAlpha <- function(ahull, alpha = "solid") {
  if(!inherits(ahull, "ahull")) {
    stop("The `ahull` argument must be an output of `fullAhull3d`.")
  }
  if(identical(alpha, "solid")) {
    vertices <- solidAS_cpp(ahull)
  } else if(inherits(alpha, "nc")) {
    vertices <- optimalAS_cpp(ahull, alpha)
  } else if(isNonNegativeNumber(alpha)) {
    vertices <- setAlpha_cpp(ahull, alpha)
  } else {
    stop("Invalid `alpha` argument.")
  }
  mesh <- makeMesh(vertices)
  if(is.null(mesh)) {
    return(invisible(NULL))
  }
  attr(mesh, "alpha") <- attr(vertices, "alpha")
  mesh
}