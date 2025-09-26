
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RPracticePackage

<!-- badges: start -->

[![GitHub
issues](https://img.shields.io/github/issues/heidisteadman/RPracticePackage)](https://github.com/heidisteadman/RPracticePackage/issues)
[![GitHub
pulls](https://img.shields.io/github/issues-pr/heidisteadman/RPracticePackage)](https://github.com/heidisteadman/RPracticePackage/pulls)
<!-- badges: end -->

The goal of `RPracticePackage` is to help the developers gain practice
creating Bioconductor packages with experimental data.

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `RPracticePackage` from
[Bioconductor](http://bioconductor.org/) using the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("RPracticePackage")
```

And the development version from
[GitHub](https://github.com/heidisteadman/RPracticePackage) with:

``` r
BiocManager::install("heidisteadman/RPracticePackage")
```

## Example

Load the data into the SummarizedExperiment object:

``` r
library("RPracticePackage")
library(SummarizedExperiment)
#> Loading required package: MatrixGenerics
#> Warning: package 'MatrixGenerics' was built under R version 4.4.2
#> Loading required package: matrixStats
#> Warning: package 'matrixStats' was built under R version 4.4.3
#> 
#> Attaching package: 'MatrixGenerics'
#> The following objects are masked from 'package:matrixStats':
#> 
#>     colAlls, colAnyNAs, colAnys, colAvgsPerRowSet, colCollapse,
#>     colCounts, colCummaxs, colCummins, colCumprods, colCumsums,
#>     colDiffs, colIQRDiffs, colIQRs, colLogSumExps, colMadDiffs,
#>     colMads, colMaxs, colMeans2, colMedians, colMins, colOrderStats,
#>     colProds, colQuantiles, colRanges, colRanks, colSdDiffs, colSds,
#>     colSums2, colTabulates, colVarDiffs, colVars, colWeightedMads,
#>     colWeightedMeans, colWeightedMedians, colWeightedSds,
#>     colWeightedVars, rowAlls, rowAnyNAs, rowAnys, rowAvgsPerColSet,
#>     rowCollapse, rowCounts, rowCummaxs, rowCummins, rowCumprods,
#>     rowCumsums, rowDiffs, rowIQRDiffs, rowIQRs, rowLogSumExps,
#>     rowMadDiffs, rowMads, rowMaxs, rowMeans2, rowMedians, rowMins,
#>     rowOrderStats, rowProds, rowQuantiles, rowRanges, rowRanks,
#>     rowSdDiffs, rowSds, rowSums2, rowTabulates, rowVarDiffs, rowVars,
#>     rowWeightedMads, rowWeightedMeans, rowWeightedMedians,
#>     rowWeightedSds, rowWeightedVars
#> Loading required package: GenomicRanges
#> Loading required package: stats4
#> Loading required package: BiocGenerics
#> 
#> Attaching package: 'BiocGenerics'
#> The following objects are masked from 'package:stats':
#> 
#>     IQR, mad, sd, var, xtabs
#> The following objects are masked from 'package:base':
#> 
#>     anyDuplicated, aperm, append, as.data.frame, basename, cbind,
#>     colnames, dirname, do.call, duplicated, eval, evalq, Filter, Find,
#>     get, grep, grepl, intersect, is.unsorted, lapply, Map, mapply,
#>     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
#>     Position, rank, rbind, Reduce, rownames, sapply, saveRDS, setdiff,
#>     table, tapply, union, unique, unsplit, which.max, which.min
#> Loading required package: S4Vectors
#> 
#> Attaching package: 'S4Vectors'
#> The following object is masked from 'package:utils':
#> 
#>     findMatches
#> The following objects are masked from 'package:base':
#> 
#>     expand.grid, I, unname
#> Loading required package: IRanges
#> Warning: package 'IRanges' was built under R version 4.4.2
#> 
#> Attaching package: 'IRanges'
#> The following object is masked from 'package:grDevices':
#> 
#>     windows
#> Loading required package: GenomeInfoDb
#> Warning: package 'GenomeInfoDb' was built under R version 4.4.2
#> Loading required package: Biobase
#> Welcome to Bioconductor
#> 
#>     Vignettes contain introductory material; view with
#>     'browseVignettes()'. To cite Bioconductor, see
#>     'citation("Biobase")', and for packages 'citation("pkgname")'.
#> 
#> Attaching package: 'Biobase'
#> The following object is masked from 'package:MatrixGenerics':
#> 
#>     rowMedians
#> The following objects are masked from 'package:matrixStats':
#> 
#>     anyMissing, rowMedians
data('se')
expression_data = assay(se)
sample_metadata = colData(se)
feature_data = rowData(se)
```

Example of a summary of the expression data:

``` r
library("RPracticePackage")
library(SummarizedExperiment)
data('GSE41197')
expressions = assay(GSE41197)
summary(expressions)
#>    GSM1010328         GSM1010329         GSM1010330        GSM1010331      
#>  Min.   :-0.58807   Min.   :-0.67193   Min.   :-0.6275   Min.   :-0.67947  
#>  1st Qu.:-0.02803   1st Qu.:-0.02844   1st Qu.:-0.0254   1st Qu.:-0.02467  
#>  Median : 0.17679   Median : 0.17441   Median : 0.1930   Median : 0.20735  
#>  Mean   : 0.35001   Mean   : 0.31648   Mean   : 0.3605   Mean   : 0.38279  
#>  3rd Qu.: 0.51888   3rd Qu.: 0.49118   3rd Qu.: 0.5426   3rd Qu.: 0.58618  
#>  Max.   : 5.89482   Max.   : 5.60029   Max.   : 5.6386   Max.   : 5.22921  
#>    GSM1010332         GSM1010333         GSM1010335         GSM1010336      
#>  Min.   :-0.65721   Min.   :-0.68931   Min.   :-0.80612   Min.   :-0.76911  
#>  1st Qu.:-0.02692   1st Qu.:-0.02032   1st Qu.:-0.01329   1st Qu.:-0.01469  
#>  Median : 0.19357   Median : 0.19358   Median : 0.18998   Median : 0.19854  
#>  Mean   : 0.38505   Mean   : 0.35555   Mean   : 0.34024   Mean   : 0.34292  
#>  3rd Qu.: 0.57769   3rd Qu.: 0.53875   3rd Qu.: 0.50096   3rd Qu.: 0.54229  
#>  Max.   : 5.53771   Max.   : 5.48663   Max.   : 5.15454   Max.   : 5.49399  
#>    GSM1010337         GSM1010338         GSM1010339        GSM1010340      
#>  Min.   :-0.62034   Min.   :-0.73287   Min.   :-0.7865   Min.   :-0.68037  
#>  1st Qu.:-0.02902   1st Qu.:-0.01651   1st Qu.:-0.0320   1st Qu.:-0.01358  
#>  Median : 0.16572   Median : 0.19661   Median : 0.1650   Median : 0.23907  
#>  Mean   : 0.34074   Mean   : 0.35117   Mean   : 0.3178   Mean   : 0.42135  
#>  3rd Qu.: 0.49122   3rd Qu.: 0.53256   3rd Qu.: 0.4736   3rd Qu.: 0.65615  
#>  Max.   : 7.47123   Max.   : 5.35866   Max.   : 6.0962   Max.   : 5.20654  
#>    GSM1010341         GSM1010342          GSM1010344          GSM1010345      
#>  Min.   :-0.71538   Min.   :-0.727634   Min.   :-0.745922   Min.   :-0.73491  
#>  1st Qu.:-0.02971   1st Qu.:-0.004102   1st Qu.:-0.009581   1st Qu.:-0.01498  
#>  Median : 0.19966   Median : 0.228113   Median : 0.199796   Median : 0.22331  
#>  Mean   : 0.39275   Mean   : 0.408147   Mean   : 0.361049   Mean   : 0.38596  
#>  3rd Qu.: 0.59964   3rd Qu.: 0.624571   3rd Qu.: 0.527265   3rd Qu.: 0.62029  
#>  Max.   : 4.58676   Max.   : 4.715135   Max.   : 5.045097   Max.   : 4.98164
```

Example of the first 10 gene expression levels of the first sample read
into a plot:

``` r
library("RPracticePackage")
library(tidyverse)
#> Warning: package 'ggplot2' was built under R version 4.4.3
#> Warning: package 'tibble' was built under R version 4.4.3
#> Warning: package 'purrr' was built under R version 4.4.3
#> Warning: package 'lubridate' was built under R version 4.4.3
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.2
#> ✔ ggplot2   3.5.2     ✔ tibble    3.3.0
#> ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
#> ✔ purrr     1.1.0     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ lubridate::%within%() masks IRanges::%within%()
#> ✖ dplyr::collapse()     masks IRanges::collapse()
#> ✖ dplyr::combine()      masks Biobase::combine(), BiocGenerics::combine()
#> ✖ dplyr::count()        masks matrixStats::count()
#> ✖ dplyr::desc()         masks IRanges::desc()
#> ✖ tidyr::expand()       masks S4Vectors::expand()
#> ✖ dplyr::filter()       masks stats::filter()
#> ✖ dplyr::first()        masks S4Vectors::first()
#> ✖ dplyr::lag()          masks stats::lag()
#> ✖ ggplot2::Position()   masks BiocGenerics::Position(), base::Position()
#> ✖ purrr::reduce()       masks GenomicRanges::reduce(), IRanges::reduce()
#> ✖ dplyr::rename()       masks S4Vectors::rename()
#> ✖ lubridate::second()   masks S4Vectors::second()
#> ✖ lubridate::second<-() masks S4Vectors::second<-()
#> ✖ dplyr::slice()        masks IRanges::slice()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(SummarizedExperiment)

data('GSE41197')
expressions = assay(GSE41197)

exp_tib = as_tibble(expressions, rownames='Ensembl_Gene_ID')[1:10,] %>%
    ggplot(aes(x=Ensembl_Gene_ID, y=GSM1010328)) +
    geom_col() +
    labs(x='Ensembl Gene ID',y='Sample ID GSM1010328') +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

exp_tib
```

<img src="man/figures/README-plot_example-1.png" width="100%" />

Example of using different data sets together to compare expression
levels of one gene:

``` r
library("RPracticePackage")
library(tidyverse)
library(SummarizedExperiment)

data('GSE10797')
data('GSE41197')
data('GSE59772')

GSE10197 = assay(GSE10797)
GSE41197 = assay(GSE41197)
GSE59772 = assay(GSE59772)

GSE10197_gene = GSE10197 %>%
    as_tibble(rownames='Ensembl_Gene_ID') %>%
    filter(Ensembl_Gene_ID == "ENSG00000171428")
GSE41197_gene = GSE41197 %>%
    as_tibble(rownames='Ensembl_Gene_ID') %>%
    filter(Ensembl_Gene_ID == "ENSG00000171428") 
GSE59772_gene = GSE59772 %>%
    as_tibble(rownames='Ensembl_Gene_ID') %>%
    filter(Ensembl_Gene_ID == "ENSG00000171428")

combined_samples = full_join(GSE10197_gene, GSE41197_gene)
#> Joining with `by = join_by(Ensembl_Gene_ID)`
combined_samples = full_join(combined_samples, GSE59772_gene) %>%
    pivot_longer(cols=-Ensembl_Gene_ID,names_to='Sample_ID',values_to='Expression_Level') %>%
    ggplot(aes(x=Sample_ID,y=Expression_Level)) +
    geom_col() +
    #theme_bw() +
    labs(x='Sample ID',y='Expression level of ENSG00000171428') +
    coord_flip() +
    scale_fill_brewer(palette = "Set3") +
    theme_bw() +
    theme(axis.text.y = element_text(size = 6))
#> Joining with `by = join_by(Ensembl_Gene_ID)`
combined_samples
```

<img src="man/figures/README-plot example 2-1.png" width="100%" />

## Citation

Below is the citation output from using `citation('RPracticePackage')`
in R. Please run this yourself to check for any updates on how to cite
**RPracticePackage**.

``` r
print(citation('RPracticePackage'), bibtex = TRUE)
#> To cite package 'RPracticePackage' in publications use:
#> 
#>   heidisteadman (2025). _RPracticePackage_.
#>   doi:10.18129/B9.bioc.RPracticePackage
#>   <https://doi.org/10.18129/B9.bioc.RPracticePackage>,
#>   https://github.com/heidisteadman/RPracticePackage/RPracticePackage -
#>   R package version 0.99.0,
#>   <http://www.bioconductor.org/packages/RPracticePackage>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {RPracticePackage},
#>     author = {{heidisteadman}},
#>     year = {2025},
#>     url = {http://www.bioconductor.org/packages/RPracticePackage},
#>     note = {https://github.com/heidisteadman/RPracticePackage/RPracticePackage - R package version 0.99.0},
#>     doi = {10.18129/B9.bioc.RPracticePackage},
#>   }
#> 
#>   heidisteadman (2025). "RPracticePackage." _bioRxiv_. doi:10.1101/TODO
#>   <https://doi.org/10.1101/TODO>,
#>   <https://www.biorxiv.org/content/10.1101/TODO>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {RPracticePackage},
#>     author = {{heidisteadman}},
#>     year = {2025},
#>     journal = {bioRxiv},
#>     doi = {10.1101/TODO},
#>     url = {https://www.biorxiv.org/content/10.1101/TODO},
#>   }
```

Please note that the `RPracticePackage` was only made possible thanks to
many other R and bioinformatics software authors, which are cited either
in the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `RPracticePackage` project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.

## Development tools

- Continuous code testing is possible thanks to [GitHub
  actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
  through *[usethis](https://CRAN.R-project.org/package=usethis)*,
  *[remotes](https://CRAN.R-project.org/package=remotes)*, and
  *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)* customized
  to use [Bioconductor’s docker
  containers](https://www.bioconductor.org/help/docker/) and
  *[BiocCheck](https://bioconductor.org/packages/3.20/BiocCheck)*.
- Code coverage assessment is possible thanks to
  [codecov](https://codecov.io/gh) and
  *[covr](https://CRAN.R-project.org/package=covr)*.
- The [documentation
  website](http://heidisteadman.github.io/RPracticePackage) is
  automatically updated thanks to
  *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
- The code is styled automatically thanks to
  *[styler](https://CRAN.R-project.org/package=styler)*.
- The documentation is formatted thanks to
  *[devtools](https://CRAN.R-project.org/package=devtools)* and
  *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.20/biocthis)*.

## Code of Conduct

Please note that the RPracticePackage project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.
