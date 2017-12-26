#rankall

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that num and outcome are valid
  if (!(outcome %in% c('heart attack', 'heart failure', 'pneumonia'))) {
    stop('invalid outcome')
  }
  
  if (!(num %in% c('best', 'worst') | !is.integer(num))){
    stop('invalid num')
  }
  
  # Select relevant columns
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
  
  #Reorder
  outcome_data_small <- outcome_data_small[order(outcome_data_small[,3], outcome_data_small[,1]),]
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
    states <- sort(unique(outcome_data$State)) #for lapply
  
  # Function
    get_rank <- function(state, rank){
      
      data <- outcome_data_small[outcome_data_small$State == state, ]
      
      if (rank == 'best'){
        return(data[1,1])
      } else if (rank == 'worst'){
        return(data[nrow(data),1])
      } else if (rank > nrow(data)){
        return(NA)
      }
      else {
        return(data[rank, 1])
      }
    }
    
    # Apply function
    answer <- lapply(X = states, FUN = get_rank, rank = num)
    
    return(data.frame(hospital = unlist(answer), state = states))
    
}

rankall(outcome = "heart attack", 20)
rankall("pneumonia", "worst")
