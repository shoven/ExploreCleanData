## Load the data
data_Consump_Full <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_Consump_Full$Date <- as.Date(data_Consump_Full$Date, format="%d/%m/%Y") 

## Subset the data
data_subset <- subset(data_Consump_Full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_Consump_full)

datetime <- paste(as.Date(data_subset$Date), data$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot the graph

hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Save the file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()