library(lubridate)

setwd("./datasciencecoursera/Course4_ExploratoryDataAnalysis/")
data <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data_feb <- subset(data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
data_feb$Global_active_power <- as.numeric(data_feb$Global_active_power)

par(bg=NA)
hist(data_feb$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(device = png, filename = 'plot1.png', width = 480, height = 480) 
dev.off()
