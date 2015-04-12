setwd("D:/01.work/02.workspace/ExData_Plotting1-master")

##Load dataset
data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the data
data_2days <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Convert the type of columns
data_2days$Global_active_power <- as.numeric(data_2days$Global_active_power)
data_2days$datetime <- strptime(paste(data_2days$Date, data_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Plot
plot(data_2days$datetime, data_2days$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

##Save the file
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
