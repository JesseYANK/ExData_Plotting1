#Read the data
library(data.table)
File <- "household_power_consumption.txt";
data <- fread(File,na.strings="?",,colClasses="character");
subSet<- data[data$Date %in% c("1/2/2007","2/2/2007") ,];

#Plot
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subSet$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
