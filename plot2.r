df<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.string="?")
#only include 2007-02-01, 2007-02-02
df$Date_dt<-as.Date(df$Date, format="%d/%m/%Y")
df_s=df[df$Date_dt>="2007-02-01" & df$Date_dt<="2007-02-02",]
#merge Date and Time
df_s$ts<-as.POSIXct(paste(df_s$Date_dt, df_s$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", bg = "white", width=480, height=480)  
plot(x=df_s$ts, y=df_s$Global_active_power, type="l",xlab=NA, ylab="Global Active Power (killowatts)")
dev.off()
