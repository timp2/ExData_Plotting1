
## Load the data.
hp <- fread("household_power_consumption.txt", header=TRUE, na.strings=c("?"))

## Convert the Date column to a Date type as column d.
hp[,d:=as.Date(Date, "%d/%m/%Y")]

## Just select the data we need.
hps <- subset(hp, d=="2007-02-02" | d=="2007-02-01")

## Convert the Time column to a Time type as column t.
hps[,t:=as.POSIXct(strptime(paste(hps$d, hps$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))]

## Create the line graph.
plot(hps$t, as.numeric(hps$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(hps$t, as.numeric(hps$Sub_metering_2), col="red")
lines(hps$t, as.numeric(hps$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))

## Create the PNG file.
dev.copy(png, file="plot3.png")
dev.off()

