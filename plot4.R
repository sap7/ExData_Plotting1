#Access entire data from the "household_power_consumption.txt" file where data is seprated by ";"
fullData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)

# Extract only the relevant data
proj1Data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Date and Time into a variable of desired type
dateTime = paste(proj1Data$Date, proj1Data$Time)
dateTime = strptime(dateTime,"%d/%m/%Y %H:%M:%S")

#Open the File Graphic device
png(filename = "plot4.png", 480,480)

#Plot the multiple graphs into the file
par(mfrow = c(2,2), mar = c(4,4,2,2))
# Graph1
plot(dateTime, proj1Data$Global_active_power, type = 'l',xlab ="", ylab = "Global Active Power")

# Graph2 
plot(dateTime, proj1Data$Voltage, type = 'l',xlab ="datetime", ylab = "Voltage")

#Graph3
plot(mdate, proj1Data$Sub_metering_1,main = "",xlab = "", ylab ="Energy sub metering",type = 'l',col = "black") 
lines(mdate,proj1Data$Sub_metering_2, xlab="", ylab="Energy sub metering", type = 'l',col="red")
lines(mdate,proj1Data$Sub_metering_3,xlab="",ylab="Energy sub metering",col="blue")
legend("topright",bty= "n",lwd=1,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Graph 4
plot(dateTime, proj1Data$Global_reactive_power, type = 'l',xlab ="", ylab = "Global_reactive_power")


# Close the Graphic device
dev.off()