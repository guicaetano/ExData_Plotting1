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

#Setting plot_2

plot(data_s$fulldate, data_s$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

#exporting to PNG

dev.copy(png, "plot_2.png")
dev.off()
