

path <- c("/Users/johny/Desktop/tese/dados/INTRASTAT")

filenames <- c(list.files(path, full.names = TRUE))
files <- do.call("rbind", lapply(filenames, read.csv, header = FALSE, na.strings="\\N"))

files[is.na(files)] <- 0
colnames(files) <- c("data","origem","fluxo","lote","decl","op","mes","adi","pais","nc"
                     ,"massa","fact","fact_massa","media_nc_val_quant","dp_nc_val_quant"
                     ,"distancia_nc_val_quant","nr_adicoes","y")

d <- as.Date(files$data)  ##transformar a coluna da data no formato de data

files$data <- d 

saveRDS(files, file="/Users/johny/Desktop/tese/r/dados/dados.rds")
