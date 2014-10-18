

pollutantmean<-function(directory,pollutant,id=1:332){
  
  allvalues<-c()     #intialising an empty vector to populate values from chosen files
      
  for(i in id) {
  
          id <-  formatC(i, width = 3, format = "d", flag = "0")  #prefixing zeros
          dir<-file.path(directory, paste(id,".csv", sep=""))     #constructing path
  
  currentfile<-read.csv(dir)              #reading file

  currentcolumn<-currentfile[[pollutant]] #reading column values

  allvalues<-c(allvalues,currentcolumn)   #collating column values

              }

mean<-round(mean(allvalues,na.rm=TRUE),digits=3)       #calculating overall mean        

return(mean)

}