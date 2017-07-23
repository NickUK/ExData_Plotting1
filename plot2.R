
# This assumes you have already downloaded and extracted the Electric Power consumption dataset
fileName <- "household_power_consumption.txt"

# Read the table
householdPowerConsumption <- read.table(fileName, header=TRUE, sep=";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

# Extract date for the dates 01/02/2017 to 02/02/2017
filteredData <- householdPowerConsumption[grepl("^[12]/2/2007$", householdPowerConsumption$Date), ]

# Add a datetime column (we need this for the graph)
filteredData$DateTime <- as.POSIXlt(paste(filteredData$Date, filteredData$Time), format = "%d/%m/%Y %H:%M:%S")

# Save our plot to this file
png("plot2.png")

# Plot the graph
plot(filteredData$DateTime, 
     filteredData$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Finish writing our png
dev.off()