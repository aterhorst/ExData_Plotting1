# load libraries

library(dplyr)

# set working directory

setwd("D:/Andrew/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption/ExData_Plotting1")

# load and extract data

big_file <- read.table("D:/Andrew/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
big_file$DateTime <- paste(big_file$Date, big_file$Time)
big_file$DateTime <- as.POSIXct(big_file$DateTime, format ="%d/%m/%Y %H:%M:%S")
proj_file <- filter(big_file, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))

# generate plot 1

sink()
png("plot1.png", width = 480, height = 480, units = "px")
hist(proj_file$Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
