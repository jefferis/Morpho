% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/Atlas.r
\name{createAtlas}
\alias{createAtlas}
\title{Create an atlas needed in placePatch}
\usage{
createAtlas(mesh, landmarks, patch, corrCurves = NULL, patchCurves = NULL,
  keep.fix = NULL)
}
\arguments{
\item{mesh}{triangular mesh representing the atlas' surface}

\item{landmarks}{matrix containing landmarks defined on the atlas, as well
as on each specimen in the corresponding sample.}

\item{patch}{matrix containing semi-landmarks to be projected onto each
specimen in the corresponding sample.}

\item{corrCurves}{a vector or a list containing vectors specifiyng the rowindices of
\code{landmarks} to be curves that are defined on the atlas AND each specimen.
e.g. if landmarks 2:4 and 5:10 are two distinct curves, one would specifiy \code{corrCurves = list(c(2:4), c(5:10))}.}

\item{patchCurves}{a vector or a list containing vectors specifiyng the
rowindices of \code{landmarks} to be curves that are defined ONLY on the
atlas. E.g. if coordinates 5:10 and 20:40 on the \code{patch} are two
distinct curves, one would specifiy \code{patchCurves = list(c(5:10),c(20:40))}.}

\item{keep.fix}{in case corrCurves are set, specify explicitly which landmarks are not allowed to slide during projection (with \code{placePatch})}
}
\value{
Returns a list of class "atlas".  Its content is corresponding to
argument names.
}
\description{
Create an atlas needed in placePatch
}
\note{
This is a helper function of \code{\link{placePatch}}.
}
\examples{
data(nose)
atlas <- createAtlas(shortnose.mesh, landmarks =
            shortnose.lm[c(1:5,20:21),], patch=shortnose.lm[-c(1:5,20:21),])
}
\seealso{
\code{\link{placePatch}, \link{plotAtlas}}
}

