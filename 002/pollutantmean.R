pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_files <- list.files(directory, full.names=TRUE)
  data <- data.frame()
  for (i in id) {
    data <- rbind(data, read.csv(all_files[i]))
  }
  colMeans(data[pollutant], na.rm=TRUE)
}