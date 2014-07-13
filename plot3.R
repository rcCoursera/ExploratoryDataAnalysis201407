data = read.delim(file="household_power_consumption.txt",sep=";",na.strings="?")
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date,format="%d/%m/%Y")
data <- data[c(which(data$Date == strptime("2007-02-01",format="%Y-%m-%d")),which(data$Date == strptime("2007-02-02",format="%Y-%m-%d"))),]

Sys.setlocale("LC_TIME", "C")
png(filename="plot3.png")
plot(data$Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()