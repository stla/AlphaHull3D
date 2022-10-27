phi <- (1 + sqrt(5))/2
vertices <- 
  rbind(
    c(0, 0, phi/sqrt(3)*3), 
    c(2*phi/sqrt(3), 0, -phi*sqrt(5/3)), 
    c(-phi/sqrt(3), phi, -phi*sqrt(5/3)), 
    c(-phi/sqrt(3), -phi, -phi*sqrt(5/3)),
    c(-phi*sqrt(5/3), phi, phi/sqrt(3)),
    c(-phi*sqrt(5/3), -phi, phi/sqrt(3)),
    c(-1/phi/sqrt(3), -(sqrt(5)+3)/2, phi/sqrt(3)), 
    c((2+sqrt(5))/sqrt(3), -1, phi/sqrt(3)), 
    c((2+sqrt(5))/sqrt(3), 1, phi/sqrt(3)),
    c(-1/phi/sqrt(3), (sqrt(5)+3)/2, phi/sqrt(3)),
    c(1/phi/sqrt(3), -(sqrt(5)+3)/2, -phi/sqrt(3)),
    c(1/phi/sqrt(3), (sqrt(5)+3)/2, -phi/sqrt(3)),
    c(phi*sqrt(5/3), phi, -phi/sqrt(3)),
    c(-(2+sqrt(5))/sqrt(3), -1, -phi/sqrt(3)),
    c(-(2+sqrt(5))/sqrt(3), 1, -phi/sqrt(3)),
    c(phi*sqrt(5/3), -phi, -phi/sqrt(3)),
    c(phi/sqrt(3), phi, phi*sqrt(5/3)),
    c(phi/sqrt(3), -phi, phi*sqrt(5/3)),
    c(-2*phi/sqrt(3), 0, phi*sqrt(5/3)),
    c(0, 0, -phi/sqrt(3)*3),
    c(1/sqrt(15), 1/sqrt(5), (3/sqrt(5)-1)/sqrt(3)/2), 
    c(-2/sqrt(15), 0, (3/sqrt(5)-1)/sqrt(3)/2), 
    c(1/sqrt(15), -1/sqrt(5), (3/sqrt(5)-1)/sqrt(3)/2),
    c(-(sqrt(5)-1)/sqrt(15), 0, -phi/sqrt(15)), 
    c((phi-1)/sqrt(15), -(5-sqrt(5))/10, -phi/sqrt(15)), 
    c((phi-1)/sqrt(15), (5-sqrt(5))/10, -phi/sqrt(15)),
    c(-(phi-1)/sqrt(15), -(5-sqrt(5))/10, phi/sqrt(15)),
    c(-(phi-1)/sqrt(15), (5-sqrt(5))/10, phi/sqrt(15)),
    c((sqrt(5)-1)/sqrt(15), 0, phi/sqrt(15)),
    c(2/sqrt(15), 0, -(3/sqrt(5)-1)/sqrt(3)/2),
    c(-1/sqrt(15), 1/sqrt(5), -(3/sqrt(5)-1)/sqrt(3)/2),
    c(-1/sqrt(15), -1/sqrt(5), -(3/sqrt(5)-1)/sqrt(3)/2)
  )

# ratio large/small
r <- sqrt(3)*phi / sqrt(3-phi)

cp <- sqrt(apply(vertices, 1L, crossprod))
small <- min(cp)
large <- max(cp)
small <- sqrt((5-sqrt(5))/10)
large <- sqrt((9+3*sqrt(5))/2) 
ismall <- cp < 1
vertices[ismall, ] <- vertices[ismall, ] / small * large / r

gissid <- round(vertices, 7L)
