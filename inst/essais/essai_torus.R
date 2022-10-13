library(AlphaHull3D)
library(uniformly)
library(rgl)

set.seed(666L)
pts <- runif_in_torus(5000L, R = 3, r = 1)
ahull <- ahull3d(pts, alpha = 2)

open3d(windowRect = c(50, 50, 512, 512))
points3d(pts)
shade3d(ahull, color = "orange", alpha = 0.4)
