## Course Project 1 Exploratory Data Analysis of Plot 1

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

Subdata <- PowerConsumptionData[PowerConsumptionData$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot 1
globalActivePower <- as.numeric(Subdata$Global_active_power)

##Create folder name Plot 1
if(!file.exists("Plot 1")) dir.create("Plot 1")

png("./Plot 1/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##closs device
dev.off()

