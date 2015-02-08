# The purpose of this script is to read data, process it, and draw plot 1: 
# a global active power histogram.

# read data frame from file
DataIn <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")

# choose the two relevant days
TwoDays <- DataIn[DataIn$Date == "1/2/2007" | DataIn$Date == "2/2/2007", ]

# convert the Global_active_power column to numeric format
TwoDays$Global_active_power <- as.numeric(TwoDays$Global_active_power)

# open the png device and plot a histogram
png(file = "plot1.png")
hist(TwoDays$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# close the file device
dev.off()