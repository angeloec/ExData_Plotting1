## Course Project 1 Exploratory Data Analysis of Plot 3

##Set Working Directory

setwd("/Users/AngeloCondulle/Desktop/Coursera files/Exploratory Data Analysis")

getwd()
##[1] "/Users/AngeloCondulle/Desktop/Coursera files/Exploratory Data Analysis"

##URL to get DATA
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "Household_Power_Consumption.zip")
##unzip to create txt file.
unzip("Household_Power_Consumption.zip")

##Read data set into R

PowerConsumptionData <- read.table("Household_Power_Consumption.txt",header = TRUE, sep= ";",na.strings = "?", 
                                   colClasses = c("character","character","numeric","numeric","numeric",
                                                  "numeric","numeric","numeric","numeric"))

SubData <- PowerConsumptionData[PowerConsumptionData$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubData$Global_active_power)
subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)

##Create folder name Plot 3
if(!file.exists("Plot 3")) dir.create("Plot 3")

png("./Plot 3/plot3.png", width=480, height=480)

##plot figure
plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# close device
dev.off()

