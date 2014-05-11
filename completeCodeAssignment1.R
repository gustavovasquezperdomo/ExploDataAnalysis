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
# Graphic 1
# *****************************************************

# Changing Global Active Power to numeric format
data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file='plot1.png', width = 480, height = 480)
dev.off() # CLosing device


# *****************************************************
# Graphic 2
# *****************************************************
plot(data$nuevaFecha,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Copying to a file 
dev.copy(png, file='plot2.png', width = 480, height = 480)
dev.off() # CLosing device


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
