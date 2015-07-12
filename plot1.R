# reading data
data<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";")
# extracting only needed records
DT<-as.data.table(data[data$Date=="1/2/2007" | data$Date=="2/2/2007",])
# converting relevant field to numeric
Global_active_power<-as.numeric(as.character(DT$Global_active_power))
#opening a png file instance
png(filename="plot1.png")
#plotting graph as required
hist(Global_active_power,col = 2)
#closing file
dev.off()
