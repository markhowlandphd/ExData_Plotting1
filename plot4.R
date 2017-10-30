## plot4.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02

setwd("~/Documents/GitHub/hhpower")
library(readr)

main.data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=F, comment.char="", quote='\"')


powerData <- main.data[main.data$Date %in% c("1/2/2007","2/2/2007"),]

par(mfrow = c(2,2))
plot(powerData$Global_active_power ~ powerData$DateTime, ylab = "Global Active Power", xlab = "", type = "l")
plot(powerData$Voltage ~ powerData$DateTime, ylab = "Voltage", xlab = "datetime", type = "l")
plot(powerData$Sub_metering_1 ~ powerData$DateTime, ylab = "Energy sub metering", xlab = "", type = "l")
lines(powerData$Sub_metering_2 ~ powerData$DateTime, col = 'Red')
lines(powerData$Sub_metering_3 ~ powerData$DateTime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(powerData$Global_reactive_power ~ powerData$DateTime, ylab = "Global_reactive_power", xlab = "datetime", type = "l")