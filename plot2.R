########################################################
# Class Project 1
# Ted Herring
# Coursera, Exploratory Data Analysis, Week 1
# by Johns Hopkins, Bloomberg School of Public Health
# 
# Data source: 
# University of California Machine Learning Archive: http://archive.ics.uci.edu/ml/
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
#######################
# plot2.R
#
# Begin script
#
# Set the path
# Set your working directory to the folder where you placed the zip file.
# setwd()
path <- "./rprog_data_specdata/household_power_consumption.txt"

# Get data
# Note: separator is ";"
df <- read.table(path, sep = ";", header = TRUE)

# Data file date format is in DD/MM/YYYY. Without leading zeroes on single numbers.
# Data file time format appears to be: h:m:s.
# Will have to specify the dates without leading zeroes
# Subset the dataframe selecting for 2007-02-01 and 2007-02-02
df1 <- df[df$Date == "1/2/2007",]
df1 <- rbind(df1, df[df$Date == "2/2/2007",])

# Convert the date column to ISO Date Format (unneccesary)
# df2 <- df1
# df2$Date <- strptime(df1$Date, "%d/ %m/ %Y")

# Combine date and time
# x <- paste(df2$Date, df2$Time)
xx <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
y <- as.numeric(df2$Global_active_power)/1000

# Create png image from plot
png("plot2.png", width = 480, height = 480)
plot(xx, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# plot(y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# plot(as.Date(x), y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

# End script
##########################