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
# plot4.R
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
# Data file time format appears to be: H:M:S.
# Will have to specify the dates without leading zeroes
# Subset the dataframe. Select for "2007-02-01" and "2007-02-02"
df1 <- df[df$Date == "1/2/2007",]
df1 <- rbind(df1, df[df$Date == "2/2/2007",])

# Clear memory of 2075259 obs
rm(df)

# Convert the date column in ISO Date Time Format
# Combine date and time
xx <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
y <- as.numeric(df1$Global_active_power)/1000

# Plot C Specific Tweaks
# 1 black, 2 red, 3 blue
Sub_metering_1 <- as.numeric(df1$Sub_metering_1)
Sub_metering_2 <- as.numeric(df1$Sub_metering_2)
Sub_metering_3 <- as.numeric(df1$Sub_metering_3)
legend_text <- names(df1[7:9])
colors = c("black", "red", "blue")
n = nrow(df1)

# Create Plot 4
# Create png
png("plot4.png", width = 480, height = 480)

# Multiple Plots
# A  B
# C  D
par(mfrow = c(2,2), font.axis = 1, font.lab = 1, ps = 9, mar = c(4, 4, 3, 4) + 0.1, mgp = c(3, 1, 0))

# Plot A
plot(xx, y, type = "l", xlab = "", ylab = "Global Active Power (kW)")

#Plot B
plot(xx, df1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage (V)")

# Plot C
# plot(xx, y, type = "l", xlab = "", ylab = "Global Active Power C")
plot (xx[1:n], Sub_metering_1[1:n], type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(xx[1:n], Sub_metering_2[1:n], type = "l", col = "red")
lines(xx[1:n], Sub_metering_3[1:n], type = "l", col = "blue")
legend("topright", legend = legend_text, lwd = 3, lty = 1, col = colors)

# Plot D
plot(xx, df1$Global_reactive_power, type = "l", xlab = "datetime", ylab = names(df1[4]))

# Turn off device
dev.off()



# End script
##########################