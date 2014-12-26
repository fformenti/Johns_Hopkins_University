## Assignment 1

complete <- function(directory, id = 1:332) {
    
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  data <- lapply(filenames, read.csv)
  
  sub.data <- data[id]
  
  df <- data.frame()
  for (i in 1:length(id)) {
    print(i)
    tmp <- sub.data[[i]]
    id <- tmp[1,4]
    nobs <- nrow(tmp[!(is.na(tmp$sulfate)) & !(is.na(tmp$nitrate)), ])
    df <- rbind(df, c(id,nobs))
  }
  
  names(df) <- c("id","nobs")
  return(df)
}

