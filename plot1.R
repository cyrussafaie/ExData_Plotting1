hh_inc=read.table("household_power_consumption.txt", sep = ";",header = T,dec = ".",stringsAsFactors = F)
str(hh_inc)

hh_inc_sub <- hh_inc[hh_inc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hh_inc_sub$Date, hh_inc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hh_inc=cbind(datetime,hh_inc_sub)

png("plot1.png", width=480, height=480)
hist(as.numeric(hh_inc$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()




