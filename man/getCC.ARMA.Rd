% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCC.ARMA.R
\name{getCC.ARMA}
\alias{getCC.ARMA}
\title{get Phase I corrected charting constant with an ARMA model}
\usage{
getCC.ARMA(
  fap0 = 0.05,
  interval = c(1, 4),
  n = 50,
  order = c(1, 0, 0),
  phi.vec = 0.5,
  theta.vec = NULL,
  case = "U",
  method = "MLE+MOM",
  nsim.coefs = 100,
  nsim.process = 1000,
  burn.in = 50,
  sim.type = "Matrix",
  verbose = FALSE
)
}
\arguments{
\item{fap0}{nominal false Alarm Probabilty in Phase 1}

\item{interval}{searching range of charting constants for the exact method}

\item{n}{number of observations}

\item{order}{order for ARMA model}

\item{phi.vec}{given vectors of autoregressive parameters for ARMA models}

\item{theta.vec}{given vectors of moving-average parameters for ARMA models}

\item{case}{known or unknown case.  When case = 'U', the parameters are unknown and the charting constant is calculated based on a bootstrapping method.  When case = 'K', the parameters are known and the charting constant is found using the quantile function of multivariate normal distribution}

\item{method}{estimation method for the control chart. When method = 'Method 3' is maximum likehood estimations plus method of moments. Other options are 'Method 1' which is pure MLE and 'Method 2' which is pure CSS.}

\item{nsim.coefs}{number of simulation for coeficients.  It is functional when double.sim = TRUE.}

\item{nsim.process}{number of simulation for ARMA processes}

\item{burn.in}{number of burn-ins.  When burn.in = 0, the ECM gets involved.  When burn.in is large enough, the ACM gets involved.}

\item{sim.type}{type of simulation.  When sim.type = 'Matrix', the simulation is generated using matrix computation.  When sim.type = 'Recursive', the simulation is based on a recursion.}

\item{verbose}{print diagnostic information about fap0 and the charting constant during the simulations for the exact method}

\item{phi}{vector of autoregressive coefficient(s).  When case = 'K', it must be provided. The length must be the same as the first value in the order.  It needs to be NULL if no autoregressor presents}

\item{theta}{vector of moving-average coefficient(s).  When case = 'K', it must be provided. The length must be the same as the third value in the order.  It needs to be NULL if no moving average presents}
}
\value{
Object type double. The corrected charting constant.
}
\description{
get Phase I corrected charting constant with an ARMA model
}
\examples{
# load the data in the package as an example
set.seed(12345)

# Calculate the charting constant using fap0 of 0.05, and 50 observations
getCC.ARMA(fap0=0.05, n=50, nsim.coefs=10, nsim.process=10)

}
