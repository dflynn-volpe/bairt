% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chain.study.R
\name{chain.study.bairt}
\alias{chain.study.bairt}
\title{Convergence graphs for the simulated values}
\usage{
\method{chain.study}{bairt}(mcmclist, parameter = "a", chain = 1,
  line = TRUE, ...)
}
\arguments{
\item{mcmclist}{A \emph{mcmc.2pnob} or \emph{mcmc.3pnob} class object.}

\item{parameter}{The parameter (\emph{a}, \emph{b}, \emph{c} or
\emph{theta}) for graphing.}

\item{chain}{The number of the chain that will be graphed.}

\item{line}{A red line that represent the posterior mean of the
simulated values.}

\item{...}{Further arguments.}
}
\value{
Convergence graphs for the study of the simulated values for an MCMC
marginal chain.
}
\description{
Convergence graphs for the study of the simulated values for an MCMC
marginal chain.
}
\details{
The top left graph displays the sequence of simulated values and the top
right graph displays the lag correlations of the sequence as a function of
the lag value. The bottom left graph is a histogram of the simulated values
and the bottom right graph is the box plot of the simulated values.
}
\examples{
# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
check.plot(model2)
chain.study(model2, parameter = "b", chain = 12)
chain.study(model2, parameter = "theta", chain = 10)

\donttest{
# For all examinees of the data
# Two-Parameter Normal Ogive Model
modelAll2 <- mcmc.2pnob(MathTest, iter = 3500, burning = 500, thin = 10)
check.plot(modelAll2)
chain.study(modelAll2, parameter = "b", chain = 14)
chain.study(modelAll2, parameter = "theta", chain = 10)

# Three-Parameter Normal Ogive Model
modelAll3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500, thin = 10)
check.plot(modelAll3)
chain.study(modelAll3 , parameter = "b", chain = 12)
chain.study(modelAll3 , parameter = "c", chain = 10)
}

## End(Not run)

}
\references{
Johnson, V. E. & Albert, J. H. (1999). Ordinal Data Modeling.
New York: Springer.
}
\seealso{
\code{\link{mcmc.2pnob}}, \code{\link{mcmc.3pnob}} and
\code{\link{continue.mcmc}}.
}
\author{
Javier Martínez
}
