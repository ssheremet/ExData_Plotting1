plot2 <- function(){
       ##function plot1 line diagram and copy to png file
       
       ##include function for read data from file
       source("readDataSet.R")
       
       ##read data from file
       data <- readDataSet("household_power_consumption.txt", "2007-02-01", "2007-02-02")
       
       ##set fullDate column
       data$fullDate <- strptime(paste(as.Date(as.character(data$Date, "%d/%m/%Y"), "%d/%m/%Y"), data$Time), "%Y-%m-%d %H:%M:%S")
       
       ##set global graph parameters
       par(mfrow=c(1,1))
       par(mar=c(4,4,1,1)+0.1)
       par(bg = "transparent")
       
       ##draw diargam
       plot(data$fullDate, data$Global_active_power, type = "l", yaxt = "n", cex.lab=0.8, cex.axis=0.7, xlab="", ylab="Global Active Power (kilowatts)", main="")
       
       ##set y-axis labels
       axis(side=2, at=seq(0,6,2), labels=seq(0,6,2), cex.axis=0.7)
       
       ##check directory and create if not exists
       if (!file.exists("figure")){dir.create("figure")}
       
       ##copy diagram to png-file
       dev.copy(png, file = ".\\figure\\plot2.png")
       dev.off()

       
}