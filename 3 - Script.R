# Title     : TODO
# Objective : TODO
# Created by: thomaslacaze
# Created on: 18/02/2020

#sink
#split !!!!!!!!!!!!!!!!!!!!!




onlyDep <- function(table,prob){
  df1 <- table[ , grepl("^.{2}[0-9]",colnames(rotate))]
  ind <- apply( df1 , 1 , function(x) any( x > 0 ) )
  df1[ ind , ]
  return(df1[ ind , ])
}

onlyReg <- function(table,prob){
  df1 <- table[ , grepl("^.{2}[A-Z]",colnames(rotate))]
  ind <- apply( df1 , 1 , function(x) any( x > 0 ) )
  df1[ ind , ]
  return(df1[ ind , ])
}

bfgp <- read.table("CSV/E-T.csv", sep = ";", header = T, row.name = 1)
rotate <- apply(t(bfgp),2,rev)
onlyDep(rotate)



