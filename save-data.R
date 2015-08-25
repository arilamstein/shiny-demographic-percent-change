library(choroplethr)
library(choroplethrMaps)
library(acs)
library(ggplot2)

state_demo_2010 = get_state_demographics(2010)
state_demo_2013 = get_state_demographics(2013)
state_demo_all = merge(state_demo_2010, 
                       state_demo_2013, 
                       by="region")

?save
save(state_demo_all, file="state_demo_all.rdata") 
