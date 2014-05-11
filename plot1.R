# This is the code to solve the first assignment in Exploratory DAta analysis
# Part of the DataScience Specialization

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
