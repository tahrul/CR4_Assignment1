#Assignment part3: Showing multiple line graphs to show sub-metering measurement

setwd("C:/coursera_project/cr4wk1/exdata%2Fdata%2Fhousehold_power_consumption")
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
power_2days <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

datetime <- strptime(paste(power_2days$Date, power_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(datetime, as.numeric(as.character(power_2days$Sub_metering_1)), type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, as.numeric(as.character(power_2days$Sub_metering_2)), type="l", col="red")
lines(datetime, as.numeric(as.character(power_2days$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

#output Graph Analysis:
#Sub_metering_1 : huge power consumption on thursday (It corresponds to dishwasher, an oven and a microwave)
#Sub_metering_2 : Power consumption is low and constant (It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.)
#Sub_metering_3 : power consumption is moderate and constant accross two days (It corresponds to an electric water-heater and an air-conditioner) 
