###### Course Project 1

#### Estimate dataset memory requirements

round(2075259 * 9 * 8/2^{20})

### reading data
rm(list = ls())
setwd("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/")
filepath<-"household_power_consumption.txt"
electric<-  read.csv2(filepath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
electric2<-subset(electric, electric$Date=="1/2/2007" | electric$Date =="2/2/2007" )

#### Plot 1

### create the histogram of plot 1 and save it to png file

png ("/Users/Appleseed/Data Science/Course materials/4_Exploratory Data Analysis/Course Project 1/plot1.png", height = 480, width = 480)
hist(as.numeric(as.character(electric2$Global_active_power)), col="red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power" )
dev.off()
