pts <- t(rgl::cube3d()$vb[-4, ])

ah <- ahull3d(pts, 1)
