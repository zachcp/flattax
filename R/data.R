#' @importFrom data.table data.table
NULL

#' flattax.
#'
#'
#' NCBI taxonomy file with 10 phylogeneric levels and a taxid:
#'
#'
#' @seealso \url{ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip}
#'
#' @format A data frame with ten variables:
#' \describe{
#'   \item{\code{tax_id}}{node id}
#'   \item{\code{tax_name}}{cientific name of the organism}
#'   \item{\code{species}}{name of a species (coincide with organism name for species-level nodes)}
#'   \item{\code{genus}}{genus name when available}
#'   \item{\code{family}}{family name when available}
#'   \item{\code{order}}{order name when available}
#'   \item{\code{class}}{class name when available}
#'   \item{\code{phylum}}{phylum name when available}
#'   \item{\code{kingdom}}{kingdom name when available}
#'   \item{\code{superkingdom}}{superkingdom name when available}
#' }
#'
"flattax"

