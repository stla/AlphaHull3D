phi <- (1+sqrt(5))/2
pts <- 
  rbind(
    c(0, 0, (1+sqrt(5))/sqrt(3)*3/2), 
    c((1+sqrt(5))/sqrt(3), 0, -(1+sqrt(5))*sqrt(5/3)/2), 
    c(-(1+sqrt(5))/sqrt(3)/2, (1+sqrt(5))/2, -(1+sqrt(5))*sqrt(5/3)/2), 
    c(-(1+sqrt(5))/sqrt(3)/2, -(1+sqrt(5))/2, -(1+sqrt(5))*sqrt(5/3)/2),
    c(-(1+sqrt(5))*sqrt(5/3)/2, (1+sqrt(5))/2, (1+sqrt(5))/sqrt(3)/2),
    c(-(1+sqrt(5))*sqrt(5/3)/2, -(1+sqrt(5))/2, (1+sqrt(5))/sqrt(3)/2),
    c(-1/phi/sqrt(3), -(sqrt(5)+3)/2, (1+sqrt(5))/sqrt(3)/2), 
    c((2+sqrt(5))/sqrt(3), -1, (1+sqrt(5))/sqrt(3)/2), 
    c((2+sqrt(5))/sqrt(3), 1, (1+sqrt(5))/sqrt(3)/2),
    c(-1/phi/sqrt(3), (sqrt(5)+3)/2, (1+sqrt(5))/sqrt(3)/2),
    c(1/phi/sqrt(3), -(sqrt(5)+3)/2, -(1+sqrt(5))/sqrt(3)/2),
    c(1/phi/sqrt(3), (sqrt(5)+3)/2, -(1+sqrt(5))/sqrt(3)/2),
    c((1+sqrt(5))*sqrt(5/3)/2, (1+sqrt(5))/2, -(1+sqrt(5))/sqrt(3)/2),
    c(-(2+sqrt(5))/sqrt(3), -1, -(1+sqrt(5))/sqrt(3)/2),
    c(-(2+sqrt(5))/sqrt(3), 1, -(1+sqrt(5))/sqrt(3)/2),
    c((1+sqrt(5))*sqrt(5/3)/2, -(1+sqrt(5))/2, -(1+sqrt(5))/sqrt(3)/2),
    c((1+sqrt(5))/sqrt(3)/2, (1+sqrt(5))/2, (1+sqrt(5))*sqrt(5/3)/2),
    c((1+sqrt(5))/sqrt(3)/2, -(1+sqrt(5))/2, (1+sqrt(5))*sqrt(5/3)/2),
    c(-(1+sqrt(5))/sqrt(3), 0, (1+sqrt(5))*sqrt(5/3)/2),
    c(0, 0, -(1+sqrt(5))/sqrt(3)*3/2),
    c(1/sqrt(15), 1/sqrt(5), (3/sqrt(5)-1)/sqrt(3)/2), 
    c(-2/sqrt(15), 0, (3/sqrt(5)-1)/sqrt(3)/2), 
    c(1/sqrt(15), -1/sqrt(5), (3/sqrt(5)-1)/sqrt(3)/2),
    c(-(sqrt(5)-1)/sqrt(15), 0, -(1+sqrt(5))/2/sqrt(5)/sqrt(3)), 
    c((sqrt(5)-1)/sqrt(15)/2, -(5-sqrt(5))/10, -(1+sqrt(5))/2/sqrt(5)/sqrt(3)), 
    c((sqrt(5)-1)/sqrt(15)/2, (5-sqrt(5))/10, -(1+sqrt(5))/2/sqrt(5)/sqrt(3)),
    c(-(sqrt(5)-1)/sqrt(15)/2, -(5-sqrt(5))/10, (1+sqrt(5))/2/sqrt(5)/sqrt(3)),
    c(-(sqrt(5)-1)/sqrt(15)/2, (5-sqrt(5))/10, (1+sqrt(5))/2/sqrt(5)/sqrt(3)),
    c((sqrt(5)-1)/sqrt(15), 0, (1+sqrt(5))/2/sqrt(5)/sqrt(3)),
    c(2/sqrt(15), 0, -(3/sqrt(5)-1)/sqrt(3)/2),
    c(-1/sqrt(15), 1/sqrt(5), -(3/sqrt(5)-1)/sqrt(3)/2),
    c(-1/sqrt(15), -1/sqrt(5), -(3/sqrt(5)-1)/sqrt(3)/2)
  )

library(AlphaHull3D)
library(rgl)

ahull <- ahull3d(pts, alpha = 1.5)
ahull$normals <- NULL

open3d(windowRect = c(50, 50, 562, 562), zoom = 0.7)
shade3d(ahull, color = "deeppink")
wire3d(ahull)

movie3d(spin3d(axis = c(1, 1, 1), rpm = 10),
        duration = 6, fps = 20,
        movie = "zzpic", dir = ".",
        convert = FALSE, webshot = FALSE,
        startTime = 1/20)

library(gifski)
gifski(
  png_files = Sys.glob("zzpic*.png"),
  gif_file = "greatStellatedDodecahedron.gif",
  width = 512,
  height = 512,
  delay = 1/11
)



