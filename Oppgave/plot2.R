## Getting complete dataset
householdcomplete <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                              na.strings = "?", nrows = 2075259, check.names = F, 
                              stringsAsFactors = F, comment.char = "", quote = '\"')
householdcomplete$Date <- as.Date(householdcomplete$Date, format = "%d/%m/%Y")


## Subsetting the data
householdcomsub <- subset(householdcomplete, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(householdcom)

## Converting dates
datetime <- paste(as.Date(householdcomsub$Date), householdcomsub$Time)
householdcomsub$Datetime <- as.POSIXct(datetime)



## Generating Plot 2
plot(householdcomsub$Global_active_power ~ householdcomsub$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
