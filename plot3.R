# reading data
data<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";")
# extracting only needed records
DT<-as.data.table(data[data$Date=="1/2/2007" | data$Date=="2/2/2007",])
# converting relevant fields to numeric
Global_active_power<-as.numeric(as.character(DT$Global_active_power))
Sub_metering_1<-as.numeric(as.character(DT$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(DT$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(DT$Sub_metering_3))
# fetching date&time
dateTime<- strptime(paste(DT[,DT[,DT$Date]],
                          DT[,DT[,DT$Time]],sep = " "),format = "%d/%m/%Y %H:%M:%S")
#opening a png file instance
png(filename="plot3.png")
#plotting graph as required
plot(dateTime, Sub_metering_1, type="l")
lines(dateTime, Sub_metering_2,col=2)
lines(dateTime, Sub_metering_3,col=4)
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,
       lwd = 0.75,col = c("black","red","blue"))
#closing file
dev.off()
