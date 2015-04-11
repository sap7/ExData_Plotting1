#Access entire data from the "household_power_consumption.txt" file where data is seprated by ";"
fullData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)

# Extract only the relevant data
proj1Data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Date and Time into a variable of desired type
dateTime = paste(proj1Data$Date, proj1Data$Time)
dateTime = strptime(dateTime,"%d/%m/%Y %H:%M:%S")

#Open the File Graphic device
png(filename = "plot3.png", 480,480)

#Plot the multiple line graphs into the file
par(mar = c(4,4,2,2))
plot(mdate, proj1Data$Sub_metering_1,main = "",xlab = "", ylab ="Energy sub metering",type = 'l',col = "black") 
lines(mdate,proj1Data$Sub_metering_2, xlab="", ylab="Energy sub metering", type = 'l',col="red")
lines(mdate,proj1Data$Sub_metering_3,xlab="",ylab="Energy sub metering",col="blue")
legend("topright",lwd=1,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Close the Graphic device
dev.off()