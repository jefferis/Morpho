% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/asymPermu.r
\name{meanMat}
\alias{meanMat}
\title{fast calculation of a Matrix' per row/ per column mean - useful for very large matrices}
\usage{
meanMat(A, usedim = 2)
}
\arguments{
\item{A}{numeric matrix}

\item{usedim}{integer: select over which dimension to average}
}
\value{
vector containing row/column mean
}
\description{
fast calculation of a Matrix' per row/ per column mean - equivalent to apply(X,2,mean) or apply(X,1,mean)- useful for very large matrices
}
\examples{
A <- matrix(rnorm(1e6),1000,1000)
b <- meanMat(A)
# same as apply(A,2,mean)
b1 <- meanMat(A,1)
# same as apply(A,1,mean)
\dontrun{
#compare timing
system.time(meanMat(A))
system.time(apply(A,2,mean))
}
}

