
# This assumes you have already downloaded and extracted the Electric Power consumption dataset
fileName <- "household_power_consumption.txt"

# Read the table
householdPowerConsumption <- read.table(fileName, header=TRUE, sep=";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

# Extract date for the dates 01/02/2017 to 02/02/2017
filteredData <- householdPowerConsumption[grepl("^[12]/2/2007$", householdPowerConsumption$Date), ]

# Add a datetime column (we need this for the graph)
filteredData$DateTime <- as.POSIXlt(paste(filteredData$Date, filteredData$Time), format = "%d/%m/%Y %H:%M:%S")

# Save our plot to this file
png("plot4.png")

# Plot setup
par(mfrow=c(2,2))

# Plot the first graph
plot(filteredData$DateTime, 
     filteredData$Global_active_power, 
     type="l", 
     ylab="Global Active Power", 
     xlab="")

# Plot the second graph
plot(filteredData$DateTime, 
     filteredData$Voltage, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime")

# Plot the third graph
plot(filteredData$DateTime, 
     filteredData$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering", 
     xlab="")

# Add additional data
lines(filteredData$DateTime, filteredData$Sub_metering_2, col="red")
lines(filteredData$DateTime, filteredData$Sub_metering_3, col="blue")

# Add the legend
legend("topright", 
       col=c("Black", "Red", "Blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1,
       cex=0.8,
       bty="n")

# Plot the final graph
plot(filteredData$DateTime, 
     filteredData$Global_reactive_power, 
     type="l", 
     ylab="Global Reactive Power", 
     xlab="datetime")

# Finish writing our png
dev.off()