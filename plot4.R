# The purpose of this script is to read data, process it, and draw plot 4:
# 4 plots in two rows and two columns.

# read data frame from file
DataIn <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")

# choose the two relevant days
TwoDays <- DataIn[DataIn$Date == "1/2/2007" | DataIn$Date == "2/2/2007", ]

# create a new column containing both date and time (in POSIXlt class)
TwoDays$DateTime <- strptime(paste(TwoDays$Date, TwoDays$Time), format="%d/%m/%Y %H:%M:%S")

# convert columns to numeric format
TwoDays$Global_active_power <- as.numeric(TwoDays$Global_active_power)
TwoDays$Voltage <- as.numeric(TwoDays$Voltage)
TwoDays$Sub_metering_1 <- as.numeric(TwoDays$Sub_metering_1)
TwoDays$Sub_metering_2 <- as.numeric(TwoDays$Sub_metering_2)
TwoDays$Sub_metering_3 <- as.numeric(TwoDays$Sub_metering_3)
TwoDays$Global_reactive_power <- as.numeric(TwoDays$Global_reactive_power)

# open the png device and make 2x2 plot covered by row. First plot at top left, sevond at 
# top right, third at bottom left, and fourth at bottom right.
# Legend is included in third plot.
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(TwoDays$DateTime, TwoDays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", main = "")
plot(TwoDays$DateTime, TwoDays$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")
plot(TwoDays$DateTime, TwoDays$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", main = "")
lines(TwoDays$DateTime, TwoDays$Sub_metering_1, col="black")
lines(TwoDays$DateTime, TwoDays$Sub_metering_2, col="red")
lines(TwoDays$DateTime, TwoDays$Sub_metering_3, col="blue")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(TwoDays$DateTime, TwoDays$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")

# close the file device
dev.off()