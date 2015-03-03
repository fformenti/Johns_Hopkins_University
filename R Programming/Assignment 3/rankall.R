#Rank All

rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  col <- switch(outcome,
           "heart attack" = 11,
           "heart failure"= 17,
           "pneumonia"= 23)
  
  #Validity check
  if (is.null(col)) stop("invalid outcome")
  
  # Data treating
  df[, col] <- as.numeric(df[, col])
  if (num == "best") num <- 1
  
  ## Renaming columns
  names(df)[col] <- "Death_Rate"
  
  ## Subsetting
  df <- df[!is.na(df$Death_Rate), c("Hospital.Name","State","Death_Rate")]
  
  # Ordering
  df <- df[order(df$Hospital.Name),]
  df <- df[order(df$Death_Rate),]
  
  # Splitting into states and taking the rank
  rank <- lapply(split(df$Hospital.Name,df$State), function(x){
    N_records <- length(x)
    if (num == "worst") num <- N_records
    if (num > N_records) {
      NA}
    else
    {
      x[num]
    }
    })
  
  rank <- data.frame(hospital = unsplit(rank, names(rank)), state = names(rank))
  
  return(rank)
}
