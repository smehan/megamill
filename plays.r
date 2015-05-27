###########################################################
### Class to read in and munge history data
### exports data to an rds file for use in other classes
###########################################################

read.csv2(file="data/draw-history.numbers", sep=",", header = TRUE,
          stringsAsFactors=FALSE) #might want to think about first col being a date
#also need to think about win types which are presently a list. how to split for counts