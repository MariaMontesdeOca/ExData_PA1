#Read the data into R
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c(rep("character",2),rep("numeric",7)),na="?")


#Convierte Date en formato fecha
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Select only the dates that we're gonna plot
refineddata<-subset(data,Date=="2007-02-02"|Date=="2007-02-01")

#Creating the plot2.png file
png(file="plot2.png",width=480,height=480,units="px",bg="white")
with(refineddata,plot(Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab=""))
axis(1,at=c(0,1500,nrow(refineddata)),labels=c("Thu","Fri","Sat"))

#Closing the .png file
dev.off()
