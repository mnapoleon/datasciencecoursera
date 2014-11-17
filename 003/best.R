best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  state_levels <- levels(as.factor(data$state))
  outcome_levels <- c("heart attack", "heart failure", "pneumonia")

  if (!state %in% state_levels) {
    stop("invalid state")
  }
  
  if (!outcome %in% outcome_levels) {
    stop("invalid outcome")
  }
  
}