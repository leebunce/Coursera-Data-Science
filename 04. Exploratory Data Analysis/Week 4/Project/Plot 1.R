# Week 4 Project - Plot 1

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 1 --------------------------------------------------------------
total <- NEI %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

png(filename = 'plot1.png')
plot(total, main = 'Total emissions since 1999', xlim = c(1999,2008), pch = 19)
lines(total)
dev.off()
