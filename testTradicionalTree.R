
## PARAMETERS OF THE EXECUTION
month <- 10
year <- 1998
type <- 1       ## 1 for importation and 2 for exportation

###################################

## SUBSET DO DATAFRAME CONFORME OS PARAMETROS DADOS

data <- readRDS("/Users/johny/Desktop/tese/r/dados/dados.rds")

tempData <- data[data$fluxo == type,]

tempData2 <- tempData[as.numeric(format(tempData$data, format = "%Y")) == year,]

test <- tempData2[as.numeric(format(tempData2$data, format = "%m")) == month,]

################################### TEST

tree <- readRDS("/Users/johny/Desktop/tese/r/dados/traditionalTree.rds")

test <- subset(test, select = -c(data))

pred <- predict(tree,test,type = c("class"))

mean(pred == test[ ,17])
sum(test[, 17] == 0)
sum(test[, 17] == 1)

sum(pred == 0)
sum(pred == 1)