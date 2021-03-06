% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarise_movement.R
\name{summarise_movement}
\alias{summarise_movement}
\title{Summarize Movement Rates and Times}
\usage{
summarise_movement(
  cap_hist_long = NULL,
  tags = NULL,
  which_obs = c("first_obs", "last_obs"),
  hr_max = NULL
)
}
\arguments{
\item{cap_hist_long}{a data frame containing capture histories in long format. Typically, the \code{ch_long} object
in the \code{cap_hist_list} returned from \code{prep_capture_history}.}

\item{tags}{a vector of tag IDs that the user would like to extract data for}

\item{which_obs}{the column in \code{cap_hist_long} containing the dates and times in POSIXct format the user
would like to use to calculate movement times. The default is "first_obs", but also currently allows "last_obs".}

\item{hr_max}{an optional argument to force the ylim of \code{reach_hours_box_p}. Warning: by setting \code{hr_max}
to a value less than the range of the data, outlier values will be excluded from plotting.}
}
\value{
a list containing summaries of movement rates and times
}
\description{
Summarise movement times and rates between sites. Currently, the function is only built to
evaluate movement times/rates, spatially, but may be modified in the future to evaluate times/rates
temporally as well.
}
\author{
Mike Ackerman and Kevin See
}
