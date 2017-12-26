pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_list <- paste0(directory, '/', list.files('specdata'))
  tables <- lapply(file_list, read.csv)
  combined.df <- do.call(rbind, tables)
  mean(combined.df[combined.df$ID %in% id, pollutant], na.rm = T)
}

pollutantmean(directory = 'specdata', pollutant = 'sulfate', id = 1:10)
pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
