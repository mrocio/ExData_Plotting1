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

# Plot 2
Data_new$Global_active_power <- as.numeric(paste(Data_new$Global_active_power))
plot(Data_new$timetemp, Data_new$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()