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
# plot1.R
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

# Clear memory of 2075259 obs
rm(df)

# Convert the date column in ISO Date Time Format
# Combine date and time.
# Why 'xx'? Why not not?
xx <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
y <- as.numeric(df1$Global_active_power)/1000

# First Plot is a histogram
# export as plot1.png (480x480)
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(y, col = "red", main = "Global Active Power", xlim = range(y), xlab = "Global Active Power (Kilowatts)", breaks = "Sturges")

# Turn off device
dev.off()

# End script
##########################