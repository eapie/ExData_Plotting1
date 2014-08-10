# Exploratory Data Analysis Assignment 1
# Plot1.R

# Read in the data.
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )

electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]
electricData$formatDate <- as.Date(electricData$Date, "%d/%m/%Y")
electricData$formatTime <- strptime(electricData$Time, "%H:%M:$S")
electricData$Global_active_power <- as.numeric(electricData$Global_active_power)
hist(electricData$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)", xlim=c(0,6 ), yaxt='n',width = 480, height=480)
axis(2, axTicks(2), format(axTicks(2), scientific = F))

dev.copy(png,"Plot1.png")
dev.off()

# Plot 2 
# Global_active_power v Day of the week
file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )
df <- electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]

df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

plot(df$dateTime, df$Global_active_power, main="Plot 2", xlab="",ylab="Global Active Power (kilowatts) ", type = "l", width=480, height=480)
dev.copy(png,"Plot2.png")
dev.off()

#Plot 3
#Energy Sub Metering v day of week
file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )
df <- electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]

df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
plot(df$dateTime, df$Sub_metering_1, col="black", main="Plot 3", xlab="", ylab="Energy Sub Metering", type = "l", width=480, height=480)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1), col=c("black","red","blue"))
lines(df$dateTime, df$Sub_metering_2, col="red", main="Plot 3", type = "l")
lines(df$dateTime, df$Sub_metering_3, col="blue", main="Plot 3", type = "l")
dev.copy(png,"Plot3.png")
dev.off()

#Plot 4


file <- "C:/Users/Liz/Desktop/DataScienceSpecialisation/4_Exploratory_Data_Analysis/household_power_consumption.txt"
electricData <- read.table(file, header = TRUE, sep =";", stringsAsFactors = FALSE )
df <- electricData[(electricData$Date =="1/2/2007" | electricData$Date == "2/2/2007"),]

df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")


##  Open a new default device.
get( getOption( "device" ) )()

##  Set up plotting in two rows and two columns, plotting along rows first.
par( mfrow = c( 2, 2 ) )

##  The first plot is located in row 1, column 1:
plot(df$dateTime, df$Global_active_power, xlab="",ylab="Global Active Power", type = "l" , width=480, height=480)

##  The second plot is located in row 1, column 2:
plot(df$dateTime, df$Voltage, xlab="datetime",ylab="Voltage", type = "l", width=480, height=480)

##  The third plot is located in row 2, column 1:
df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
plot(df$dateTime, df$Sub_metering_1, col="black", xlab="", ylab="Energy Sub Metering", type = "l", width=480, height=480)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1), col=c("black","red","blue"))
lines(df$dateTime, df$Sub_metering_2, col="red", type = "l")
lines(df$dateTime, df$Sub_metering_3, col="blue", type = "l")

##  The fourth plot is located in row 2, column 2:
plot(df$dateTime, df$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power", type = "l", width=480, height=480)
dev.copy(png,"Plot4.png")
dev.off()