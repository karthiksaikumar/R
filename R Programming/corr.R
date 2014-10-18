
source("complete.R")

corr<-function(directory,threshold = 0){
  
  correlation<-numeric()   #initializing empty vector
  files<-list.files(directory,pattern="*.csv")    #getting list of files
  len<-length(files)  
  
  for(i in 1:len) {
    
    id <-  formatC(i, width = 3, format = "d", flag = "0")  #prefixing zeros
    dir<-file.path(directory, paste(id,".csv", sep=""))     #constructing path
    
    file<-read.csv(dir)
    
    comp<-complete(directory,i)   #fetch no. of complete observations 
    
    if (comp$nobs > threshold)
    {
      cor<-round(cor(file$sulfate,file$nitrate, use = "complete.obs"),digits=4) #calculate correlation
      correlation <- c(correlation,cor)  #populate correlation vector
    }
     
  }
  
  if(length(correlation)==0)   #if no monitors meet threshold, set to numeric vector of length 0
  {correlation<-numeric()}
  
  correlation   #return correlation
}


