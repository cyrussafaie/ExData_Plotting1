hh_inc=read.table("household_power_consumption.txt", sep = ";",header = T,dec = ".",stringsAsFactors = F)
str(hh_inc)

hh_inc_sub <- hh_inc[hh_inc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hh_inc_sub$Date, hh_inc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hh_inc=cbind(datetime,hh_inc_sub)

png("plot3.png", width=480, height=480)
plot(hh_inc$datetime,as.numeric(hh_inc$Sub_metering_1),type = "l", ylab="Energy Submetering",xlab = "")
lines(hh_inc$datetime,as.numeric(hh_inc$Sub_metering_2),type = "l", col="red")
lines(hh_inc$datetime,as.numeric(hh_inc$Sub_metering_3),type = "l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

