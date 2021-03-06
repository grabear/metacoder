% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculations.R
\name{calc_group_stat}
\alias{calc_group_stat}
\title{Apply a function to groups of columns}
\usage{
calc_group_stat(obj, data, func, groups = NULL, cols = NULL,
  other_cols = FALSE, out_names = NULL, dataset = NULL)
}
\arguments{
\item{obj}{A \code{\link[taxa]{taxmap}} object}

\item{data}{The name of a table in \code{obj$data}.}

\item{func}{The function to apply. It should take a vector and return a
single value. For example, \code{\link{max}} or \code{\link{mean}} could
be used.}

\item{groups}{Group multiple columns per treatment/group. This should be a
vector of group IDs (e.g. character, integer) the same length as
\code{cols} that defines which samples go in which group. When used, there
will be one column in the output for each unique value in \code{groups}.}

\item{cols}{The columns in \code{data} to use. By
default, all numeric columns are used. Takes one of the following inputs:
\describe{
\item{TRUE/FALSE:}{All/No columns will used.}
\item{Character vector:}{The names of columns to use} \item{Numeric vector:}{The indexes of
columns to use}
\item{Vector of TRUE/FALSE of length equal to the number of columns:}{Use the columns corresponding to \code{TRUE} values.} }}

\item{other_cols}{Preserve in the output non-target columns present in the
input data. New columns will always be on the end. The "taxon_id" column
will be preserved in the front. Takes one of the following inputs:
\describe{
\item{NULL:}{No columns will be added back, not even the taxon id column.}
\item{TRUE/FALSE:}{All/None of the non-target columns will be preserved.}
\item{Character vector:}{The names of columns to preserve}
\item{Numeric vector:}{The indexes of columns to preserve}
\item{Vector of TRUE/FALSE of length equal to the number of columns:}{Preserve the columns corresponding to \code{TRUE} values.}}}

\item{out_names}{The names of count columns in the output. Must be the same
length as \code{cols} (or \code{unique(groups)}, if \code{groups} is used).}

\item{dataset}{DEPRECIATED. use "data" instead.}
}
\value{
A tibble
}
\description{
For a given table in a \code{\link[taxa]{taxmap}} object, apply a function to
rows in groups of columns. The result of the function is used to create new
columns. This is equivalent to splitting columns of a table by a factor and
using \code{apply} on each group.
}
\examples{
\dontrun{
# Parse data for examples
x = parse_tax_data(hmp_otus, class_cols = "lineage", class_sep = ";",
                   class_key = c(tax_rank = "info", tax_name = "taxon_name"),
                   class_regex = "^(.+)__(.+)$")

# Apply a function to every value without grouping 
calc_group_stat(x, "tax_data", function(v) v > 3)

# Calculate the means for each group
calc_group_stat(x, "tax_data", mean, groups = hmp_samples$sex)

# Calculate the variation for each group
calc_group_stat(x, "tax_data", sd, groups = hmp_samples$body_site)

# Different ways to use only some columns
calc_group_stat(x, "tax_data", function(v) v > 3,
                cols = c("700035949", "700097855", "700100489"))
calc_group_stat(x, "tax_data", function(v) v > 3,
                cols = 4:6)
calc_group_stat(x, "tax_data", function(v) v > 3,
                cols = startsWith(colnames(x$data$tax_data), "70001"))

# Including all other columns in ouput
calc_group_stat(x, "tax_data", mean, groups = hmp_samples$sex,
                other_cols = TRUE)

# Inlcuding specific columns in output
calc_group_stat(x, "tax_data", mean, groups = hmp_samples$sex,
                other_cols = 2)
calc_group_stat(x, "tax_data", mean, groups = hmp_samples$sex,
                other_cols = "otu_id")

# Rename output columns
calc_group_stat(x, "tax_data", mean, groups = hmp_samples$sex,
               out_names = c("Women", "Men"))

}
}
\seealso{
Other calculations: \code{\link{calc_group_mean}},
  \code{\link{calc_group_median}},
  \code{\link{calc_group_rsd}},
  \code{\link{calc_n_samples}},
  \code{\link{calc_obs_props}},
  \code{\link{calc_prop_samples}},
  \code{\link{calc_taxon_abund}},
  \code{\link{compare_groups}},
  \code{\link{counts_to_presence}},
  \code{\link{rarefy_obs}}, \code{\link{zero_low_counts}}
}
\concept{calculations}
