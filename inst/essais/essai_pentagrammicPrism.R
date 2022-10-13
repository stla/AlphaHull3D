library(AlphaHull3D)
library(rgl)

pts <- MeshesOperations::pentagrammicPrism$vertices

ahull <- ahull3d(pts, alpha = .1)
ahull$normals <- NULL

open3d(windowRect = c(50, 50, 512, 512), zoom = 0.85)
#points3d(pts)
shade3d(ahull, color = "orange")
wire3d(ahull)

movie3d(spin3d(axis = c(1, 1, 1), rpm = 10),
        duration = 6, fps = 20,
        movie = "zzpic", dir = ".",
        convert = FALSE, webshot = FALSE,
        startTime = 1/20)

library(gifski)
gifski(
  png_files = Sys.glob("zzpic*.png"),
  gif_file = "pentagrammicPrism.gif",
  width = 512,
  height = 512,
  delay = 1/11
)

