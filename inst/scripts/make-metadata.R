# code that creates metadata.csv in inst/extdata
# columns = title, description, BiocVersion, Genome, SourceType, SourceURL, SourceVersion, Species, TaxonomyID, 
#   Coordinate_1_based, DataProvider, Maintainer, RDataClass, DispatchClass, RDataPath, tags, notes

# 107 data sets total, for practice package we are working with GSE41197

library(tidyverse)

num_datasets = 3
meta <- data.frame(
    Title = c('se', 'GSE59772', 'GSE10797'),
    Description = c(
        'Differentially Expressed Genes Regulating the Progression of Ductal Carcinoma In Situ to Invasive Breast Cancer',
        'Analysis of compartment-specific gene expression in breast cancer tumors',
        'Transcriptomes of breast epithelium and stroma in normal reduction mammoplasty and invasive breast cancer patients.',
        ),
    BiocVersion = rep('3.2',num_datasets),
    SourceType = rep('tsv.gz',num_datasets),
    SourceURL = c(
        'https://osf.io/pdc8h',
        'https://osf.io/ps2kb',
        ),
    SourceVersion = c(
        'April 22, 2025',
        'April 22, 2025'
        ),
    Species = rep('Homo Sapiens', num_datasets),
    TaxonomyID = rep(9606, num_datasets),
    DataProvider = rep('OSF', num_datasets),
    Maintainer = rep('Bioconductor Package Maintainer <maintainer@bioconductor.org>', num_datasets),
    RDataClass = rep('SummarizedExperiment', num_datasets),
)

write.csv(meta, file='inst/extdata/metadata.csv', row.names = FALSE)