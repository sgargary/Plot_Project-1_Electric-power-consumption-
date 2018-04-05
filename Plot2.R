x1 <- household_power_consumption 
names(x1)
x1 <- household_power_consumption %>%
  mutate(Global_active_power = as.numeric(Global_active_power)) 

#changing Class to Date:
x1$Date <- as.Date(x1$Date, "%d/%m/%Y")



#subsetting 2 days:
power_feb <- subset(x1, Date == as.Date(as.character("2007-02-01"))|Date == as.Date(as.character("2007-02-02")) )

#Creating a DateTime column
power_feb <- mutate(power_feb, DateTime = as.POSIXct( strptime( paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")))


#Plot2: line type
plot(power_feb$Global_active_power~power_feb$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "Plot2.png", width = 480 , height = 480 )
dev.off()
