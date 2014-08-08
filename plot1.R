setwd("~/Pessoal/Data Science Specialization/Exploratory data analysis/course project1")

Sys.setlocale("LC_TIME", "English")


teste=read.table("household_power_consumption.txt",sep=";",header=T,dec=".",stringsAsFactors=F)
dados=teste[as.character(teste$Date)=="1/2/2007"|as.character(teste$Date)=="2/2/2007",]
dados$Date <- strptime(paste(dados$Date,dados$Time), "%d/%m/%Y %H:%M:%S")
dados$Global_active_power=as.numeric(dados$Global_active_power)


#Gráfico 1

png(filename="plot1.png")

hist(dados$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()