## Reads Data
CompleteData <- read.csv(file = "household_power_consumption.txt", header=T, sep =';', na.strings="?")
CompleteData$Date <- as.Date(CompleteData$Date, format="%d/%m/%Y")

## Subsets Data
Data <- subset(CompleteData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Datetime conversion
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()