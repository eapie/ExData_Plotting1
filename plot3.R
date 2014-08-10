# Exploratory Data Analysis Assignment 1
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