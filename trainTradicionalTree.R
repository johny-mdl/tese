
## PARAMETERS OF THE EXECUTION
month <- 10
year <- 1998
type <- 1       ## 1 for importation and 2 for exportation

###################################

## SUBSET DO DATAFRAME CONFORME OS PARAMETROS DADOS

data <- readRDS("/Users/johny/Desktop/tese/r/dados/dados.rds")

tempData <- data[data$fluxo == type,]

tempData2 <- tempData[as.numeric(format(tempData$data, format = "%Y")) == year,]

train1 <- tempData2[as.numeric(format(tempData2$data, format = "%m")) == month-1,]

train2 <- tempData2[as.numeric(format(tempData2$data, format = "%m")) == month-2,]

train <- rbind(train1,train2)

#################################### TRAIN

train <- subset(train, select = -c(data))

c <- rpart.control(minsplit=10,cp=0,09)
tree <- rpart(y ~.,method="class",data=train,control=c)
prp(tree)

saveRDS(tree, file="/Users/johny/Desktop/tese/r/dados/traditionalTree.rds")
