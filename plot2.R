#Data is read from working directory where it is stored in .txt format

library(sqldf)
library(dplyr)

df<-read.csv.sql('household_power_consumption.txt',
                   "select * from file where Date in ('1/2/2007','2/2/2007')", 
                   sep = ';', header = T)

df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(df$DateTime,df$Global_active_power,type="l",
     ylab="Global Active Power(kilowatts)",xlab="")

dev.off()