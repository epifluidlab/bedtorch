% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manipulation.R
\name{map_bed}
\alias{map_bed}
\title{Map over scaffold intervals}
\usage{
map_bed(
  x,
  y,
  operation,
  max_gap = -1L,
  min_overlap = 0L,
  min_overlap_type = c("bp", "frac1", "frac2")
)
}
\arguments{
\item{x}{A \code{GRanges} object.}

\item{y}{A \code{GRanges} object containing intervals upon which you
want to map \code{data}.}

\item{operation}{List of functions for the statistics and summary operations.
This is similar to \code{\link[=merge_bed]{merge_bed()}}}

\item{max_gap}{The largest gap for two intervals to be considered as
overlapping. Default is -1 (no gap allowed, adjacent intervals not allowd).}

\item{min_overlap}{See \code{\link[=intersect_bed]{intersect_bed()}}.}

\item{min_overlap_type}{\code{\link[=intersect_bed]{intersect_bed()}}.}
}
\value{
A mapped \code{GRanges} object.
}
\description{
Map overlapping features in \code{data} onto intervals in \code{scaffold} and apply
statistics and/or summary operations on those features.
}
\examples{
# Load BED tables
tbl_x <- read_bed(system.file("extdata", "example_merge.bed", package = "bedtorch"))
tbl_y <- read_bed(system.file("extdata", "example_intersect_y.bed", package = "bedtorch"))

# Basic usage
result <- map_bed(tbl_x, tbl_y, operation = list(score_mean = list(on = "score", func = mean)))
head(result)

# Perform the mapping, requiring the minimum overlapping of 5bp
result <- map_bed(tbl_x, tbl_y, operation = list(score_mean = list(on = "score", func = mean)), 
                  min_overlap = 5, min_overlap_type = "bp")
head(result)
}
\references{
Manual page of \verb{bedtools map}:
\url{https://bedtools.readthedocs.io/en/latest/content/tools/map.html}
}
\seealso{
\code{\link[=merge_bed]{merge_bed()}}, \code{\link[=intersect_bed]{intersect_bed()}} \code{\link[GenomicRanges:findOverlaps-methods]{GenomicRanges::findOverlaps()}}
}
