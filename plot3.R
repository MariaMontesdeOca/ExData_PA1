#Read the data into R
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c(rep("character",2),rep("numeric",7)),na="?")


#Convierte Date en formato fecha
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Select only the dates that we're gonna plot
refineddata<-subset(data,Date=="2007-02-02"|Date=="2007-02-01")

#Creating the plot3.png file
png(file="plot3.png",width=480,height=480,units="px",bg="white")
with(refineddata,plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab=""))
lines(refineddata$Sub_metering_2,col="red")
lines(refineddata$Sub_metering_3,col="blue")
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#closing the .png file
dev.off()
