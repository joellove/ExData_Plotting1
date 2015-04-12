setwd("D:/01.work/02.workspace/ExData_Plotting1-master")


##Load dataset
data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the data
data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert the type of columns
data_2days$datetime <- strptime(paste(data_2days$Date, data_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data_2days$Global_active_power <- as.numeric(data_2days$Global_active_power)
data_2days$Global_reactive_power <- as.numeric(data_2days$Global_reactive_power)
data_2days$voltage <- as.numeric(data_2days$Voltage)
data_2days$Sub_metering_1 <- as.numeric(data_2days$Sub_metering_1)
data_2days$Sub_metering_2 <- as.numeric(data_2days$Sub_metering_2)
data_2days$Sub_metering_3 <- as.numeric(data_2days$Sub_metering_3)

##Plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data_2days$datetime, data_2days$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data_2days$datetime, data_2days$voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_2days$datetime, data_2days$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_2days$datetime, data_2days$Sub_metering_2, type="l", col="red")
lines(data_2days$datetime, data_2days$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(data_2days$datetime, data_2days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
