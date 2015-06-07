#Read the data
library(data.table)
File <- "household_power_consumption.txt";
data <- fread(File,na.strings="?",,colClasses="character");
subSet<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot
global_Active_Power <- as.numeric(subSet$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()