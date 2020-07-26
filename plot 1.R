## Peer-Graded Assignment: Course Project 1 
## Read the .txt file 
Householdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
## ## The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
names(Householdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## We will only be using data from the dates 2007-02-01 and 2007-02-02
subpower <- subset(Householdpower,Householdpower$Date=="1/2/2007" | Householdpower$Date =="2/2/2007")
subpower
## the figure in one row and one column with a fixed margins 
par(mfrow = c(1,1), mar = c(4,4,4,0))
## Histogram of Global active power with red color and x-axis labeled as Global Active Power(kilowatts)
hist(as.numeric(subpower$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power", breaks = 20)
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
