###### Course Project 1

#### Estimate dataset memory requirements

round(2075259 * 9 * 8/2^{20})

### reading data
rm(list = ls())
setwd("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/")
filepath<-"household_power_consumption.txt"
electric<-  read.csv2(filepath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# subset data
electric2<-subset(electric, electric$Date=="1/2/2007" | electric$Date =="2/2/2007" )

# covert data and time
electric2$Date <- as.Date(electric2$Date, format="%d/%m/%Y")
electric2$DateTime <- strptime(paste(electric2$Date, electric2$Time), "%Y-%m-%d %H:%M:%S")

electric2$DateTime <- as.POSIXct(electric2$DateTime)

# draw plot 3

png("plot3.png", width=480, height=480)
with(electric2, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(electric2,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(electric2,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(electric2,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
