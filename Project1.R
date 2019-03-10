###### Course Project 1

#### Estimate dataset memory requirements

round(2075259 * 9 * 8/2^{20})

### reading data

filepath<-"/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
initial <- read.table(filepath, nrow =100)
initial<-read.csv2(filepath, nrow=100)
electricPcons<-  read.csv2(filepath, na.strings="?")
transform(electricPcons, Date = as.Date(electricPcons$Date, format = "%d/%m/%Y"))
electric2<-subset(electricPcons, electricPcons$Date=="1/2/2007" | electricPcons$Date =="2/2/2007" )

#### Plot 1

### create the histogram of plot 1 and save it to png file

png ("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/plot1.png", height = 480, width = 480)
hist(as.numeric(as.character(electric2$Global_active_power)), col="red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power" )
dev.off()

#### Plot 2
rm(list = ls())
filepath<-"/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
electric<-  read.csv2(filepath, na.strings="?")
# subset data
electric2<-subset(electric, electric$Date=="1/2/2007" | electric$Date =="2/2/2007" )

# covert data and time
electric2$Date <- as.Date(electric2$Date, format="%d/%m/%Y")
electric2$DateTime <- strptime(paste(electric2$Date, electric2$Time), "%Y-%m-%d %H:%M:%S")

# draw plot 2
png("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/plot2.png", width=480, height=480)
with(electric2, plot(DateTime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()


##### Plot 3 
rm(list = ls())
setwd("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/")
filepath<-"household_power_consumption.txt"
electric<-  read.csv2(filepath, na.strings="?")

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

##### Plot 4 
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
