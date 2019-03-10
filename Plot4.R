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

# draw Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(electric2, {
        plot(Global_active_power ~ DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage ~ DateTime, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1 ~ DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ DateTime,col='Red')
        lines(Sub_metering_3 ~ DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
