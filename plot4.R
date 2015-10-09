# Loading data
Data <- read.csv("~/household_power_consumption.txt",sep=";", dec=".")

# Change Date and Time variables
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data$timetemp <- paste(Data$Date, Data$Time)
Data$timetemp <- strptime(Data$timetemp, format = "%Y-%m-%d %H:%M:%S")

# Select particular dates
Data_1 <- subset(Data, Date=="2007-02-01")
Data_2 <- subset(Data, Date=="2007-02-02")
Data_new <- rbind(Data_1,Data_2)

# Plot 4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(Data_new$timetemp, Data_new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(Data_new$timetemp, Data_new$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data_new$timetemp, Data_new$Sub_metering_2,col="red")
lines(Data_new$timetemp, Data_new$Sub_metering_3,col="blue")
legend("topright",cex=0.5, lty=1, col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

Data_new$Voltage <- as.numeric(paste(Data_new$Voltage))
plot(Data_new$timetemp, Data_new$Voltage, type="l", xlab="date:time", ylab="Voltage")

Data_new$Global_reactive_power <- as.numeric(paste(Data_new$Global_reactive_power))
plot(Data_new$timetemp, Data_new$Global_reactive_power, type="l", xlab="date:time", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()