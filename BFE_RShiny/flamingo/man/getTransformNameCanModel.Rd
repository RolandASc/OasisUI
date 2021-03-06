% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flamingoDB.R
\name{getTransformNameCanModel}
\alias{getTransformNameCanModel}
\title{Get Transforms from Canonical to Model}
\usage{
getTransformNameCanModel(dbSettings)
}
\arguments{
\item{dbSettings}{setting object as returned by e.g. \link{flamingoDB}}
}
\value{
transforms; \code{data.frame} of 2 variables:
\itemize{
		\item \code{TransformName}
		\item \code{TransformID}
}
}
\description{
Get Transforms from Canonical to Model
}
