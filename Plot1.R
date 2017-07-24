#Assignment part1: generating histogram using base graphics to show global active power consumption

setwd("C:/coursera_project/cr4wk1/exdata%2Fdata%2Fhousehold_power_consumption")
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";") #'data.frame':	2075259 obs. of  9 variables:
power_2days <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007") # considering two days data only

png("plot1.png", width=480, height=480)
#Using base graphic (histogram)
hist(as.numeric(as.character(power_2days$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

#output Graph Analysis:
#histogram showed the frequency of score occurrences in a continuous data set for two days that has been devided into classes
#It looks like  right-skewed, so the mean global active power usage is typically GREATER THAN the median. Outlier (very vary high/low global active power usage)not found