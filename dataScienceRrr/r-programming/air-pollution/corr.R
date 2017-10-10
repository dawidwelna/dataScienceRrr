# complete <- function(directory, ids = 1:332){
#   
#   data <- list.files(directory, full.names = TRUE)
#   
#   nobs <- vector(mode = "integer", length(ids))
#   for(i in seq_along(ids)){
#     
#     x <- read.csv(data[ids[i]])
#     nobs[i] <- sum( complete.cases(x) )
#   }
#   
#   
#   data.frame(ids, nobs)
# }

corr <- function(directory, threshold = 0){
  
  data <- list.files(directory, full.names = TRUE)
  com <- complete(directory) # data frame of complete cases
  coc <- com[com$nobs>threshold, 1] #coc - ids of complete observed cases

  corr <- vector(mode = "numeric", length(coc))
  for(i in seq_along(coc)){
    
    x <- read.csv(data[coc[i]])
    x <- x[complete.cases(x),]
    
    corr[i] <- cor(x[,"sulfate"], x[,"nitrate"])
    
  }
  corr  
  
}