df<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.string="?")
#only include 2007-02-01, 2007-02-02
df$Date_dt<-as.Date(df$Date, format="%d/%m/%Y")
df_s=df[df$Date_dt>="2007-02-01" & df$Date_dt<="2007-02-02",]
#merge Date and Time
df_s$ts<-as.POSIXct(paste(df_s$Date_dt, df_s$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", bg = "white", width=480, height=480)  
par(mfrow=c(2,2))
plot(x=df_s$ts, y=df_s$Global_active_power, type="l",xlab=NA, ylab="Global Active Power (killowatts)")
plot(x=df_s$ts, y=df_s$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot(x=df_s$ts, y=df_s$Sub_metering_1, type="l",xlab=NA, ylab="Energy sub metering",col="black")
lines(x=df_s$ts, y=df_s$Sub_metering_2, col="red")
lines(x=df_s$ts, y=df_s$Sub_metering_3, col="blue")
legend("topright",lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"))
plot(x=df_s$ts, y=df_s$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()
