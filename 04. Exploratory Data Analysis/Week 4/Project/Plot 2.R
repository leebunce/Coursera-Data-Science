# Week 4 Project - Plot 2

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 2 --------------------------------------------------------------
baltimore_total <- NEI %>%
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

png(filename = 'plot2.png')
plot(baltimore_total, main = 'Total emissions in Baltimore since 1999', xlim = c(1999,2008), pch = 19)
lines(baltimore_total)
dev.off()
