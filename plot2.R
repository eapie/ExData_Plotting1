# Exploratory Data Analysis Assignment 1

# Plot 2 
# Global_active_power v Day of the week
file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )
df <- electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]

df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

plot(df$dateTime, df$Global_active_power, main="Plot 2", xlab="",ylab="Global Active Power (kilowatts) ", type = "l", width=480, height=480)
dev.copy(png,"Plot2.png")
dev.off()