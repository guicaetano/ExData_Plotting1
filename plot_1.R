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

#Setting plot_1

hist(data_s$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#exporting to PNG

dev.copy(png, "plot_1.png")
dev.off()