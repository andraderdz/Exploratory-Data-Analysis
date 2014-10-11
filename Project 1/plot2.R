#***************Reading the DATA*********************************

data<-read.table(a,sep =";",stringsAsFactors=F,header=T,na.strings="?") #Where "a" is the path file
data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
data2[,10]<-paste(data2[,1],data2[,2])
fecha<-data2[,10]
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
data2<-data2[,1:9]
data2<-cbind(data2,fecha)
#***************Ploting the DATA*********************************
 
png(filename="plot2.png")    #This save the image in your Working Directory
plot(data2$fecha,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()