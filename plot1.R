
data = read.delim(file="household_power_consumption.txt",sep=";",na.strings="?")
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date,format="%d/%m/%Y")
data <- data[c(which(data$Date == strptime("2007-02-01",format="%Y-%m-%d")),which(data$Date == strptime("2007-02-02",format="%Y-%m-%d"))),]

png(filename="plot1.png")
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()