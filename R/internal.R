#' @useDynLib AlphaHull3D, .registration=TRUE
#' @importFrom Rcpp evalCpp
NULL

isNonNegativeNumber <- function(x) {
  is.numeric(x) && length(x) == 1L && x >= 0 && !is.na(x)
}

isPositiveInteger <- function(x) {
  is.numeric(x) && length(x) == 1L && !is.na(x) && floor(x) == x
}

isStrictPositiveInteger <- function(x) {
  isPositiveInteger(x) && x > 0
}

isBoolean <- function(x) {
  is.logical(x) && length(x) == 1L && !is.na(x)
}

#' @importFrom rgl tmesh3d
#' @importFrom Rvcg vcgClean
#' @noRd
makeMesh <- function(vertices) {
  nvertices <- ncol(vertices)
  if(nvertices == 0L) {
    message("The alpha shape is empty.")
    return(NULL)
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