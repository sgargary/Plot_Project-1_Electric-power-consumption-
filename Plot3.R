# Plot3: with legend

library(dplyr)
#x1 <- household_power_consumption 
#names(x1)
#x1 <- household_power_consumption %>%
  #mutate(Global_active_power = as.numeric(Global_active_power)) 

x1 <- household_power_consumption %>%
  mutate (Date = as.Date(Date, format = "%d/%m/%Y"))%>%
  mutate(Global_active_power = as.numeric(Global_active_power)) %>%
  mutate(Global_reactive_power = as.numeric(Global_reactive_power))%>%
  mutate(Voltage = as.numeric(Voltage))%>%
  mutate(Sub_metering_1 = as.numeric(Sub_metering_1))%>%
  mutate(Sub_metering_2 = as.numeric(Sub_metering_2))%>%
  mutate(Sub_metering_3 = as.numeric(Sub_metering_3))%>%
  mutate( Global_intensity = as.numeric( Global_intensity))


#subsetting 2 days:
power_feb <- subset(x1, Date == as.Date(as.character("2007-02-01"))|Date == as.Date(as.character("2007-02-02")) )

#Creating a DateTime column
power_feb <- mutate(power_feb, DateTime = as.POSIXct( strptime( paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")))

plot(power_feb$Sub_metering_1~power_feb$DateTime, type = "l", ylab = "Energy sub metering",xlab = "")
lines(power_feb$Sub_metering_2~power_feb$DateTime, type = "l", col = "red")
lines( power_feb$Sub_metering_3~power_feb$DateTime,type = "l",col = "blue")

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
