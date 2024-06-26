% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gg_annotation_raster.R
\name{gg_annotation_raster}
\alias{gg_annotation_raster}
\alias{gg_annotation_raster,gg,list-method}
\alias{gg_annotation_raster,gg,giottoImage-method}
\alias{gg_annotation_raster,gg,giottoLargeImage-method}
\title{Append image to ggplot as annotation_raster}
\usage{
\S4method{gg_annotation_raster}{gg,list}(ggobj, gimage, ...)

\S4method{gg_annotation_raster}{gg,giottoImage}(ggobj, gimage, ...)

\S4method{gg_annotation_raster}{gg,giottoLargeImage}(ggobj, gimage, ext = NULL, ...)
}
\arguments{
\item{ggobj}{ggplot2 \code{gg} object}

\item{gimage}{\code{giottoLargeImage}, \code{giottoImage} or \code{list} thereof}

\item{\dots}{additional params to pass}

\item{ext}{Object that responds to \code{ext()}. Defines the plot spatial ROI
that the image should be sampled for.}
}
\value{
\code{gg} object with images to plot appended as annotation rasters
}
\description{
Append image to ggplot as annotation_raster
}
\details{
No ... params are implemented for \code{giottoImage}. \cr ... params for
\code{giottoLargeImage} passes to automated resampling params see
\code{?auto_image_resample} for details
}
\keyword{internal}
