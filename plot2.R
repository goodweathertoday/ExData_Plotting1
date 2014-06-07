data <- read.csv("household_power_consumption.txt", header = TRUE, nrows = 100000, sep = ";")
data2 <- data[data[,"Date"] == "1/2/2007" | data[,"Date"] == "2/2/2007",]
x <- paste(data2$Date, data2$Time)
datetimecols <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(datetimecols, as.numeric(as.character(data2$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

