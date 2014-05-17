readDataSet <- function(directory, dateFrom, dateTo){
## 'directory' - location of the CSV file
## 'dateFrom' and 'dateTo' - boundary dates for data set reading
       
       dataFile <- read.csv(directory, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
       
       ##filter 
       dataFile$Date <- as.Date(dataFile$Date, format='%d/%m/%Y')
       readDataSet <- dataFile[dataFile$Date %in% as.Date(c(dateFrom, dateTo)),]
       
}