#File Size vs. System Memory
#size =  file.info("household_power_consumption.txt")/2^30 
#Proceed if size << RAM size

#Access entire data from the "household_power_consumption.txt" file where data is seprated by ";"
fullData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactor = FALSE)

# Extract only the relevant data
proj1Data <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

#Open the File Graphic device
png(filename = "plot1.png", 480,480)

#Plot histogram into the file
par(mar = c(4,4,2,2))
hist(as.numeric(proj1Data$Global_active_power), main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")

# Close the Graphic device
dev.off()