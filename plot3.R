setwd("D:/01.work/02.workspace/ExData_Plotting1-master")


##Load dataset
data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the data
data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert the type of columns
data_2days$datetime <- strptime(paste(data_2days$Date, data_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data_2days$Sub_metering_1 <- as.numeric(data_2days$Sub_metering_1)
data_2days$Sub_metering_2 <- as.numeric(data_2days$Sub_metering_2)
data_2days$Sub_metering_3 <- as.numeric(data_2days$Sub_metering_3)

##Plot
plot(data_2days$datetime, data_2days$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(data_2days$datetime, data_2days$Sub_metering_2, col='Red')
lines(data_2days$datetime, data_2days$Sub_metering_3, col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Save the file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
