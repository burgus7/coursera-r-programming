rm(list = ls())

temp <- function(directory, id = 1:332) {
  x <- data.frame("id" = integer(), 
                  "nobs" = numeric())
  for (i in id) {
    #set current file
    temp <- list.files(directory, full.names = T)[i]
    currentfile <- read.csv(temp)
    nitr <- currentfile$nitrate
    sulf <- currentfile$sulfate
    nat.nitr <- is.na(nitr)
    nat.sulf <- is.na(sulf)

    counter <- 0
    
    for (j in 1:length(nitr)) {
      if (!nat.nitr[j]){
        if (nat.nitr[j]==nat.sulf[j]) {
          counter <- counter + 1
        }
      }
    }

    #add to data frame
    temp <- data.frame(i, counter)
    names(temp) <- c("id", "nobs")
    x <- rbind(x, temp)
  }
  fin <<- x
}

complete <- function(directory, id = 1:332){
  temp(directory, id)
  print (fin)
}
