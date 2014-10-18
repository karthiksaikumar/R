

complete<-function(directory,id=1:332){
  
  df<-data.frame(id=numeric(),nobs=numeric())     #intialising empty data frame
  
  for(i in id) {
    
    id <-  formatC(i, width = 3, format = "d", flag = "0")  #prefixing zeros
    dir<-file.path(directory, paste(id,".csv", sep=""))     #constructing path
    
    cf<-read.csv(dir)              #reading file
    
    cobs=sum(complete.cases(cf)==TRUE)         #counting non-empty rows
    
    
    df<-rbind(df,data.frame(id=i,nobs=cobs))   #adding row to data frame
    
  }
  df      #printing/return result
}