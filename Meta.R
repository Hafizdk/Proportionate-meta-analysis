rm(list = ls())

library("rstudioapi")
setwd(dirname(getActiveDocumentContext()$path))
Path <- getwd()

library(meta)
library(readxl)

#-------------------------------------------------------------------------------
Meta <- read_excel(paste0(Path,"/Meta.xlsx"))
m.prop <- metaprop(event = Event, n = Total, studlab = StudyID, subgroup = Animal, 
                   subgroup.name = "Animal" ,data = Meta)

windows()
forest(m.prop, 
             sortvar = TE,
             prediction = TRUE, 
             print.tau2 = FALSE,
             leftcols = c("studlab", "Event", "Total"),
             leftlabs = c("Author", "Event", "Total"))
