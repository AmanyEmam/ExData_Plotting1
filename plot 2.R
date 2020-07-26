## Plot 2 
Householdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Householdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(Householdpower,Householdpower$Date=="1/2/2007" | Householdpower$Date =="2/2/2007")

# Transform the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## the type of the plot requested is type l
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)), type ="l", main = "Global Active Power Vs Time", ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
