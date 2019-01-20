library(lubridate)
library(tidyverse)
library(magrittr)

#path to the file
path<-file.choose()

#read the txt file
myData<-read.table(file=path,header=T,sep=";",stringsAsFactors = F,check.names = F)

#View complete data in R
View(myData)

#Change the data format of Date column to yyyy-mm-dd
myData$Date<-dmy(myData$Date)

#Filter data for 1st & 2nd Feb 2007
df<-myData[myData$Date=="2007-02-01" | myData$Date=="2007-02-02",]
unique(df$Date)
View(df)


class(df$Global_active_power)
df$Global_active_power<-as.numeric(df$Global_active_power)

#Plot
p1<-plot(df$Global_active_power,type = "l" ,lwd = 2,ylab="Global Active Power(KiloWatts)",xlab="")