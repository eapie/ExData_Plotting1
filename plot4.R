# Exploratory Data Analysis Assignment 1
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