#Rank Hospital

rankhospital <- function(state, outcome, num) {
  
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  state_vector <- unique(df[,"State"])
  
  
  col <- switch(outcome,
           "heart attack" = 11,
           "heart failure"= 17,
           "pneumonia"= 23)
  
  #Validity check
  if (is.null(col)) stop("invalid outcome")
  if (!state %in% state_vector) stop ("invalid state")
  
  # Data treating
  df[, col] <- as.numeric(df[, col])
  
  ## Renaming columns
  names(df)[col] <- "Death_Rate"
  
  
  ## Subsetting 
  df <- df[df$State == state & !is.na(df$Death_Rate), c("Hospital.Name","State","Death_Rate")]
  
  # Ordering
  N_records <- nrow(df)
  if (num == "best") num <- 1
  if (num == "worst") num <- N_records
  
  df <- df[order(df$Hospital.Name),]
  df <- df[order(df$Death_Rate),]
  
  ## Return hospital name in that state with the given rank position
  if (num > N_records) {
    hospital <- NA}
  else
  {
    hospital <- df[num,c("Hospital.Name")]
  }
  
  return(hospital)
}
