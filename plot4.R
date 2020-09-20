df=read.table("./data/household_power_consumption.txt", sep=";",header = T,na.strings = "?",
              colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


#checking data types
sapply(df,class)

#Changing type of Date
df$Date=as.Date(df$Date,"%d/%m/%Y")


#Filtering Data
df=df[df$Date>=as.Date("2007-2-1") & df$Date<="2007-2-2",]

#Checking for summary stats
summary(df)

#Removing NAs if any
df=df[complete.cases(df),]

#Creating DateTime object
df$Date_time=paste(df$Date,df$Time)

#Removing individual cols of date and time
df=df[,3:length(df)]

#Changing type
df$Date_time=as.POSIXct(df$Date_time)


#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~Date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date_time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date_time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()


