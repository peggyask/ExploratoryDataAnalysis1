df<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.string="?")
#only include 2007-02-01, 2007-02-02
df$Date_dt<-as.Date(df$Date, format="%d/%m/%Y")
df_s=df[df$Date_dt>="2007-02-01" & df$Date_dt<="2007-02-02",]

png(file = "plot1.png", bg = "white", width=480, height=480)        
hist(df_s$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", ylab="Frequency", col="red")
dev.off()

