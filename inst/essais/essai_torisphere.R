library(AlphaHull3D)
library(rgl)

R = 2; r = 0.5
s <- function(u, v, w){
  rbind(
    r * cos(u) * cos(v) * cos(w) + R * cos(v) * cos(w),
    r * cos(u) * cos(v) * cos(w) + R * cos(v) * sin(w),
    r * cos(u) * cos(v) + R * sin(v),
    r * sin(u)
  )
}


n <- 30L
u_ <- v_ <- w_ <- seq(0, 2*pi, length.out = n)[-1L]
G <- expand.grid(u = u_, v = v_, w = w_)
vertices <- t(with(G, s(u, v, w)))
summary(vertices)

pts <- vertices[, c(1L, 2L, 3L)] / (1 - vertices[, 4L])

mesh <- ahull3d(pts, alpha = 1)

#mm <- Rvcg::vcgSmooth(mesh)
open3d(windowRect = c(50, 50, 562, 562), zoom = 0.8)
shade3d(mesh, color = "orange")



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

