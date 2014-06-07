#reading graph
data <- read.csv("household_power_consumption.txt", header = TRUE, nrows = 100000, sep = ";")
data2 <- data[data[,"Date"] == "1/2/2007" | data[,"Date"] == "2/2/2007",]
x <- paste(data2$Date, data2$Time)
datetimecols <- strptime(x, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

#1st graph
plot(datetimecols, as.numeric(as.character(data2$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#2nd graph
plot(datetimecols, as.numeric(as.character(data2$Voltage)), type = "l", ylab = "Voltage", xlab = "datetime")

#3rd graph
plot(datetimecols, as.numeric(as.character(data2$Sub_metering_1)), xlab = "", ylab = "Energy sub metering", type="l") 
points(datetimecols, as.numeric(as.character(data2$Sub_metering_2)), col = "red", type = "l", lwd = 1)
points(datetimecols, as.numeric(as.character(data2$Sub_metering_3)), col = "blue", type = "l", lwd = 1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

#4th graph
plot(datetimecols, as.numeric(as.character(data2$Global_reactive_power)), type = "l", ylab = "Global_reactive_powr", xlab = "datetime")
