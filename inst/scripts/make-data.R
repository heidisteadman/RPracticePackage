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

expression_data = downloadOSFFile("pdc8h")

#filtering out repeat rows
expression_data = expression_data %>%
    filter(!str_starts(Chromosome, "H"))

# download metadata
metadata = downloadOSFFile('u7x9k') %>%
    column_to_rownames('Sample_ID')

# creating feature data
feature_data = select(expression_data, Dataset_ID, Entrez_Gene_ID, 
                      HGNC_Symbol, Ensembl_Gene_ID, Chromosome, Gene_Biotype) %>%
    distinct(Ensembl_Gene_ID, .keep_all=TRUE) %>%
    column_to_rownames('Ensembl_Gene_ID')

# creating expression data matrix
expressions = select(expression_data, Ensembl_Gene_ID, GSM1010328:GSM1010345)
expression_matrix = expressions %>%
    column_to_rownames('Ensembl_Gene_ID') %>%
    as.matrix()

# constructing SummarizedExperiment
GSE41197 = SummarizedExperiment(
    assays = list(counts=expression_matrix),
    rowData = feature_data,
    colData = metadata
)

usethis::use_data(GSE41197, overwrite = TRUE)