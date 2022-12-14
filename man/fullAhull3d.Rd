% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FullAS.R
\name{fullAhull3d}
\alias{fullAhull3d}
\title{3D alpha hull for all alpha}
\usage{
fullAhull3d(points)
}
\arguments{
\item{points}{the points given as a matrix with three columns}
}
\value{
An external pointer for usage in the function \code{\link{setAlpha}}.
}
\description{
Computes the complete alpha hull of a set of points. The result 
  is an external pointer to be used in the function \code{\link{setAlpha}}.
}
\examples{
library(AlphaHull3D)
ahull <- fullAhull3d(gissid)
mesh <- setAlpha(ahull, alpha = "solid")
mesh$normals <- NULL
library(rgl)
open3d(windowRect = c(50, 50, 562, 562))
shade3d(mesh, color = "purple")
}
