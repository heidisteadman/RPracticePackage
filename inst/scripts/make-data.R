library(tidyverse)
library(stringr)
library(Biobase)
library(SummarizedExperiment)
library(S4Vectors)

# download expression data
downloadOSFFile = function(identifier, out_file_path) {
    tmp_file_path = str_c(tempdir(), "/", identifier, ".tsv.gz")
    
    if (!file.exists(tmp_file_path)) {
        download.file(paste0("https://osf.io/download/", identifier), tmp_file_path, mode='wb')
    }
    
    return(read_tsv(tmp_file_path))
}


#filter out repeat rows
filterRepeatRows = function(expression_matrix) {
    expression_matrix = expression_matrix %>%
        filter(!str_starts(Chromosome, 'H'))
    
    return(expression_matrix)
}

# get metadata
getMetadata = function(identifier) {
    sample_metadata = downloadOSFFile(identifier) %>%
        column_to_rownames('Sample_ID')
    
    return(sample_metadata)
}

# make feature data
makeFeatureData = function(expression_matrix) {
    feature_data = select(expression_matrix, Dataset_ID, Entrez_Gene_ID, 
                          HGNC_Symbol, Ensembl_Gene_ID, Chromosome, Gene_Biotype) %>%
        distinct(Ensembl_Gene_ID, .keep_all=TRUE) %>%
        column_to_rownames('Ensembl_Gene_ID')
    
    return(feature_data)
}


# creating expression data matrix
makeDataMatrix = function(dataset, start_col, end_col) {
    expressions = select(dataset, Ensembl_Gene_ID, start_col:end_col)
    expression_matrix = expressions %>%
        column_to_rownames('Ensembl_Gene_ID') %>%
        as.matrix()
    
    return(expression_matrix)
}

#build SummarizedExperiment
makeSummarizedExperiment = function(expressions, features, meta) {
    se = SummarizedExperiment(
        assays = list(counts=expressions),
        rowData = features,
        colData = meta
    )
    
    return(se)
}

# make file for roxygen2
makeRScript = function(dataset_name) {
    file_name = paste0('R/',dataset_name,'_info.R')
    doc = glue::glue(
        '##\' @format A SummarizedExperiment object with:
        ##\' \\describe{{
        ##\'   \\item{{assays}}{{matrix of counts}}
        ##\'   \\item{{rowData}}{{feature data}}
        ##\'   \\item{{colData}}{{sample metadata}}
        ##\' }}
        ##\' @source Generated internally for RPracticePackage
        "{dataset_name}"'
    )
    writeLines(doc, file_name)
}

# constructing SummarizedExperiment for GSE41197
GSE41197_expression_data = downloadOSFFile('pdc8h') %>%
    filterRepeatRows()
GSE41197_expression_matrix = makeDataMatrix(GSE41197_expression_data, 'GSM1010328', 'GSM1010345')
GSE41197_sample_metadata = getMetadata('u7x9k')
GSE41197_feature_data = makeFeatureData(GSE41197_expression_data)

GSE41197 = makeSummarizedExperiment(GSE41197_expression_matrix, GSE41197_feature_data, GSE41197_sample_metadata)

usethis::use_data(GSE41197, overwrite=TRUE)

# constructing SummarizedExperiment for GSE10797
GSE10797_expression_data = downloadOSFFile('ebycg') %>%
    filterRepeatRows()
GSE10797_expression_matrix = makeDataMatrix(GSE10797_expression_data, 'GSM272671', "GSM272735")
GSE10797_sample_metadata = getMetadata('vmhuj')
GSE10797_feature_data = makeFeatureData(GSE10797_expression_data)

GSE10797 = makeSummarizedExperiment(GSE10797_expression_matrix, GSE10797_feature_data, GSE10797_sample_metadata)

usethis::use_data(GSE10797, overwrite=TRUE)
makeRScript('GSE10797')


# constructing SummarizedExperiment for GSE59772
expression_data = downloadOSFFile("ps2kb") %>%
    filterRepeatRows()
expression_matrix = makeDataMatrix(expression_data, 'GSM1446286', 'GSM1446294')
sample_metadata = getMetadata('dc3qh')
feature_data = makeFeatureData(expression_data)


GSE59772 = makeSummarizedExperiment(expression_matrix, feature_data, sample_metadata)

usethis::use_data(GSE59772, overwrite=TRUE)