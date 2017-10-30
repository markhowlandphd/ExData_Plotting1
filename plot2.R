## plot2.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02

setwd("~/Documents/GitHub/hhpower")
library(readr)

household_power_consumption <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                        nrows=2075259, check.names=FALSE, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data1, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()