complete <- function(directory, id) {
  file_list <- paste0(directory, '/', list.files(directory))
  tables <- lapply(file_list, read.csv)
  combined.df <- do.call(rbind, tables)
  
  table <- data.frame(id = NA, nobs = NA)
  
  for(i in seq_along(id)){
    table[i, 'id'] <- id[i]
    temp <- combined.df[combined.df$ID == id[i], ]
    table[i, 'nobs'] <- sum(complete.cases(temp))
  }
  
  table
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
