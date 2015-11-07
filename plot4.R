# load libraries

library(dplyr)

# set working directory

setwd("D:/Andrew/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption")

# load and extract data

big_file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
big_file$DateTime <- paste(big_file$Date, big_file$Time)
big_file$DateTime <- as.POSIXct(big_file$DateTime, format ="%d/%m/%Y %H:%M:%S")
proj_file <- filter(big_file, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))


# generate plot 4

sink()
png("plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

# topleft

plot(proj_file$DateTime, proj_file$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(proj_file$DateTime, proj_file$Global_active_power)

# bottomleft

plot(proj_file$DateTime, proj_file$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(proj_file$DateTime, proj_file$Sub_metering_1)
lines(proj_file$DateTime, proj_file$Sub_metering_2, col = "red")
lines(proj_file$DateTime, proj_file$Sub_metering_3, col = "blue")
legend("topright", names(proj_file[,c(7,8,9)]), lty=1, col = c("black", "red", "blue"))

# topright

plot(proj_file$DateTime, proj_file$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(proj_file$DateTime, proj_file$Voltage)


# bottomright

plot(proj_file$DateTime, proj_file$Global_reactive_power, xlab = "datetime", ylab = names(proj_file[4]), type = "n")
lines(proj_file$DateTime, proj_file$Global_reactive_power)

dev.off()

