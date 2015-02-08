# The purpose of this script is to read data, process it, and draw plot 2:
# an active power over time line plot.

# read data frame from file
DataIn <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")

# choose the two relevant days
TwoDays <- DataIn[DataIn$Date == "1/2/2007" | DataIn$Date == "2/2/2007", ]

# create a new column containing both date and time (in POSIXlt class)
TwoDays$DateTime <- strptime(paste(TwoDays$Date, TwoDays$Time), format="%d/%m/%Y %H:%M:%S")

# convert the Global_active_power column to numeric format
TwoDays$Global_active_power <- as.numeric(TwoDays$Global_active_power)

# open the png device and make plot
png(file = "plot2.png")
plot(TwoDays$DateTime, TwoDays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

# close the file device
dev.off()