% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PH1ARMA.R
\name{PH1ARMA}
\alias{PH1ARMA}
\title{Phase I individual control chart with an ARMA model}
\usage{
PH1ARMA(
  X,
  cc = NULL,
  fap0 = 0.05,
  order = c(1, 0),
  plot.option = TRUE,
  interval = c(1, 4),
  case = "U",
  phi.vec = NULL,
  theta.vec = NULL,
  mu0 = NULL,
  sigma0 = NULL,
  method = "MLE+MOM",
  nsim.coefs = 100,
  nsim.process = 1000,
  burn.in = 50,
  sim.type = "Recursive",
  transform = "none",
  lambda = 1,
  standardize = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{X}{input and it must be a vector (m by 1)}

\item{cc}{nominal Phase I charting constant. If this is given, the function will not re-compute the charting constant.}

\item{fap0}{nominal false Alarm Probabilty in Phase I}

\item{order}{order for ARMA(p, q) model}

\item{plot.option}{- draw a plot for the process; TRUE - Draw a plot for the process, FALSE - Not draw a plot for the process}

\item{interval}{searching range of charting constants for the exact method}

\item{case}{known or unknown case.  When case = 'U', the parameters are estimated, when case = 'K', the parameters need to be input}

\item{phi.vec}{a vector of length p containing autoregressive coefficient(s).  When case = 'K', the vector must have a length equal to the first value in the order.  If no autoregressive coefficent presents, set phi.vec = NULL}

\item{theta.vec}{a vector of length q containing moving-average coefficient(s).  When case = 'K', the vector must have a length equal to the first value in the order.  If no moving-average coefficent presents, set theta.vec = NULL}

\item{mu0}{value of the IC process mean.  When case = 'K', the value needs to be provided.}

\item{sigma0}{value of the IC process standard deviation.  When case = 'K', the value needs to be provided.}

\item{method}{estimation method for the control chart. When method = 'MLE+MOM' is maximum likehood estimations plus method of moments. Other options are 'MLE' which is pure MLE and 'CSS' which is pure CSS.}

\item{nsim.coefs}{number of simulation for coefficients.}

\item{nsim.process}{number of simulation for ARMA processes}

\item{burn.in}{number of burn-ins.  When burn.in = 0, the simulated process is assumed to be in the initial stage.  When burn.in is sufficiently large (e.g., the default value of 50), the simulated process is assumed to have reached a stable state.}

\item{sim.type}{type of simulation. When sim.type = 'Recursive', the simulation is generated recursively, as in the ARMA model. When sim.type = 'Matrix', the simulation is generated using the covariance matrix among observations, derived from the relationship between the ARMA coefficient(s) and the partial autocorrelation(s). Note that sim.type = 'Matrix' is primarily used as a proof of concept and is not recommended for practical use due to its high computational cost.}

\item{transform}{type of transformation. When transform = 'none', no transformation is performed. When transform = 'boxcox', the Box-Cox transformation is used. When transform = 'yeojohnson', the Yeo-Johnson transformation is used.}

\item{lambda}{parameter used in the Box-Cox or Yeo-Johnson transformation.}

\item{standardize}{Output standardized charting statistics instead of raw ones. When standardize = TRUE, the standardization is used.  When standardize = FALSE, the standardization is not performed.}

\item{verbose}{print diagnostic information about fap0 and the charting constant during the simulations for the exact method}
}
\value{
CL Object type double - central line

gamma Object type double - process variance estimate

cc Object type double - charting constant

order Object type integer - order for ARMA model

phi.vec Object type integer - values of autoregressors

theta.vec Object type integer - values of moving averages

LCL Object type double - lower charting limit

UCL Object type double - upper charting limit

CS Object type double - charting statistic
}
\description{
Build a Phase I individual control chart for the ARMA models. The charting constant is corrected by this approach.
}
\examples{
# load the data in the package as an example
data(preston_data)

# set number of simulations
nsim.process <- 10
nsim.coefs <- 10

# An example using the default setting whose fap0 = 0.1
PH1ARMA(preston_data, nsim.process = nsim.process, nsim.coefs = nsim.coefs)

# When users get an error message about the size of matrix,
# the function needs to use the alternative simulation type as follows
PH1ARMA(preston_data, fap0 = 0.05, 
	nsim.process = nsim.process, nsim.coefs = nsim.coefs, sim.type = 'Recursive')

}
\references{
Yao, Y., Chakraborti, S., Yang, X., Parton, J., Lewis Jr, D., and Hudnall, M. (2023). Phase I control chart for individual autocorrelated data: application to prescription opioid monitoring. Journal of Quality Technology, 55(3), 302-317.
}
