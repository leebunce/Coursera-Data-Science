# Week 4 Project - Plot 6

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 5 --------------------------------------------------------------
car <- combined %>%
  filter(fips %in% c("24510", "06037"),
         type == 'ON-ROAD') %>% 
  group_by(year, fips) %>% 
  summarise(Total = sum(Emissions))

ggplot(car, aes(x = year, y = Total, group = fips, colour = fips)) +
  geom_point() +
  geom_line() +
  labs(title = 'Motor Vehicle emissions in Baltimore and LA since 1999')

ggsave(filename = 'plot 6.png')
