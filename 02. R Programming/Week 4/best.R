# Function ----------------------------------------------------------------
best <- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
  outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
  outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
  
  ## Check that state and outcome are valid
  if(!(state %in% unique(outcome_data$State))){
    stop('invalid state')
  }
  
  if(!(outcome %in% c('heart attack', 'heart failure', 'pneumonia'))){
    stop('invalid outcome')
  }
  
  ## Return hospital name in that state with lowest 30-day death
  outcome_data_sorted <- if(outcome == 'heart attack'){
    outcome_data[with(outcome_data, order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)), ]
  } else if (outcome == 'heart failure'){
    outcome_data[with(outcome_data, order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)), ]
  } else if (outcome == 'pneumonia'){
    outcome_data[with(outcome_data, order(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)), ]
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcome_data_sorted <- outcome_data_sorted[outcome_data_sorted$State == state, ]
  outcome_data_sorted$Hospital.Name[1]
}

# Examples ----------------------------------------------------------------
best("TX", "heart attack")

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
