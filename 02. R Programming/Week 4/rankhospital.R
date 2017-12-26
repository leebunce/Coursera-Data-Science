# rankhospital

# Function ----------------------------------------------------------------
rankhospital <- function(state, outcome, num = "best") {
  
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if (!(state %in% unique(outcome_data$State))) {
    stop('invalid state')
  }
  
  if (!(outcome %in% c('heart attack', 'heart failure', 'pneumonia'))) {
    stop('invalid outcome')
  }
  
  if (!(num %in% c('best', 'worst') | !is.integer(num))){
    stop('invalid num')
  }
  
  ## Return hospital name in that state with lowest 30-day death
  outcome_data_small <- if (outcome == 'heart attack') {
    outcome_data[, c(2, 7, 11)]
  } else if (outcome == 'heart failure') {
    outcome_data[, c(2, 7, 17)]
  } else if (outcome == 'pneumonia') {
    outcome_data[, c(2, 7, 23)]
  }
  
  # Convert to numeric and remove incomplete rows
  outcome_data_small[, 3] <- suppressWarnings(as.numeric(outcome_data_small[, 3]))
  outcome_data_small <- na.omit(outcome_data_small)
  
  #Filter for selected state
  outcome_data_small <- outcome_data_small[outcome_data_small$State == state, ]
  
  #Reorder
  outcome_data_small <- outcome_data_small[order(outcome_data_small[,3], outcome_data_small[,1]),]
  
  if (num == 'best'){
    return(outcome_data_small[1,1])
  } else if (num == 'worst'){
    return(outcome_data_small[nrow(outcome_data_small),1])
  } else {
    return(outcome_data_small[num, 1])
  }
  
}

# Examples ----------------------------------------------------------------
rankhospital(state = "TX", outcome = "heart attack", "best") #Expect 'CYPRESS FAIRBANKS MEDICAL CENTER'
rankhospital("MD", "heart attack", "worst") #Expect 'HARFORD MEMORIAL HOSPITAL'
rankhospital("TX", "heart failure", 4) #Expect 'DETAR HOSPITAL NAVARRO'
rankhospital("NC", "heart attack", "worst")
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
