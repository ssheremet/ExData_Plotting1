plot3 <- function(){
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
       plot(data$fullDate, data$Sub_metering_1, type = "l", cex.lab=0.8, cex.axis=0.7, xlab="", ylab="Energy sub metering", main="")
       
       ##add more lines
       lines(data$fullDate, data$Sub_metering_2, type = "l", col="red")
       lines(data$fullDate, data$Sub_metering_3, type = "l", col="blue")
       
       ##add ligend
       legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), y.intersp=0.8, cex=0.6)
       
       ##check directory and create if not exists
       if (!file.exists("figure")){dir.create("figure")}
       
       ##copy diagram to png-file
       dev.copy(png, file = ".\\figure\\plot3.png")
       dev.off()
       
}