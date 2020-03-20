onlyDep <- function(table,prob){
  df1 <- table[ , grepl("^[0-9]",colnames(rotate))]
  ind <- apply( df1 , 1 , function(x) any( x > 0 ) )
  df1[ ind , ]
  return(df1[ ind , ])
}

onlyReg <- function(table,prob){
  df1 <- table[ , grepl("^[A-Z]",colnames(rotate))]
  ind <- apply( df1 , 1 , function(x) any( x > 0 ) )
  df1[ ind , ]
  return(df1[ ind , ])
}

# region all
#bfgp <- read.csv("CSV/E-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyReg(rotate), file = 'CSV/generated/reg-e-t-format.csv')

#
# region men
#bfgp <- read.csv("CSV/H-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyReg(rotate), file = 'CSV/generated/reg-h-t-format.csv')
#
# region women
#bfgp <- read.csv("CSV/F-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyReg(rotate), file = 'CSV/generated/reg-f-t-format.csv')

# department all
#bfgp <- read.csv("CSV/E-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyDep(rotate), file = 'CSV/generated/dep-e-t-format.csv')
#
# department men
#bfgp <- read.csv("CSV/H-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyDep(rotate), file = 'CSV/generated/dep-h-t-format.csv')
#
# department women
#bfgp <- read.csv("CSV/F-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyDep(rotate), file = 'CSV/generated/dep-f-t-format.csv')

# all
#bfgp <- read.csv("CSV/F&H-T.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(onlyReg(rotate), file = 'CSV/generated/f&h-t-format.csv')

# Year / Activity
#bfgp <- read.csv("CSV/Année-Secteur.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(rotate, file = 'CSV/generated/year-activity-format.csv')

# Year / Activity / Men
#bfgp <- read.csv("CSV/Année-Secteur-Homme.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(rotate, file = 'CSV/generated/year-activity-men-format.csv')

# Year / Activity / Women
#bfgp <- read.csv("CSV/Année-Secteur-Femme.csv", sep = ";", header = T, row.name = 1)
#rotate <- apply(t(bfgp),2,rev)
#write.csv2(rotate, file = 'CSV/generated/year-activity-women-format.csv')

bfgp <- read.csv("CSV/Annee-4_best_industrie.csv", sep = ";", header = T, row.name = 1)
rotate <- apply(t(bfgp),2,rev)
write.csv2(rotate, file = 'CSV/generated/year-4-best-industry-men-women-format.csv')