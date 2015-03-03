## Assignment 1

corr <- function(directory, threshold = 0) {
    
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  data <- lapply(filenames, read.csv)
  
  v.corr <- c()
  for (i in 1:length(data)) {
    tmp <- data[[i]]
    tmp <- tmp[!(is.na(tmp$Date)) & !(is.na(tmp$nitrate)) & !(is.na(tmp$sulfate)), ]
    nobs <- nrow(tmp)
    
    if (nobs >= threshold) {
      new.corr <- cor(tmp$nitrate,tmp$sulfate)
      v.corr <- c(v.corr, new.corr)
    }
  }
  return(v.corr)
}

