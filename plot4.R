#setwd("C:/Users/Marco/Documents/Data Science Specialization/Exploratory Data Analysis")
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

data$datetime<-paste(data$Date, data$Time, sep="-")
data$datetime<-as.POSIXct(data$datetime, format="%Y-%m-%d-%H:%M:%S")

# Optional code to get weekdays in English
#Sys.setlocale("LC_TIME", "English")
# Optional code to get weekdays in Spanish (México)
#Sys.setlocale("LC_TIME","Spanish_Mexico.1252")



png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(data$datetime,data$Global_active_power , type="n", 
     ylab="Global Active Power", xlab="")
lines(data$datetime,data$Global_active_power )

plot(data$datetime,data$Voltage , type="n", 
     ylab="Voltage", xlab="datetime")
lines(data$datetime,data$Voltage )

plot(data$datetime,data$Sub_metering_1, 
     ylab="Energy sub metering", xlab="", type="n")
lines(data$datetime,data$Sub_metering_1 )
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n")

plot(data$datetime,data$Global_reactive_power , type="n", 
     ylab="Global_reactive_power", xlab="datetime")
lines(data$datetime,data$Global_reactive_power )

dev.off()