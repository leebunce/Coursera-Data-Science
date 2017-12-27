# Week 4 Project - Plot 5

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 5 --------------------------------------------------------------
car <- combined %>%
  filter(fips == "24510",
         type == 'ON-ROAD') %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))

ggplot(car, aes(x = year, y = Total)) +
  geom_point() +
  geom_line() +
  labs(title = 'Total emissions from Motor Vehicles in Baltimore since 1999')

ggsave(filename = 'plot 5.png')
