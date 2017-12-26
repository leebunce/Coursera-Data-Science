corr <- function(directory, threshold = 0){
  file_list <- paste0(directory, '/', list.files(directory))
  tables <- lapply(file_list, read.csv)
  combined.df <- do.call(rbind, tables)
  combined.df <- combined.df[complete.cases(combined.df),]
  
  table <- data.frame(id = NA, nobs = NA)
  monitors <- unique(combined.df$ID)
  
  for(i in seq_along(monitors)){
    table[i, 'id'] <- monitors[i]
    temp <- combined.df[combined.df$ID == monitors[i], ]
    table[i, 'nobs'] <- nrow(temp)
  }
  
  above_threshold <- table[table$nobs >= threshold, ]$id
  
  # now finally use this vector with sapply to filter data and correlate
  correlate = function(x){
    data <- combined.df[combined.df$ID == x, ]
    cor(data$sulfate, data$nitrate)
  }
  
  output <- sapply(X = above_threshold, FUN = correlate)
  output
}

corr("specdata", 150)
corr("specdata", 5000)

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
