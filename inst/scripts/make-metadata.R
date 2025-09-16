# code that creates metadata.csv in inst/extdata
# columns = title, description, BiocVersion, Genome, SourceType, SourceURL, SourceVersion, Species, TaxonomyID, 
#   Coordinate_1_based, DataProvider, Maintainer, RDataClass, DispatchClass, RDataPath, tags, notes

# 107 data sets total, for practice package we are working with GSE41197

library(tidyverse)

meta <- data.frame(
    Title = c(paste0('Differentially Expressed Genes Regulating the Progression of Ductal Carcinoma In Situ to Invasive Breast Cancer')),
    Description = c(paste0('RNA from human samples were extracted, purified, amplified, and evaluated for gene expression using Affymetrix U95Av2 gene expression arrays.')),
    BiocVersion = c('3.2'),
    SourceType = c('tsv.gz'),
    SourceURL = c('https://osf.io/pdc8h'),
    SourceVersion = c('April 22, 2025'),
    Species = 'Homo Sapiens',
    TaxonomyID = 9606,
    DataProvider = 'OSF',
    Maintainer = 'Bioconductor Package Maintainer <maintainer@bioconductor.org>',
    RDataClass = 'SummarizedExperiment',
    RDataPath = "don't know yet"
)

write.csv(meta, file='inst/extdata/metadata.csv', row.names = FALSE)