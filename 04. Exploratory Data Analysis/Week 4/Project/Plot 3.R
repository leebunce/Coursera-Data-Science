# Week 4 Project - Plot 3

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 3 --------------------------------------------------------------
types <- NEI %>%
  filter(fips == "24510") %>% 
  group_by(year, type) %>% 
  summarise(Total = sum(Emissions))
  
ggplot(types, aes(x = year, y = Total, group = type, colour = type)) +
  geom_point() +
  geom_line() +
  labs(title = 'Total emissions for Baltimore by type since 1999')

ggsave(filename = 'plot 3.png')
