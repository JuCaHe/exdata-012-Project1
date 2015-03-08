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

#Do and export the plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
#Set the grid format
par(mfrow = c(2, 2))

# plot4.1 same as plot2
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
# plot4.2 similar to plot2 but different variables
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# plot4.3 same as plot3
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )
# plot 4.4 similar to plot2 but different variables
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()