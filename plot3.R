# The purpose of this script is to read data, process it, and draw plot 3:
# a multiline plot of sub metered power over time.

# read data frame from file
DataIn <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")

# choose the two relevant days
TwoDays <- DataIn[DataIn$Date == "1/2/2007" | DataIn$Date == "2/2/2007", ]

# create a new column containing both date and time (in POSIXlt class)
TwoDays$DateTime <- strptime(paste(TwoDays$Date, TwoDays$Time), format="%d/%m/%Y %H:%M:%S")

# convert the sub metering columns to numeric format
TwoDays$Sub_metering_1 <- as.numeric(TwoDays$Sub_metering_1)
TwoDays$Sub_metering_2 <- as.numeric(TwoDays$Sub_metering_2)
TwoDays$Sub_metering_3 <- as.numeric(TwoDays$Sub_metering_3)

# open the png device and make plot
png(file = "plot3.png")
plot(TwoDays$DateTime, TwoDays$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", main = "")
## plot(TwoDays$DateTime, TwoDays$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "")
lines(TwoDays$DateTime, TwoDays$Sub_metering_1, col="black")
lines(TwoDays$DateTime, TwoDays$Sub_metering_2, col="red")
lines(TwoDays$DateTime, TwoDays$Sub_metering_3, col="blue")


# place legends for each color
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the file device
dev.off()