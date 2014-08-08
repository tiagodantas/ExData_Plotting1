
setwd("~/Pessoal/Data Science Specialization/Exploratory data analysis/course project1")

Sys.setlocale("LC_TIME", "English")


teste=read.table("household_power_consumption.txt",sep=";",header=T,dec=".",stringsAsFactors=F)
dados=teste[as.character(teste$Date)=="1/2/2007"|as.character(teste$Date)=="2/2/2007",]
dados$Date <- strptime(paste(dados$Date,dados$Time), "%d/%m/%Y %H:%M:%S")
dados$Global_active_power=as.numeric(dados$Global_active_power)




#Gráfico 4
dados$Voltage=as.numeric(dados$Voltage)
dados$Global_reactive_power=as.numeric(dados$Global_reactive_power)


png(filename="plot4.png")

par(mfrow=c(2,2))
plot(dados$Date,dados$Global_active_power, ylab="Global Active Power",xlab="",type="l")
plot(dados$Date,dados$Voltage, ylab="Voltage",xlab="",type="l")
plot(dados$Date,dados$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l")
points(dados$Date,dados$Sub_metering_2,col="red",type="l")
points(dados$Date,dados$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dados$Date,dados$Global_reactive_power, ylab="Global_reactive_Power",xlab="",type="l")

dev.off()