## code to prepare `flattax` dataset

library(data.table)


tdir    <- tempdir()
taxfile <- paste0(tdir, "/new_taxdump.zip")

rankedtaxfile <- paste0(tdir, "/rankedlineage.dmp")


download.file(
  "ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip",
  taxfile
)

unzip(taxfile, tdir)


if (!file.exists(rankedtaxfile)) {
  stop("Error uncompressing Taxfile from NCBI.")
}


flattax <- data.table::fread(
  sep = "",
  header = FALSE,
  rankedtaxfile
)


flattax[,
        c("tax_id", "tax_name", "species", "genus", "family", "order", "class", "phylum", "kingdom", "superkingdom")
        := tstrsplit(V1, "\t|\t", fixed=T)][
          , V1 := NULL][
            , superkingdom := tstrsplit(superkingdom, "\t", keep=1)]


# Species Plus Strains: 1941033
usethis::use_data(flattax, overwrite = TRUE)




## Previous Build ----------------------

#library(dplyr)
#library(tidyr)
#library(taxizedb)

#' #' get_species_ids
#' #'
#' #' use taxizedb SQLite dataset to retrieve species below a high_level_taxid
#' #'
#' #' @param high_level_taxid. Required. Integer.
#' #' @importFrom taxizedb downstream
#' #' @importFrom taxizedb src_ncbi
#' #' @export
#' #' @example
#' #' \dontrun{
#' #' species_ids <- get_species_ids()
#' #' }
#' get_species_ids <- function() {
#'   db <- src_ncbi()
#'   nodes <- tbl(db, "nodes")
#'
#'   nodes %>%
#'     filter(rank %in% c("species", "strain")) %>%
#'     select(tax_id) %>%
#'     as.data.frame() %>%
#'     .$tax_id
#'
#'
#'   #downstream(high_level_taxid, db='ncbi', downto='species')[[1]]$childtaxa_id
#' }
#'
#' #' create_flat_tax_table
#' #'
#' #' @param taxid. Required. The NCBI taxonom ID used to generate the tax table.
#' #' @param taxlevels. Optional. Default \code{c('superkingdom', 'kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species')}
#' #' @importFrom taxizedb classification
#' #' @importFrom dplyr filter %>% slice_head group_by ungroup
#' #' @importFrom tidyr spread
#' #' @export
#' #' @examples
#' #' \dontrun{
#' #' bacteria <-   get_species_ids(2)
#' #' tax_table <- Reduce(
#' #'   rbind,
#' #'   parallel::mclapply(bacteria, create_flat_table, mc.cores = 6))
#' #' }
#' create_flat_tax_table <- function(
#'   taxid,
#'   taxlevels= c('superkingdom', 'kingdom','phylum', 'class',
#'                'order', 'family', 'genus', 'species')) {
#'
#'   df1 <- taxizedb::classification(taxid)[[1]]
#'   df1 <- df1 %>% filter(rank %in% taxlevels)
#'   df1 <- df1 %>% select(name, rank)
#'
#'   # add dummy data so you are not missing any ranks
#'   df2 <- rbind(df1, expand.grid(name="Unknown", rank=taxlevels)) %>%
#'     group_by(rank) %>%
#'     slice_head(1) %>%
#'     ungroup()
#'
#'   # cast to wide format which can be used in rbind or output to a file
#'   cbind( tidyr::spread(df2, rank, name), taxid=taxid)
#' }
#'
#'
#' #' write_taxonomy_flatfile
#' #'
#' #' write the taxonomy flatfile to disk
#' #' @example
#' #' \dontrun {
#' #' write_taxonomy_flatfile(2, "~/Downloads/temp_tax1.txt")
#' #' }
#' write_taxonomy_flatfile <- function(taxid, outfile, ncpus=1, ...) {
#'   tmp <- tempfile()
#'   print(tmp)
#'   on.exit(unlink(tmp))
#'
#'   print('Retrieving IDs')
#'   ids     <- get_species_ids()
#'   print('Creating All Taxids')
#'
#'   parallel::mclapply(
#'     ids,
#'     function(id) {
#'       #print(id)
#'       df <- create_flat_tax_table(id)
#'       write.table(df,
#'                   file = tmp,
#'                   quote = FALSE,
#'                   sep="\t",
#'                   row.names = FALSE,
#'                   col.names = FALSE,
#'                   append = TRUE)
#'     },
#'     mc.cores=ncpus)
#'
#'   file.copy(tmp, outfile)
#' }

#' #' create_flattax_db
#' #'
#' #'
#' #'
#' create_flattax_db <- function() {
#'   headers <-  c('class',  'family', 'genus', 'kingdom',  'order', 'phylum',
#'                 'species', 'superkingdom','taxid')
#'   write_taxonomy_flatfile(taxid = 1, outfile = "tax.tax", npcus = 6)
#'
#'   dt1 <-data.table::fread("out.tax", col.names = headers)
#'   con <-  RSQLite::dbConnect(RSQLite::SQLite(), dbname=flat_tax_file)
#'
#'   RSQLite::dbWriteTable(
#'     conn   = db,
#'     name   = 'taxonomy',
#'     value  = dt1,
#'     append = FALSE
#'   )
#'
#'   RSQLite::dbDisconnect(db)
#'
#' }
#'


# download the ncbi_taxonomy_database
# taxizedb::db_download_ncbi()
#
# write_taxonomy_flatfile(
#   taxid = 1,
#   outfile = "data-raw/flattax.txt",
#   npcus = 1)
#
#
# flattax <- data.table::fread(
#   "data-raw/flattax.txt",
#   col.names=c('class',  'family', 'genus', 'kingdom', 'order',
#               'phylum','species', 'superkingdom', 'taxid'))


