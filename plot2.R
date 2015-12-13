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

png(file="plot2.png",width=480,height=480)
plot(data$datetime,data$Global_active_power , type="n", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$datetime,data$Global_active_power )
  dev.off()
