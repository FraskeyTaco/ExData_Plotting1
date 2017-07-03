Pdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(Pdata)
Pdata <- Pdata[Pdata$Date %in% c("1/2/2007", "2/2/2007"),]
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Pdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
