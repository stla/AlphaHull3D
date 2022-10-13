library(AlphaHull3D)
library(rgl)

R1 = 2; R2 = 2; r = 0.3
s <- function(u, v, w){
  rbind(
    cos(u) * (R1 + r*cos(w)),
    sin(u) * (R1 + r*cos(w)),
    cos(v) * (R2 + r*sin(w)),
    sin(v) * (R2 + r*sin(w))
  )
}

n <- 100L
u_ <- v_ <- w_ <- seq(0, 2*pi, length.out = n)[-1L]
G <- expand.grid(u = u_, v = v_, w = w_)
vertices <- t(with(G, s(u, v, w)))

pts <- vertices[, c(1L, 2L, 3L)] / (5 - vertices[, 4L])

mesh <- ahull3d(pts, alpha = 0.02)

mm <- Rvcg::vcgSmooth(mesh)
open3d(windowRect = c(50, 50, 562, 562), zoom = 0.8)
shade3d(mm, color = "orange")



movie3d(spin3d(axis = c(1, 1, 1), rpm = 10),
        duration = 6, fps = 20,
        movie = "zzpic", dir = ".",
        convert = FALSE, webshot = FALSE,
        startTime = 1/20)

library(gifski)
gifski(
  png_files = Sys.glob("zzpic*.png"),
  gif_file = "tiger.gif",
  width = 512,
  height = 512,
  delay = 1/11
)

