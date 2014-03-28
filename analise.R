library(rpart.plot)
library(lattice)

filenames <- c(list.files(path="/Users/johny/Desktop/tese/dados/INTRASTAT", full.names = TRUE))
files <- do.call("rbind", lapply(filenames, read.csv, header = FALSE, na.strings="\\N"))

files[is.na(files)] <- 0
colnames(files) <- c("data","origem","fluxo","lote","decl","op","mes","adi","pais","nc"
                     ,"massa","fact","fact_massa","media_nc_val_quant","dp_nc_val_quant"
                     ,"distancia_nc_val_quant","nr_adicoes","y")

summary(files)
nrow(files)
sum(files$y == 1)

#m <- files$mes
#f <- files$fact
#d <- data.frame(m=m,f=f)
#ggplot(d, aes(x=m, y=f)) + geom_bar(stat="identity")

#xyplot(nc ~ massa, data=files)

#densityplot(~ mes, data=files)

#apply(files, 2, function(c) {length(c[is.na(c)])})
#temp <- table(as.vector(files$origem))
#names(temp)[temp == max(temp)]