Pdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(Pdata)
Pdata <- Pdata[Pdata$Date %in% c("1/2/2007", "2/2/2007"),]
dates <- Pdata$Date
times <- Pdata$Time
x <- paste(dates, times)
datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2), mar = c(4,4,2,1))
plot(datetime, Pdata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(datetime, Pdata$Global_active_power)
plot(datetime, Pdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(datetime, Pdata$Sub_metering_1)
lines(datetime, Pdata$Sub_metering_2, col = "red")
lines(datetime, Pdata$Sub_metering_3, col = "blue")
legend ("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(1,1,1), bty = "n")
plot(datetime, Pdata$Voltage, type = "n", ylab = "Voltage")
lines(datetime, Pdata$Voltage)
plot(datetime, Pdata$Global_reactive_power, type = "n", ylab = "Global_reactive_power")
lines(datetime, Pdata$Global_reactive_power)
dev.off()
