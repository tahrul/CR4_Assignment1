#Assignment part4: Showing four different graphs in one device

setwd("C:/coursera_project/cr4wk1/exdata%2Fdata%2Fhousehold_power_consumption")
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
power_2days <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

datetime <- strptime(paste(power_2days$Date, power_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
# initiating plot with 4 graphs
par(mfrow=c(2,2))

# building the 4 plots that form the graph
with(power_2days,{
  plot(datetime,as.numeric(as.character(power_2days$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(datetime,as.numeric(as.character(power_2days$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(datetime,power_2days$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(power_2days,lines(datetime,as.numeric(as.character(Sub_metering_1))))
  with(power_2days,lines(datetime,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(power_2days,lines(datetime,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(datetime,as.numeric(as.character(power_2days$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()

#output Graph Analysis:
#There is spike after fixed interval in global active power consumption for two days
#There is voltage up-down (cyclical) for two days
#The energy sub-metering is explained in plot3 assignment
#There is spike after certain interval in global reactive power consumption for two days. Almost stable





