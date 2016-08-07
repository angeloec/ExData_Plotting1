## Course Project 1 Exploratory Data Analysis of plot 2.

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

##convert time and date format
Timedate <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubData$Global_active_power)

##Create folder name Plot 2
if(!file.exists("Plot 2")) dir.create("Plot 2")

png("./Plot 2/plot2.png", width=480, height=480)
plot(Timedate, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close device
dev.off()
