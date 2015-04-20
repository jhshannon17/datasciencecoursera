
complete <- function(directory, id = 1:332) {
    out <- data.frame(id = integer(),
                      nobs = integer(),
                      stringsAsFactors=FALSE)
    
    for(i in id) {
        file <- paste(directory, "/", str_pad(i, 3, pad = "0"), ".csv", sep = "")
        monitor <- read.csv(file)
        com <- complete.cases(monitor)
        nobs <- length(com[com == T])
        
        out <- rbind(out, data.frame(id = i, nobs = nobs))
    }
    out
}
