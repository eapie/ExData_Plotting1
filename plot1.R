# Exploratory Data Analysis Assignment 1
# Plot1.R

# Read in the data.
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )

electricData<- electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]

electricData$formatDate <- as.Date(electricData$Date, "%d/%m/%Y")
electricData$formatTime <- strptime(electricData$Time, "%H:%M:$S")
electricData$Global_active_power <- as.numeric(as.character(electricData$Global_active_power))
hist(electricData$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)", xlim=c(0,6 ), yaxt='n',width = 480, height=480)
axis(2, axTicks(2), format(axTicks(2), scientific = F))


dev.copy(png,"Plot1.png")
dev.off()

