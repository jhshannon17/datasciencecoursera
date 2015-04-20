
corr <- function(directory, threshold = 0) {
    monitors <- data.frame(Date = as.Date(character()),
                           sulfate = numeric(),
                           nitrate = numeric(),
                           ID = integer(),
                           stringsAsFactors=FALSE)
    
    com <- complete(directory)
    com <- com[com["nobs"] > threshold, ]

    nums <- c("nitrate", "sulfate")
    cors <- numeric()
    
    if(nrow(com) > 0) {
        files <- paste(directory, "/", str_pad(com[["id"]], 3, pad = "0"),
                       ".csv", sep = "")
        for(f in files) {
            monitor <- read.csv(f)
            cur <- cor(monitor[nums], use = "complete.obs")
            cors <- c(cors, cur[1,2])
        }
    }
    cors
}
