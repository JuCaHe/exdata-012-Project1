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

#Do and export the plot2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()