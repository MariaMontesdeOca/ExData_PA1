#Read the data into R
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c(rep("character",2),rep("numeric",7)),na="?")


#Convierte Date en formato fecha
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Select only the dates that we're gonna plot
refineddata<-subset(data,Date=="2007-02-02"|Date=="2007-02-01")


#Creating the plot1.png file

png(file="plot1.png",width=480, height=480,units="px",bg="white")
hist(refineddata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#closing the .png file
dev.off()
