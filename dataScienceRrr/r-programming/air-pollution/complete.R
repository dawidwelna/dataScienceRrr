complete <- function(directory, id = 1:332){
  
  data <- list.files(directory, full.names = TRUE)
  
  nobs <- vector(mode = "integer", length(id))
  for(i in seq_along(id)){
    
    x <- read.csv(data[id[i]])
    nobs[i] <- sum( complete.cases(x) )
  }
  
  
  data.frame(id, nobs)
}