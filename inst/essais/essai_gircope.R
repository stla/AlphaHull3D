library(gyro)         # to use the `changesOfSign` function
library(arrangements) # to use the `permutations` function
x <- c(
  (1 + 2*sqrt(2)) / 2,
  (1 + sqrt(2)) / 2,
  1/2
)
vertices <- changesOfSign(
  cbind(
    t(apply(permutations(3L), 1L, function(perm) x[perm])), 
    1/2
  )
)
R <- sqrt(c(crossprod(vertices[1L, ])))
pts <- t(apply(vertices, 1L, function(v){
  v[1L:3L] / (R - v[4L])
}))

library(AlphaHull3D)
library(rgl)

ahull <- ahull3d(pts, alpha = 0.2)
ahull$normals <- NULL

open3d(windowRect = c(50, 50, 562, 562))
view3d(15, 15, zoom = 0.7)
shade3d(ahull, color = "purple")
wire3d(ahull)

movie3d(spin3d(axis = c(1, 1, 1), rpm = 10),
        duration = 6, fps = 20,
        movie = "zzpic", dir = ".",
        convert = FALSE, webshot = FALSE,
        startTime = 1/20)

library(gifski)
gifski(
  png_files = Sys.glob("zzpic*.png"),
  gif_file = "gircope.gif",
  width = 512,
  height = 512,
  delay = 1/11
)


