pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_files <- list.files(directory, full.names=TRUE)
  data <- data.frame()
  for (i in id) {
    data <- rbind(data, read.csv(all_files[i]))
  }
  colMeans(data[pollutant], na.rm=TRUE)
}

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


corr <- function(directory, threshold=0) {
  all_files <- list.files(directory, full.names=TRUE)
  num_files <- length(all_files)
  mycor <- numeric()
  for (i in 1:num_files) {
    completeData <- complete(directory, i)
    if (completeData$nobs > threshold) {
      data <- read.csv(all_files[i])
      mycor <- c(mycor, cor(x=data[,2], y=data[,3], use="complete.obs"))
    } 
  }
  mycor
}