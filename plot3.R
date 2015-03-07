### household_power_consumption.txt is downloaded and in work directory

### Read
EPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

### Subsetting (only 2007-02-01 and 2007-02-02)
EPC <- EPC[(EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007"),]

### New Date
EPC$Date2 <- strptime(paste(EPC$Date,EPC$Time),"%d/%m/%Y %H:%M:%S")

### as.numerics
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
EPC$Sub_metering_1 <- as.numeric(EPC$Global_Sub_metering_1)
EPC$Sub_metering_2 <- as.numeric(EPC$Global_Sub_metering_2)
EPC$Sub_metering_3 <- as.numeric(EPC$Global_Sub_metering_3)

### Sys from German to Englisch
Sys.setlocale("LC_TIME", "English")

### plotting
dev.copy(png, filename="plot3.png", width=480, height=480)

with(EPC, {
  plot(Date2, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
  lines(Date2, Sub_metering_2, col="red")
  lines(Date2, Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend = c ("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

dev.off()