#Read the data into R
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c(rep("character",2),rep("numeric",7)),na="?")


#Convierte Date en formato fecha
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Select only the dates that we're gonna plot
refineddata<-subset(data,Date=="2007-02-02"|Date=="2007-02-01")


#Creating the plot4.png file

##Creating the file and setting the format of the graph
png(file="plot4.png",width=480,height=480,units="px",bg="white")
par(mfrow=c(2,2),mar=c(5,4,2,1))

## Creating plot 4.1 (plot2 modifiying ylab)
plot(refineddata$Global_active_power,type="l",ylab="Global Active Power",xaxt="n",xlab="")
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))

## Creating plot 4.2
plot(refineddata$Voltage,type="l",ylab="Voltage",xlab="datetime",xaxt="n")
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))

## Creating plot 4.3 (plot3 modifiying bty="n")
plot(refineddata$Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n", xlab="")
lines(refineddata$Sub_metering_2,col="red")
lines(refineddata$Sub_metering_3,col="blue")
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))
legend("topright",bty="n",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Creating plot 4.4
plot(refineddata$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime",xaxt="n")
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))

##Closing the .png file
dev.off()
