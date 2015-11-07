# load libraries

library(dplyr)

# set working directory

setwd("D:/Andrew/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption/ExData_Plotting1")

# load and extract data

big_file <- read.table("D:/Andrew/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
big_file$DateTime <- paste(big_file$Date, big_file$Time)
big_file$DateTime <- as.POSIXct(big_file$DateTime, format ="%d/%m/%Y %H:%M:%S")
proj_file <- filter(big_file, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))

# generate plot 3

sink()
png("plot3.png", width = 480, height = 480, units = "px")
plot(proj_file$DateTime, proj_file$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(proj_file$DateTime, proj_file$Sub_metering_1)
lines(proj_file$DateTime, proj_file$Sub_metering_2, col = "red")
lines(proj_file$DateTime, proj_file$Sub_metering_3, col = "blue")
legend("topright", names(proj_file[,c(7,8,9)]), lty=1, col = c("black", "red", "blue"))
dev.off()
