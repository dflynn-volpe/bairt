% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.3pnob.R
\name{mcmc.3pnob}
\alias{mcmc.3pnob}
\title{MCMC Estimation of the Three-Parameter Normal Ogive Model}
\usage{
mcmc.3pnob(data, initial.value = NULL, c.prior = c(1, 1), iter = 1000,
           burning = 500, thin = 1, parts = 3, ...)
}
\arguments{
\item{data}{Data frame with dichotomous item responses.}

\item{initial.value}{List with initial values}

\item{c.prior}{A vector of length two which defines the beta prior
distribution of guessing parameters. The default is a non-informative prior,
\emph{Beta(1,1)}.}

\item{iter}{Total number of iterations.}

\item{burning}{Number of burnin iterations.}

\item{thin}{The thinning interval between consecutive observations.}

\item{parts}{Number of splits for MCMC chain.}

\item{...}{Further arguments.}
}
\value{
An object of class \emph{mcmc.3pnob.} This is a list with the following
elements:
  \item{mcmcobj}{A list with the \emph{a}, \emph{b}, y \emph{theta} chains.}
  \item{diagnostic}{A list with the \emph{diag} matrix (it is a summary whit
  Rhat included) and the residual \emph{deviance}.}
  \item{information}{A list with the \emph{final.values} (values of the last
  iteration for each chain), and the arguments \emph{c.prior}, \emph{iter},
  \emph{burning}, \emph{data}, \emph{thin}, \emph{parts} and \emph{model},
  respectively.}
}
\description{
This function estimates the Three-Parameter normal ogive item response model
by MCMC sampling (Beguin & Glas, 2001, p. 542). It is a modification of the
function \emph{mcmc.3pno.testlet} of the \emph{sirt} package.
}
\details{
For the Three-parameter normal ogive item response model, we assume that the
\emph{i-th} individuals performance on a test depends on an unknown latent
variable \eqn{\theta_i} , and we let  \eqn{\theta_1, ...,\theta_n} denote
the latent traits for all \eqn{n} individuals taking the test.

We assume that the probability that an individual answers a test item
correctly depends only on their latent trait value and characteristics of
the item. For the \emph{i-th} individual and \emph{jth} item, we model this
probability as:

 \deqn{Pr( Y_{ ij } = 1 | \theta_i, a_ j, b_ j, c_ j ) =
 c_ j + (1 - c_ j )\Phi( a_ j\theta_i - b_ j )},

where \eqn{\Phi} is the standard normal cdf, and \eqn{a_ j}, \eqn{b_ j} and
\eqn{c_ j} are the item discrimination, item difficulty and  item guessing
parameters associated with the \emph{j-th} item
(Beguin & Glas, 2001, p. 542).
}
\examples{
# data for model
data("MathTest")

# estimate model only for the first 500 examinees of the data MathTest
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
# estimate model only for the first 500 examinees of the data MathTest
model3 <- mcmc.3pnob(MathTest[1:500,], iter = 300, burning = 0,
                    c.prior = cprior)

# study of chains convergence model3
check.plot(model3)
diagnostic.mcmc(model3)
parameter.plot(model3)
chain.study(model3, parameter = "a", chain = 15)
irc(model3, item = 1)

\donttest{
# continue the  MCMC
# form 1
initialValues2 <- final.values.mcmc(model3)
model31 <- mcmc.3pnob(MathTest[1:500,], initial.value = initialValues2,
                     iter = 3000, burning = 0, c.prior = cprior)
# form 2
model32 <- continue.mcmc(model3, iter = 3000, burning = 0)
}

## End(Not run)

}
\references{
Beguin, A, A. & Glas, C.A.W. (2001). MCMC Estimation and Some
Model-Fit Analysis of Multidimensional IRT Models. Psychometrika,
66, 541-562.
}
\seealso{
\code{\link{mcmc.2pnob}}, \code{\link{continue.mcmc.bairt}},
\code{\link[coda]{gelman.diag}} and \code{\link[coda]{as.mcmc}}.
}
\author{
Javier Martínez

The code is adapted from an R script of Alexander Robitzsch.
(\url{https://github.com/alexanderrobitzsch/sirt/blob/master/R/mcmc.3pno.testlet.R})
}
