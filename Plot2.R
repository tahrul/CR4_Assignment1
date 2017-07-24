#Assignment part2: showing global active power consumption in 2 specific days using base graphics

setwd("C:/coursera_project/cr4wk1/exdata%2Fdata%2Fhousehold_power_consumption")
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
power_2days <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#format dates with times using strptime
datetime <- strptime(paste(power_2days$Date, power_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
# calling the basic plot function
plot(datetime,as.numeric(as.character(power_2days$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()

#output Graph Analysis:
#It looks like there is spike in global active power consumption after fixed interval. 