% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/round_tag_codes.R
\name{round_tag_codes}
\alias{round_tag_codes}
\title{Round Tag Codes}
\usage{
round_tag_codes(
  data_df = NULL,
  round_to = 5,
  timer_tag_code = "57",
  noise_tag_code = "99"
)
}
\arguments{
\item{data_df}{any data frame with a column named \code{tag_code}}

\item{round_to}{the integer that the user would like to round \code{tag_code} to. Currently supports
either 5 or 10. If \code{round_to = 5}, will round to the nearest 5. If \code{round_to = 10}, will round
to the nearest 0.}

\item{timer_tag_code}{the beginning of the tag code associated with timer tags. Default value is "57".}

\item{noise_tag_code}{the beginning of the tag code associated with noise tags. Default value is "99".}
}
\value{
a data frame containing all the original columns, plus an additional column \code{tag_id}
containing the fixed tag IDs
}
\description{
Round the tag IDs from a receiver to the nearest 5 or 0 to better match possible tag codes
}
\author{
Kevin See and Mike Ackerman
}
