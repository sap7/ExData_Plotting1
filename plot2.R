#File Size vs. System Memory
#size =  file.info("household_power_consumption.txt")/2^30 
#Proceed if size << RAM size

#Access entire data from the "household_power_consumption.txt" file where data is seprated by ";"
fullData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)

# Extract only the relevant data
proj1Data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Date and Time into a variable of desired type
dateTime = paste(proj1Data$Date, proj1Data$Time)
dateTime = strptime(dateTime,"%d/%m/%Y %H:%M:%S")

#Open the File Graphic device
png(filename = "plot2.png", 480,480)

#Plot the line graph into the file
par(mar = c(4,4,2,2))
plot(mdate,as.numeric(proj1Data$Global_active_power), main = "",xlab = "",ylab = "Global Active Power(kilowatts)",type = "l")

# Close the Graphic device
dev.off()