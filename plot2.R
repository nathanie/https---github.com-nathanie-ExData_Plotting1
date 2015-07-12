# reading data
data<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";")
# extracting only needed records
DT<-as.data.table(data[data$Date=="1/2/2007" | data$Date=="2/2/2007",])
# converting relevant field to numeric
Global_active_power<-as.numeric(as.character(DT$Global_active_power))
# fetching date&time
dateTime<- strptime(paste(DT[,DT[,DT$Date]],
                      DT[,DT[,DT$Time]],sep = " "),format = "%d/%m/%Y %H:%M:%S")
#opening a png file instance
png(filename="plot2.png")
#plotting graph as required
plot(dateTime,Global_active_power,type="l")
#closing file
dev.off()


