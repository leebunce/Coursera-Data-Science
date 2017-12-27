library(readr)

power_all <- read_delim("household_power_consumption.txt", 
                                          ";",
                                          na = '?',
                                          escape_double = FALSE,
                                          trim_ws = TRUE)

power <- subset(power_all, Date %in% c('1/2/2007', '2/2/2007'))

power$DateTime <- strptime(paste(power$Date, power$Time),
                                 format="%d/%m/%Y %H:%M:%S")

# Plot 4 ------------------------------------------------------------------
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px")
par(mfrow = c(2,2))
#1
plot(power$DateTime, power$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
#2
plot(power$DateTime, power$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

#3
plot(power$DateTime, power$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2,
      col="red")
lines(power$DateTime, power$Sub_metering_3,
      col="blue")
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
#4
plot(power$DateTime, power$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab = "Global_reactive_test")

dev.off()
