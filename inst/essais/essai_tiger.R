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

n <- 70L
u_ <- v_ <- w_ <- seq(0, 2*pi, length.out = n)[-1L]
G <- expand.grid(u = u_, v = v_, w = w_)
vertices <- t(with(G, s(u,v,w)))

summary(vertices)

pts <- vertices[, c(1L, 2L, 3L)] / (5 - vertices[, 4L])
#pts <- pts[-duplicated(pts), ]
pts <- t(pts)

# movie3d(spin3d(axis = c(1, 1, 1), rpm = 10),
#         duration = 6, fps = 20,
#         movie = "zzpic", dir = ".",
#         convert = FALSE, webshot = FALSE,
#         startTime = 1/20)
# 
# library(gifski)
# gifski(
#   png_files = Sys.glob("zzpic*.png"), 
#   gif_file = "as_cgal.gif",
#   width = 256,
#   height = 256,
#   delay = 1/11
# )

ah <- AlphaHull3D:::FAS_cpp(pts, 0.02)
n <- ncol(ah)

mesh <- tmesh3d(
  vertices = ah,
  indices = matrix(1L:n, nrow = 3L),
  homogeneous = FALSE
)

wire3d(mesh)
shade3d(mesh, col = "red", alpha = 1)

mm <- Rvcg::vcgClean(mesh, sel = c(0L, 7L))
shade3d(mm, col = "orange")
