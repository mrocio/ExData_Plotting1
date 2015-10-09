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

# Plot 1
Data_new$Global_active_power <- as.numeric(paste(Data_new$Global_active_power))
par(mar=c(4,4,2,1))
hist(Data_new$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()