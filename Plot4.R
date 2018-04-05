#Plot4: 
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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


#Plot1
#hist(power_feb$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)" )

#Plot2
plot(power_feb$Global_active_power~power_feb$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#PlotVoltage
plot( power_feb$Voltage~power_feb$DateTime,type = "l", ylab = "Voltage",xlab = "datetime")


#Plot3
plot(power_feb$Sub_metering_1~power_feb$DateTime, type = "l", ylab = "Energy sub metering",xlab = "")
lines(power_feb$Sub_metering_2~power_feb$DateTime, type = "l", col = "red")
lines( power_feb$Sub_metering_3~power_feb$DateTime,type = "l",col = "blue")

#PlotReactive
plot( power_feb$Global_reactive_power~power_feb$DateTime,type = "l", ylab = "Global_reactive_power",xlab = "datetime")

dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()
