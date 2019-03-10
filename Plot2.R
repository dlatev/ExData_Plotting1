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

# draw plot 2
png("plot2.png", width=480, height=480)
with(electric2, plot(DateTime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()