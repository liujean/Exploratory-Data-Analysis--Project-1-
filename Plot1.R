# read the downloaded household power consumption file

householdFile <- read.table ("~/household_power_consumption.txt", sep = ";", header= TRUE)

## set time variable ##
finalData <- householdFile[householdFile$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##


## Generating Plot 1
finalData$Global_active_power <- as.numeric(finalData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()