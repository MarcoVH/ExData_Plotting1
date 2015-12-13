#setwd("C:/Users/Marco/Documents/Data Science Specialization/Exploratory Data Analysis")
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-as.Date(data$Date, format="%d/%m/%Y")


png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power, col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
 