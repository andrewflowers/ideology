# DIME analysis

setwd("~/ideology/")

require(readr)
require(dplyr)
require(ggplot2)

# Load data
rawCandScores <- read_csv("candidate_cfscores_st_fed_1979_2012.csv.zip")

# Just Presidential candidates
presCandsScores <- rawCandScores %>% 
  filter(seat=="federal:president")

# Sample analysis -- Presidential candidates by descending number of total givers
presCandsScores %>% 
  arrange(desc(num.givers.total)) %>% 
  select(cycle, Name, num.givers.total)

# Number of unique cylces and candidates
presCandsScores$cycle <- as.factor(presCandsScores$cycle)
table(presCandsScores$cycle)

presCands <- unique(presCandsScores$Name) 
presCycles <- seq(1980, 2012, 4)

# Republican Presidential candidates ideology (as measured by cfscore) over time
presCandsScores %>% 
  filter(Party==200, cycle %in% presCycles) %>% 
  ggplot(aes(cycle, cfscore)) + 
  geom_boxplot() +
  ggtitle("Republican Presidential Candidates...\n ...Are Getting More Conservative")
  

