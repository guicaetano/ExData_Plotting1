setwd("d://Users//caetgu//Dropbox//Coursera//4-Exploratory Data Analysis//Week 1//Project_1")
library(dplyr)
library(lubridate)

#read data

data <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, na.strings = "?")

#subseting data

data_s <- filter(data, Date == "1/2/2007"| Date == "2/2/2007")

#converting date and time columns

data_s$Date <- dmy(data_s$Date)
data_s$Time <- hms(data_s$Time)
data_s$fulldate <- data_s$Date+data_s$Time

#Setting plot_4

png("plot_4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(data_s$fulldate, data_s$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

plot(data_s$fulldate, data_s$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data_s$fulldate, data_s$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data_s$fulldate, data_s$Sub_metering_2, type = "l", col= "red")
lines(data_s$fulldate, data_s$Sub_metering_3, type = "l", col= "blue")
legend("topright", lty = , lwd = 2,bty = "o" , col = c("black", "red", "blue"), legend = c(names(data_s[7:9])))

plot(data_s$fulldate, data_s$Global_reactive_power, type = "l", xlab = "datetime", ylab = names(data_s[4]))

dev.off()