library("Rimlbuoy")
library("xts")
library("ggplot2")


source("~/MEGA/Arctus/project/workshop_presentation/read.extract.pix.file.R")
load("~/MEGA/data/BoueesIML/2015/L2/COPS.DB.IML4.V3.RData")

################read data 
####################################
#read data for viking buoy
iml4="~/MEGA/Arctus/data/total/IML4_20160501_20161108_20170324_P3.3_RHOWN.csv"
iml4dat=read.csv(iml4,header = T,sep = ";")
datetime=strptime(iml4dat$TIME_IS,format = "%Y%m%dT%H%M%SZ")

#Read modis data
data2014.modis=read.pix_Extract("~/MEGA/Arctus/data/extracted/pixEx_modis_2014_Level 2_measurements.txt")  
modis.day.f=as.factor(data2014.modis$data[,8])
modis.datetime.f=strptime(paste(data2014.modis$data[,8],data2014.modis$data[,9]),format = "%Y-%m-%d %H:%M")

##need to completed