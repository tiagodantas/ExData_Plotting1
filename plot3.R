setwd("~/Pessoal/Data Science Specialization/Exploratory data analysis/course project1")

Sys.setlocale("LC_TIME", "English")


teste=read.table("household_power_consumption.txt",sep=";",header=T,dec=".",stringsAsFactors=F)
dados=teste[as.character(teste$Date)=="1/2/2007"|as.character(teste$Date)=="2/2/2007",]
dados$Date <- strptime(paste(dados$Date,dados$Time), "%d/%m/%Y %H:%M:%S")
dados$Global_active_power=as.numeric(dados$Global_active_power)




#Gráfico 3
png(filename="plot3.png")

plot(dados$Date,dados$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l")
points(dados$Date,dados$Sub_metering_2,col="red",type="l")
points(dados$Date,dados$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()