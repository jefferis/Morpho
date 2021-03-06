% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/pcAlign.r
\name{pcAlign}
\alias{pcAlign}
\alias{pcAlign.matrix}
\alias{pcAlign.mesh3d}
\title{align two 3D-pointclouds/meshes by their principal axes}
\usage{
pcAlign(x, y, optim = TRUE, subsample = NULL)

\method{pcAlign}{matrix}(x, y, optim = TRUE, subsample = NULL)

\method{pcAlign}{mesh3d}(x, y, optim = TRUE, subsample = NULL)
}
\arguments{
\item{x}{matrix or mesh3d}

\item{y}{matrix or mesh3d, if missing, x will be centered by its centroid and aligned by its princial axis.}

\item{optim}{logical if TRUE, all possible PC-axis are tested and the rotation with the smallest RMSE between configs will be used.}

\item{subsample}{integer use subsampled points to decrease computation time}
}
\value{
rotated and translated version of x to the center and principal axes of y.
}
\description{
align two 3D-pointclouds/meshes by their principal axes
}
\details{
\code{x} and \code{y} will first be centered and aligned by their PC-axes. If \code{optim=TRUE},all possible 8 ordinations of PC-axes will be tested and the one with the smallest RMSE between the transformed version of \code{x} and the closest points on \code{y} will be used. Then the rotated version of \code{x} is translated to the original center of mass of \code{y}.
}
\examples{
data(boneData)
blm1 <- pcAlign(boneLM[,,1],boneLM[,,2])
\dontrun{
require(rgl)
spheres3d(boneLM[,,1])#original position
spheres3d(blm1,col=2)#aligned configuration
spheres3d(boneLM[,,2],col=3)#target
}
}

