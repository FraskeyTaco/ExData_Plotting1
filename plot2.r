Pdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(Pdata)
Pdata <- Pdata[Pdata$Date %in% c("1/2/2007", "2/2/2007"),]
dates <- Pdata$Date
times <- Pdata$Time
x <- paste(dates, times)
datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(datetime, Pdata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(datetime, Pdata$Global_active_power)
dev.off()
