
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files <- paste(directory, "/", str_pad(id, 3, pad = "0"), ".csv", sep = "")
    
    monitors <- read.csv(files[1])
    
    for(f in files[-1]) {
        monitors <- rbind(monitors, read.csv(f))
    }
    
    good <- monitors[!is.na(monitors[pollutant]), ]
    mean(good[[pollutant]])
}
