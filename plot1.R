plot1 <- function(){
##function plot1 draw histogramm and copy to png file
       
       ##include function for read data from file
       source("readDataSet.R")
       
       ##read data from file
       data <- readDataSet("household_power_consumption.txt", "2007-02-01", "2007-02-02")
       
       ##set global graph parameters
       par(mfrow=c(1,1))
       par(mar=c(4,4,1,1)+0.1)
       par(bg = "transparent")
       
       ##draw histogram
       hist(data$Global_active_power, xaxt='n', col = "red", cex.lab=0.8, cex.axis=0.7, cex.main=0.8, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
       
       ##set x-axis labels
       axis(side=1, at=seq(0,6,2), labels=seq(0,6,2), cex.axis=0.7)
       
       ##check directory and create if not exists
       if (!file.exists("figure")){dir.create("figure")}
       
       ##copy histogram to png-file
       dev.copy(png, file = ".\\figure\\plot1.png")
       dev.off()
       
}