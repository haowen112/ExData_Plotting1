# Before running the code, make sure data set is downloaded and unzip in this working directory 

# load data set
power_data <- read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";")

# select data from 2007-02-01 and 2007-02-02
select_data <- power_data[(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"),]

# generate graph
hist(select_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

# export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
