library(dplyr)
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

#Plot1: Histogram only for subset data
hist(power_feb$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)" )

#saveing plot as PNG
dev.copy(png, "Plot1.png", width = 480 , height = 480 )
dev.off()
