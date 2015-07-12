data<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-data[data[,1]<="2007-02-02"&data[,1]>="2007-02-01",,drop=FALSE]
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()