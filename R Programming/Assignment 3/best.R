#Best

best <- function(state, outcome) {
  
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
  df <- df[order(df$Death_Rate),]
  
  ## Return hospital name in that state with lowest 30-day death rate
  hospital <- df[1,c("Hospital.Name")]
  return(hospital)
}
