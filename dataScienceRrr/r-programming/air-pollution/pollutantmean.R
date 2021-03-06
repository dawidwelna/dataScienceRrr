pollutantmean <- function(directory, pollutant, id = 1:332){
  ##'directory' is a character vector of length 1 indicating
  ##the location of the cSV files
  
  ##'pollutant' is a character vector of length 1 indicating
  ##'the name of the pollutant for which we will calculate the
  ##'mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  data <- list.files(directory, full.names = TRUE)
  monitors <- data.frame()
  for(i in seq_along(id)){


    monitors <- rbind(monitors, read.csv(data[i]))

  }

  mean(monitors[,pollutant], na.rm = TRUE)


}