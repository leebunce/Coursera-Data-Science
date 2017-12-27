library(readr)

power_all <- read_delim("household_power_consumption.txt", 
                                          ";",
                                          na = '?',
                                          escape_double = FALSE,
                                          trim_ws = TRUE)

power <- subset(power_all, Date %in% c('1/2/2007', '2/2/2007'))

power$DateTime <- strptime(paste(power$Date, power$Time),
                                 format="%d/%m/%Y %H:%M:%S")

# Plot 3 ------------------------------------------------------------------
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px")
plot(power$DateTime, power$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2,
      col="red")
lines(power$DateTime, power$Sub_metering_3,
      col="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"))
dev.off()