#***************Reading the DATA*********************************
 
data<-read.table(a,sep =";",stringsAsFactors=F,header=T,na.strings="?") #Where "a" is the path file
data2<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
data2[,10]<-paste(data2[,1],data2[,2])
fecha<-data2[,10]
fecha<-strptime(fecha,"%d/%m/%Y %H:%M:%S")
data2<-data2[,1:9]
data2<-cbind(data2,fecha)
#***************Ploting the DATA*********************************

png(filename="plot1.png")    #This save the image in your Working Directory
hist(data2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

***********HArd Way *****************************

table(cut(data2$Global_active_power, breaks = seq(0,6,0.5)))

(0,0.5] (0.5,1] (1,1.5] (1.5,2] (2,2.5] (2.5,3] (3,3.5] (3.5,4] (4,4.5] (4.5,5] (5,5.5] (5.5,6] 
1234     181     633     276     160     212      69      69      20      16       6       2 

barplot(table(cut(data2$Global_active_power, breaks = seq(0,6,0.5)) ),ylab="Frequecy",space=0,col="red")