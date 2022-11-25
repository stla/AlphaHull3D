library(AlphaHull3D)
library(rgl)
library(MeshesOperations)

mesh <- cyclideMesh(a = 97, c = 12, mu = 27)
pts <- sampleOnMesh(1000, mesh)

ahull <- fullAhull3d(pts)
mesh <- setAlpha(ahull, alpha = optimal(1))
open3d(windowRect = c(50, 50, 512, 512), zoom = 0.85)
shade3d(mesh, color = "orange")
wire3d(mesh)

ahull <- ahull3d(pts, alpha = 200)
#ahull$normals <- NULL
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

