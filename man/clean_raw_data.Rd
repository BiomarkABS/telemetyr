% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_raw_data.R
\name{clean_raw_data}
\alias{clean_raw_data}
\title{Clean Raw Telemetry Data}
\usage{
clean_raw_data(raw_data = NULL, min_yr = 2017, max_yr = NA, filter_valid = T)
}
\arguments{
\item{raw_data}{a data frame containing raw data from telemetry receivers and the Tracker software,
typically an output from \code{read_txt_data()}}

\item{min_yr}{the minimum acceptable year (e.g. 2017), likely the year at the start of a season. Used to filter
errant dates that occur within the data pre-season.}

\item{max_yr}{maximum acceptable year (e.g. 2018), likely the year at the end of a season. Used to filter errant
dates that occur within the data post-season.}

\item{filter_valid}{should only valid records in the \code{raw_data} be returned?
Default is \code{TRUE} which only returns records where \code{valid == 1}. This uses the 4th column in the
raw Tracker software .txt downloads.}
}
\value{
a data frame similar to \code{raw_data} except cleaner
}
\description{
Perform initial cleaning of the raw telemetry data, typically an output from \code{read_txt_data()}
including formatting and filtering dates and the option to delete invalid observations.
}
\author{
Kevin See and Mike Ackerman
}
