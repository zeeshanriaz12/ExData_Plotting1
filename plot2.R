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


#Plot 2

plot(df$Date_time,df$Global_active_power, main = "Global Active Power",type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()



