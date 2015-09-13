
## Load the data.
hp <- fread("household_power_consumption.txt", header=TRUE, na.strings=c("?"))

## Convert the Date column to a Date type as column d.
hp[,d:=as.Date(Date, "%d/%m/%Y")]

## Just select the data we need.
hps <- subset(hp, d=="2007-02-02" | d=="2007-02-01")

## Convert the Time column to a Time type as column t.
hps[,t:=as.POSIXct(strptime(paste(hps$d, hps$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))]

## Create the line graph.
plot(hps$t, as.numeric(hps$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Create the PNG file.
dev.copy(png, file="plot2.png")
dev.off()