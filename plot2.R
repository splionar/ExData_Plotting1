setwd("./datasciencecoursera/Course4_ExploratoryDataAnalysis/")
data <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE)

data_feb <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
date_time <- as.POSIXct(paste(data_feb$Date, data_feb$Time), format="%d/%m/%Y %H:%M:%S")
data_feb<- cbind(data_feb,date_time)
data_feb$Global_active_power <- as.numeric(data_feb$Global_active_power)

par(bg=NA)
with(data_feb, plot(date_time, Global_active_power, type= "n",ylab="Global Active Power (kilowatts)", xlab=""))
lines(data_feb$date_time, data_feb$Global_active_power)
     
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480) 
dev.off()
