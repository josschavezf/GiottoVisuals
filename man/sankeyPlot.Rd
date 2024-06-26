% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_sankey.R
\name{sankeyPlot}
\alias{sankeyPlot}
\alias{sankeyPlot,giotto,giottoSankeyPlan-method}
\alias{sankeyPlot,giotto,character-method}
\alias{sankeyPlot,data.frame,missing-method}
\alias{sankeyPlot,list,missing-method}
\alias{sankeyPlot,giottoPolygon,giottoPolygon-method}
\title{Create a sankey plot}
\usage{
\S4method{sankeyPlot}{giotto,giottoSankeyPlan}(
  x,
  y,
  meta_type = c("cell", "feat"),
  focus_names = NULL,
  unfocused_color = FALSE,
  ...
)

\S4method{sankeyPlot}{giotto,character}(
  x,
  y,
  spat_unit = NULL,
  feat_type = NULL,
  meta_type = c("cell", "feat"),
  idx = NULL,
  focus_names = NULL,
  unfocused_color = FALSE,
  ...
)

\S4method{sankeyPlot}{data.frame,missing}(x, focus_names = NULL, unfocused_color = FALSE, ...)

\S4method{sankeyPlot}{list,missing}(x, focus_names = NULL, unfocused_color = FALSE, ...)

\S4method{sankeyPlot}{giottoPolygon,giottoPolygon}(x, y, focus_names = NULL, unfocused_color = FALSE, ...)
}
\arguments{
\item{x}{data source (gobject, data.frame-like object with relations
between the first two cols provided, or giottoPolygon)}

\item{y}{giottoSankeyPlan object or character vector referring to source and
target columns in metadata if x is a gobject. Can also be missing or a
second giottoPolygon (see usage section)}

\item{meta_type}{whether to use 'cell' (cell) or 'feat' (feature) metadata}

\item{focus_names}{character vector of node names to display. Others will be
omitted.}

\item{unfocused_color}{whether to color nodes that are not focused on.}

\item{...}{
  Arguments passed on to \code{\link[networkD3:sankeyNetwork]{networkD3::sankeyNetwork}}
  \describe{
    \item{\code{Value}}{character string naming the variable in the \code{Links} data
frame for how far away the nodes are from one another.}
    \item{\code{NodeGroup}}{character string specifying the node groups in the
\code{Nodes}. Used to color the nodes in the network.}
    \item{\code{LinkGroup}}{character string specifying the groups in the
\code{Links}. Used to color the links in the network.}
    \item{\code{units}}{character string describing physical units (if any) for Value}
    \item{\code{colourScale}}{character string specifying the categorical colour
scale for the nodes. See
\url{https://github.com/d3/d3/blob/master/API.md#ordinal-scales}.}
    \item{\code{fontSize}}{numeric font size in pixels for the node text labels.}
    \item{\code{fontFamily}}{font family for the node text labels.}
    \item{\code{nodeWidth}}{numeric width of each node.}
    \item{\code{nodePadding}}{numeric essentially influences the width height.}
    \item{\code{margin}}{an integer or a named \code{list}/\code{vector} of integers
for the plot margins. If using a named \code{list}/\code{vector},
the positions \code{top}, \code{right}, \code{bottom}, \code{left}
are valid.  If a single integer is provided, then the value will be
assigned to the right margin. Set the margin appropriately
to accomodate long text labels.}
    \item{\code{height}}{numeric height for the network graph's frame area in pixels.}
    \item{\code{width}}{numeric width for the network graph's frame area in pixels.}
    \item{\code{iterations}}{numeric. Number of iterations in the diagramm layout for
computation of the depth (y-position) of each node. Note: this runs in the
browser on the client so don't push it too high.}
    \item{\code{sinksRight}}{boolean. If \code{TRUE}, the last nodes are moved to the
right border of the plot.}
  }}

\item{spat_unit}{spatial unit of metadata}

\item{feat_type}{feature type of metadata}

\item{idx}{table subset index for 1 to 1 comparisons}
}
\value{
sankey plot
}
\description{
Create a sankey plot. Pulls from information metadata if giotto object is
provided. Simple 1 to 1 sankeys can be generated from a single spatial unit
and feature type using the \code{spat_unit}, \code{feat_type}, \code{meta_type}, \code{cols},
and (optionally) \code{idx} params. More complex and cross spatial unit/feature
type sankeys can be set up using the \code{sankey_plan} param which accepts a
\code{giottoSankeyPlan} object.\cr
Also possible to directly use data.frames or lists of data.frames and
giottoPolygon objects. See usage section and examples.
}
\examples{
x <- data.frame(
    col1 = c("a", "a", "b"),
    col2 = c("1", "2", "2")
)
sankeyPlot(x)

y <- data.frame(
    col1 = "1",
    col2 = c("A", "B", "C")
)

# combine data.frames of relations
# rbind: note that node "1" is mapped the same for x and y
sankeyPlot(rbind(x, y), fontSize = 20)

# list: note that node "1" is now considered a different node between x and y
sankeyPlot(list(x, y), fontSize = 20)

# focus on specific nodes/names
sankeyPlot(rbind(x, y), fontSize = 20, focus_names = c("a", "1", "B"))

g <- GiottoData::loadGiottoMini("vizgen")
# with giottoSankeyPlan
leiden <- sankeySet(
    spat_unit = "aggregate",
    feat_type = "rna",
    col = "leiden_clus"
)
louvain <- sankeySet(
    spat_unit = "aggregate",
    feat_type = "rna",
    col = "louvain_clus"
)
# place defined sets into same object
plan <- leiden + louvain
# assign relationships to compare
sankeyRelate(plan) <- c(0, 1)
sankeyPlot(g, plan)

# with single set of metadata
GiottoClass::activeSpatUnit(g) <- "aggregate"
sankeyPlot(g, c("louvain_clus", "leiden_clus"))
}
\keyword{plotting}
\keyword{sankey}
