data<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-data[data[,1]<="2007-02-02"&data[,1]>="2007-02-01",,drop=FALSE]
datetime<-strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(datetime,data$Global_active_power, type="l", 
     ylab="Global Active Power",xlab="")
plot(datetime,data$Voltage, type="l", 
     ylab="Voltage",xlab="datetime")
plot(datetime, data$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(datetime, data$Sub_metering_2, col="red", type="l")
lines(datetime, data$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), lty=1, bty ="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,data$Global_reactive_power, type="l", 
     ylab="Global_reactive_power",xlab="datetime")
dev.off()