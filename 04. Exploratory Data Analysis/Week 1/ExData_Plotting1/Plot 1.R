library(readr)

power_all <- read_delim("household_power_consumption.txt", 
                                          ";",
                                          na = '?',
                                          escape_double = FALSE,
                                          trim_ws = TRUE)

power <- subset(power_all, Date %in% c('1/2/2007', '2/2/2007'))

power$DateTime <- strptime(paste(power$Date, power$Time),
                                 format="%d/%m/%Y %H:%M:%S")

# Plot 1 ------------------------------------------------------------------
png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px")
with(power, hist(Global_active_power,
                 col = 'red', 
                 main = 'Global Active Power',
                 xlab = 'Global Active Power (kilowatts)'))
dev.off()
