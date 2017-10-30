## plot1.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02

setwd("~/Documents/GitHub/hhpower")
library(readr)

household_power_consumption <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                                        nrows=2075259, check.names=FALSE, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)
## Output diagram
dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()
