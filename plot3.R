#To Load data
setwd("~/Training/R/Power")
predata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
#Format dates and add Datetime
predata$Date <- as.Date(predata$Date, format="%d/%m/%Y")
predata$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#Remove all data except for wanted dates
myfunc <- function(x,y){predata[predata$Date >= x & predata$Date <= y,]}
date1<- as.Date("2007-02-01")
date2<- as.Date("2007-02-02")

#Create new Dataset with only wanted info
data<-myfunc(date1,date2)

#Do and export the plot3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()