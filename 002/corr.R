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