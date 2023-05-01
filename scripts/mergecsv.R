#Code to merge model output (independent files per MPA) into one .csv file. Output lives in processeddata/,
library(tidyverse)
library(here)

#create IPSL csv
IPSLfiles <- list.files(path = here("data/rawdata/IPSL"), pattern = '.csv', full.names = TRUE)
IPSLmpa <- map_df(IPSLfiles, ~read.csv(.x) %>% mutate(File = basename(.x)))
write.csv(IPSLmpa, here("data/processeddata/IPSLmpa.csv"))

#create GFDL csv
GFDLfiles <- list.files(path = here("data/rawdata/GFDL"), pattern = '.csv', full.names = TRUE)
GFDLmpa <- map_df(GFDLfiles, ~read.csv(.x) %>% mutate(File = basename(.x)))
write.csv(GFDLmpa, here("data/processeddata/GFDLmpa.csv"))

#create HADLEY csv
HADLEYfiles <- list.files(path = here("data/rawdata/HADLEY"), pattern = '.csv', full.names = TRUE)
HADLEYmpa <- map_df(HADLEYfiles, ~read.csv(.x) %>% mutate(File = basename(.x)))
write.csv(HADLEYmpa, here("data/processeddata/HADLEYmpa.csv"))


