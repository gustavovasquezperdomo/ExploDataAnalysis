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
# Graphic 4
# *****************************************************
par(mfrow=c(2, 2))
# Subplot a, up-left
plot(data$nuevaFecha,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Subplot b, up-Right
plot(data$nuevaFecha,data$Voltage,type="l", ylab="Voltage", xlab="datetime")

# Subplot c, down -left
plot(data$nuevaFecha,data$Sub_metering_1, type="l",col=1, xlab="", pch="1",ylab="Energy sub metering")
lines(data$nuevaFecha,data$Sub_metering_2, col=2)
lines(data$nuevaFecha,data$Sub_metering_3, col=3)

# Subplot d, Down -Right
plot(data$nuevaFecha,data$Global_reactive_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Copying to a file 
dev.copy(png, file='plot4.png', width = 480, height = 480)
dev.off() # CLosing device
