% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/meshres.r
\name{meshres}
\alias{meshres}
\title{calculate average edge length of a triangular mesh}
\usage{
meshres(mesh)
}
\arguments{
\item{mesh}{triangular mesh stored as object of class "mesh3d"}
}
\value{
returns average edge length (a.k.a. mesh resolution)
}
\description{
calculate average edge length of a triangular mesh, by iterating over all
faces.
}
\examples{
data(boneData)
mres <- meshres(skull_0144_ch_fe.mesh)
}
\author{
Stefan Schlager
}

