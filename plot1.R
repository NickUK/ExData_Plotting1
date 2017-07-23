
# This assumes you have already downloaded and extracted the Electric Power consumption dataset
fileName <- "household_power_consumption.txt"

# Read the table
householdPowerConsumption <- read.table(fileName, header=TRUE, sep=";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

# Extract date for the dates 01/02/2017 to 02/02/2017
filteredData <- householdPowerConsumption[grepl("^[12]/2/2007$", householdPowerConsumption$Date), ]

# Save our plot to this file
png("plot1.png")

# Create the histogram
hist(filteredData$Global_active_power,
        main="Global Active Power",
        col="red",
        xlab="Global Active Power (kilowatts)")

# Finish writing our png
dev.off()