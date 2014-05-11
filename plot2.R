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
# Graphic 2
# *****************************************************
plot(data$nuevaFecha,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Copying to a file 
dev.copy(png, file='plot2.png', width = 480, height = 480)
dev.off() # CLosing device
