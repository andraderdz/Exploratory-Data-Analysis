#***************Reading the DATA*********************************

data<-read.table(a,sep =";",stringsAsFactors=F,header=T,na.strings="?") #Where "a" is the path file
data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
data2[,10]<-paste(data2[,1],data2[,2])
fecha<-data2[,10]
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
data2<-data2[,1:9]
data2<-cbind(data2,fecha)
#***************Ploting the DATA*********************************
 
png(filename="plot3.png")    #This save the image in your Working Directory
plot(data2$fecha,data2$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(data2$fecha,data2$Sub_metering_2,col="red")
lines(data2$fecha,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),xjust=1,col=c("black","blue","red"),cex=0.7)
dev.off()

#legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),xjust=1,col=c("black","blue","red"),cex=0.7)


#pch=1,pt.cex = 2   agrega un peque??o circulo de color a un lado de la etiqueta