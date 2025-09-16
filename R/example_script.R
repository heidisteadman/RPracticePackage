library(tidyverse)

# download expression data
downloadOSFFile = function(identifier, out_file_path) {
    tmp_file_path = str_c(tempdir(), "/", identifier, ".tsv.gz")
    
    if (!file.exists(tmp_file_path)) {
        download.file("https://files.osf.io/v1/resources/eky3p/providers/osfstorage/650351e3f3dcd17089ddd400", tmp_file_path)
    }
    
    return(read_tsv(tmp_file_path))
}

expression_data = downloadOSFFile("pdc8h")

expression_data