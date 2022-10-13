library(rgl)

pts <- cube3d()$vb[-4, ]

ah <- AlphaHull3D:::FAS_cpp(pts)
n <- ncol(ah)

mesh <- tmesh3d(
  vertices = ah,
  indices = matrix(1L:n, nrow = 3L)
)

shade3d(mesh, col = "red")
