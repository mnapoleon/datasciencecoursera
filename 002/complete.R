complete <- function(directory, id = 1:332) {
  all_files <- list.files(directory, full.names=TRUE)
  data <- data.frame()
  collist <- c('sulfate', 'nitrate')
  files <- numeric(length(id))
  nobs <- numeric(length(id))
  j <- 1
  for (i in id) {
    data <- read.csv(all_files[i])
    files[j] <- i
    nobs[j] <- nrow(data[complete.cases(data[collist]), collist])
    j <- j + 1
  }
  newFrame <- data.frame(files, nobs)
}