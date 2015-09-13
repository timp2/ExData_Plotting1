
## Load the data.
hp <- fread("household_power_consumption.txt", header=TRUE, na.strings=c("?"))

## Convert the Date column to a Date type as column d.
hp[,d:=as.Date(Date, "%d/%m/%Y")]

## Just select the data we need.
hps <- subset(hp, d=="2007-02-02" | d=="2007-02-01")

## Create the histogram.
hist(as.numeric(hps$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

## Create the PNG file.
dev.copy(png, file="plot1.png")
dev.off()