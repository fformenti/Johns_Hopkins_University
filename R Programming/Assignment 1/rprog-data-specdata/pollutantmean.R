## Assignment 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  
  data <- lapply(filenames, read.csv)
  
  sub.data <- data[id]
  sub.data <- lapply(sub.data, function(arg) arg[[pollutant]])
  sub.data <- lapply(sub.data, function(arg) arg[!is.na(arg)])
  sub.data <- unlist(sub.data)
  
  v.mean <- mean(sub.data)
  return(v.mean)
}

