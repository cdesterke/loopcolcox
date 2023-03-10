% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coxbycol.R.R
\name{coxbycol}
\alias{coxbycol}
\title{coxbycol
perform loop of cox univariate analyses among columns of dataframe}
\usage{
data(cancer)

library(dplyr)

cancer%>%select(3:7)->data

df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
}
\arguments{
\item{time}{time of follow in time unit for the Surv object}

\item{event}{event 0 or 1 for censoring Surv object}

\item{data}{dataframe with columns to test}
}
\description{
coxbycol
perform loop of cox univariate analyses among columns of dataframe
}
\examples{
data(cancer)
library(dplyr)
cancer\%>\%select(3:7)->data
df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
df
}
