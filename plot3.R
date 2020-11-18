# Before running the code, make sure data set is downloaded and unzip in this working directory 

# load data set
power_data <- read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";")

# select data from 2007-02-01 and 2007-02-02
select_data <- power_data[(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"),]

# change datetime format
select_data$Date <- as.Date(select_data$Date, format="%d/%m/%Y")
dateTime <- paste(select_data$Date, select_data$Time)
select_data$DateTime <- as.POSIXct(dateTime)

# generate graph
with(select_data,{
  plot(Sub_metering_1 ~ DateTime, type='l', ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime, col="Red")
  lines(Sub_metering_3~DateTime, col="Blue")
})

legend("topright", col=c("black","red","blue"), lty=1, lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
