## Reads Data
CompleteData <- read.csv(file = "household_power_consumption.txt", header=T, sep =';', na.strings="?")
CompleteData$Date <- as.Date(CompleteData$Date, format="%d/%m/%Y")

## Subsets Data
Data <- subset(CompleteData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Datetime conversion
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(Data$Global_active_power~Data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
