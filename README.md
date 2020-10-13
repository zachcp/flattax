
# flattax

<!-- badges: start -->
<!-- badges: end -->

The goal of `flattax` is to provide a simplified view on NCBI's
taxonomic hierarchy. It provides the following datasets:

 - `flattax`:  A data.table of NCBI's `new_taxdump/rankedlineage.dmp` file.

## Installatation


``` r
# install from github.
devtools::install_github("zachcp/flattax")
```


## Example Usage

```
> library(flattax)
> flattax
          tax_id                     tax_name species genus family order class phylum kingdom
      1:       1                         root                                                
      2:  131567           cellular organisms                                                
      3:    2157                      Archaea                                                
      4: 1935183                 Asgard group                                                
      5: 1936272 Candidatus Heimdallarchaeota                                                
     ---                                                                                     
2281047:    2413               Transposon Tn7                                                
2281048:    2417               Transposon Tn9                                                
2281049:    2414             Transposon Tn903                                                
2281050:    2415             Transposon Tn916                                                
2281051:    2416             Transposon Tn917                                                
         superkingdom
      1:             
      2:             
      3:             
      4:      Archaea
      5:      Archaea
     ---             
2281047:             
2281048:             
2281049:             
2281050:             
2281051:   
```
