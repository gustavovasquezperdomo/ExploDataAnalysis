# *****************************************************
# This is the reading data part
# *****************************************************

energyData2 <- read.csv("household_power_consumption.txt",sep=";")

# Now I have to subset the February first and second data

data <- energyData2[(energyData2$Date == "1/2/2007") | (energyData2$Date == "2/2/2007"),]
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$nuevaFecha <- paste(data$Date, data$Time)
data$nuevaFecha <- strptime(data$nuevaFecha, "%Y-%m-%d %H:%M:%S")

# *****************************************************
# Creating the graphics
# *****************************************************

# *****************************************************
# Graphic 3
# *****************************************************
plot(data$nuevaFecha,data$Sub_metering_1, type="l",col=1, xlab="", pch="1",ylab="Energy sub metering")
lines(data$nuevaFecha,data$Sub_metering_2, col=2)
lines(data$nuevaFecha,data$Sub_metering_3, col=3)
legend("topright",pch=1,col=c(1,2,3), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Copying to a file 
dev.copy(png, file='plot3.png', width = 480, height = 480)
dev.off() # CLosing device