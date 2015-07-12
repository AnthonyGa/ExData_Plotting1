data<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-data[data[,1]<="2007-02-02"&data[,1]>="2007-02-01",,drop=FALSE]
datetime<-strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(datetime,data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()