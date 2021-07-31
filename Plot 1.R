# Reading, naming and subsetting power consumption data
power <- read.csv("./household_power_consumption.txt",
                  sep=";",
                  header = TRUE,
                  na.strings = '?')
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#PLOT 1
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(subpower$Global_active_power)),col="blue",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()