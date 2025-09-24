library(tidyverse)
library(stringr)
library(Biobase)
library(SummarizedExperiment)

# download expression data
downloadOSFFile = function(identifier, out_file_path) {
    tmp_file_path = str_c(tempdir(), "/", identifier, ".tsv.gz")
    
    if (!file.exists(tmp_file_path)) {
        download.file(paste0("https://osf.io/download/", identifier), tmp_file_path, mode='wb')
    }
    
    return(read_tsv(tmp_file_path))
}

expression_data = downloadOSFFile("ps2kb")

#filter out repeat rows
expression_data = expression_data %>%
    filter(!str_starts(Chromosome, 'H'))


# get metadata
sample_metadata = downloadOSFFile('dc3qh') %>%
    column_to_rownames('Sample_ID')

# make feature data
feature_data = select(expression_data, Dataset_ID, Entrez_Gene_ID, 
                      HGNC_Symbol, Ensembl_Gene_ID, Chromosome, Gene_Biotype) %>%
    distinct(Ensembl_Gene_ID, .keep_all=TRUE) %>%
    column_to_rownames('Ensembl_Gene_ID')

# creating expression data matrix
expressions = select(expression_data, Ensembl_Gene_ID, GSM1446286:GSM1446294)
expression_matrix = expressions %>%
    column_to_rownames('Ensembl_Gene_ID') %>%
    as.matrix()

# constructing SummarizedExperiment
GSE59772 = SummarizedExperiment(
    assays = list(counts=expression_matrix),
    rowData = feature_data,
    colData = sample_metadata
)

usethis::use_data(GSE59772, overwrite=TRUE)