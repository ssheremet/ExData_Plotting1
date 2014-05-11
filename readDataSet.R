readDataSet <- function(directory, dateFrom, dateTo){
## 'directory' - location of the CSV file
## 'dateFrom' and 'dateTo' - boundary dates for data set reading
       
       dataFile <- read.csv(directory, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
       
       ##filter 
       readDataSet <- suppressWarnings(subset(dataFile, as.Date(as.character(dataFile$Date, "%d/%m/%Y"), "%d/%m/%Y") == as.Date(c(dateFrom, dateTo))))
}