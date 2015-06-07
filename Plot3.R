#Read the data
library(data.table)
File <- "household_power_consumption.txt";
data <- fread(File,na.strings="?",,colClasses="character");
subSet<- data[data$Date %in% c("1/2/2007","2/2/2007") ,];

#Plot
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)

png("Plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()