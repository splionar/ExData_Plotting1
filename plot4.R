setwd("./datasciencecoursera/Course4_ExploratoryDataAnalysis/")
data <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE)

data_feb <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

for (i in 3:length(names(data_feb))){
        data_feb[,i] <- as.numeric(data_feb[,i])
}
date_time <- as.POSIXct(paste(data_feb$Date, data_feb$Time), format="%d/%m/%Y %H:%M:%S")
data_feb<- cbind(data_feb,date_time)

par(mfcol = c(2,2), mar = c(5,4,0.5,2), bg=NA)
with(data_feb, plot(date_time, Global_active_power, type= "n",ylab="Global Active Power", xlab=""))
lines(data_feb$date_time, data_feb$Global_active_power)

with(data_feb, plot(date_time, y= Sub_metering_1, type= "n",ylab="Energy sub metering", xlab=""))
lines(data_feb$date_time, data_feb$Sub_metering_1)
lines(data_feb$date_time, data_feb$Sub_metering_2, col = "red")
lines(data_feb$date_time, data_feb$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1,cex = 0.9, bty = "n")

with(data_feb, plot(date_time, Voltage, type= "n",xlab="datetime", ylab="Voltage"))
lines(data_feb$date_time, data_feb$Voltage)

with(data_feb, plot(date_time, Global_reactive_power, type= "n",xlab="datetime", ylab="Global_reactive_power"))
lines(data_feb$date_time, data_feb$Global_reactive_power)

dev.copy(device = png, filename = 'plot4.png', width = 480, height = 480) 
dev.off()
