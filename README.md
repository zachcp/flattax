
# flattax

<!-- badges: start -->
<!-- badges: end -->

The goal of `flattax` is to provide a simplified view on NCBI's
taxonomic heirarchy. It provides the following datasets:

 - `flattax`:  A nine-column dataframe of taxonomic levels and the NCBI taxid. Calculated for all specied-level taxids as of 20200710

## Installatation


``` r
# install from github.
devtools::install_github("zachcp/flattax")
```


## Example Usage

```
> library(flattax)
> flattax
                       class            family          genus kingdom            order
      1: Alphaproteobacteria Xanthobacteraceae   Azorhizobium Unknown      Rhizobiales
      2: Gammaproteobacteria       Erwiniaceae       Buchnera Unknown Enterobacterales
      3:      Actinobacteria Cellulomonadaceae   Cellulomonas Unknown    Micrococcales
      4:        Dictyoglomia   Dictyoglomaceae   Dictyoglomus Unknown   Dictyoglomales
      5:  Betaproteobacteria  Methylophilaceae  Methylophilus Unknown Nitrosomonadales
     ---                                                                              
1827688:      Actinobacteria Streptomycetaceae   Streptomyces Unknown Streptomycetales
1827689:      Flavobacteriia Flavobacteriaceae Flavobacterium Unknown Flavobacteriales
1827690:  Betaproteobacteria  Burkholderiaceae    Limnobacter Unknown  Burkholderiales
1827691:      Eurotiomycetes    Trichocomaceae    Talaromyces   Fungi       Eurotiales
1827692:      Agaricomycetes    Cortinariaceae    Cortinarius   Fungi       Agaricales
                 phylum                      species superkingdom   taxid
      1: Proteobacteria     Azorhizobium caulinodans     Bacteria       7
      2: Proteobacteria          Buchnera aphidicola     Bacteria       9
      3: Actinobacteria          Cellulomonas gilvus     Bacteria      11
      4:    Dictyoglomi    Dictyoglomus thermophilum     Bacteria      14
      5: Proteobacteria Methylophilus methylotrophus     Bacteria      17
     ---                                                                 
1827688: Actinobacteria    Streptomyces sp. S3(2020)     Bacteria 2732044
1827689:  Bacteroidetes Flavobacterium sp. IMCC34852     Bacteria 2732161
1827690: Proteobacteria   Limnobacter sp. SAORIC-580     Bacteria 2732163
1827691:     Ascomycota       Talaromyces fusiformis    Eukaryota 2732352
1827692:  Basidiomycota Cortinarius violaceovolvatus    Eukaryota 2732395```
