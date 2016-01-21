## Setting working dir
setwd("C:\Users\Birthe\Desktop\DataS Data\Modul 4 Exploratory\Assigment 1 week 1")

##Getting the file
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"

if (!file.exists(householdFile)) {dir.create("data")}
download.file(downloadURL, downloadFile)
unzip(downloadFile, overwrite = T)

## Creating dataset for a 2 day period
household <- file("household_power_consumption.txt")
householdcom <- read.table(text = grep("^[1,2]/2/2007", readLines(household), value = TRUE), col.names = c("Date", "Time", 
"Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
"Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)  

## View summary of dataset  
head(householdcom)
summary(householdcom)

## Generating Plot 1
hist(householdcom$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
