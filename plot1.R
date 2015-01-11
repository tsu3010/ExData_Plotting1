##Data is read from the working directory where it is stored in .txt format


library(sqldf)

data<-read.csv.sql('household_power_consumption.txt',
                   "select * from file where Date in ('1/2/2007','2/2/2007')", 
                   sep = ';', header = T)

png(file="plot1.png")

hist(data$Global_active_power,main="Global Active Power",
     xlab="Global Active Power(kilowatts)",col="orange")


dev.off()