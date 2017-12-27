# Week 4 Project - Plot 4

# Data --------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combined <- left_join(NEI, SCC, by = 'SCC')

# Packages ----------------------------------------------------------------
library(tidyverse)

# Question 4 --------------------------------------------------------------
coal <- combined %>%
  filter(grepl('Coal', EI.Sector)) %>% 
  group_by(year) %>% 
  summarise(Total = sum(Emissions))
  
ggplot(coal, aes(x = year, y = Total)) +
  geom_point() +
  geom_line() +
  labs(title = 'Total emissions of Coal related emissions since 1999')

ggsave(filename = 'plot 4.png')
