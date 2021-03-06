% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/asymPermu.r
\name{asymPermute}
\alias{asymPermute}
\title{Assess differences in amount and direction of asymmetric variation}
\usage{
asymPermute(x, groups, rounds = 1000, which = NULL)
}
\arguments{
\item{x}{object of class symproc result from calling \code{\link{procSym}} with \code{pairedLM} specified}

\item{groups}{factors determining grouping.}

\item{rounds}{number of permutations}

\item{which}{select which factorlevels to use, if NULL, all pairwise differences will be assessed after shuffling pooled data.}
}
\value{
\item{dist }{difference between vector lengths of group means}
\item{angle }{angle (in radians) between vectors of group specific asymmetric deviation}
\item{means }{actual group averages}
\item{p.dist }{p-value obtained by comparing the actual distance to randomly acquired distances}
\item{p.angle }{p-value obtained by comparing the actual angle to randomly acquired angles}
 \item{permudist }{vector containing differences between random group means' vector lenghts}
 \item{permuangle }{vector containing angles between random group means' vectors}
\item{groupmeans}{ array with asymmetric displacement per group}
\item{levels}{ character vector containing the factors used}
}
\description{
Assess differences in amount and direction of asymmetric variation
}
\note{
This test is only sensible if between-group differences concerning directional asymmetry have been established (e.g. by applying a MANOVA on the "asymmetric" PCscores (see also \code{\link{procSym}}) and one wants to test whether these can be attributed to differences in amount and/or direction of asymmetric displacement. If there is no or only very little directional asymmetry present, the angles will only be significan when larger than 90 degrees (pi/2). So careful interpretation is advised.
}
\seealso{
\code{\link{procSym}}
}

