rm(list=ls())

pollutantmean <- function(directory, pollutant, id = 1:332) {
  mydata <- numeric(0)
  for (i in id) {
    currentfile <- list.files(directory, full.names = T) [i]
    temp <- read.csv(currentfile, T)
    mydata <- c(mydata, temp[[pollutant]])
  }
  mydata <- mydata[!is.na(mydata)]
  ans <- mean(mydata)
  print(ans)
}
