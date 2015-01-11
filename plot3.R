#Data is read from working directory where it is stored in .txt format


library(sqldf)
library(dplyr)

df<-read.csv.sql('household_power_consumption.txt',
                 "select * from file where Date in ('1/2/2007','2/2/2007')", 
                 sep = ';', header = T)

df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(df$DateTime,df$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue") 
legend("topright",pch="-",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()