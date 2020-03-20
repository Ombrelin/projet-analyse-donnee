#==================================#
#                                  #
#       Lecture des données        #
#                                  #
#==================================#

x_matrix <- read.csv("petrole.csv", header = T, sep = ";", row.names = 1); # parse csv file (with ; separator) into matrix

#==================================#
#                                  #
#       Informations basiques      #
#                                  #
#==================================#

message("Summary")
summary(x_matrix); # summary


message("Covariance")
print(cov(x_matrix)); # covariance

message("Columns : "); # number of columns
ncol(x_matrix)
message("Rows : "); # number of rows
nrow(x_matrix);

#==================================#
#                                  #
#    Données centrées réduites     #
#                                  #
#==================================#

centree_reduite <- scale(x_matrix, center = T, scale = T);

#==================================#
#                                  #
# Analyse en composante principale #
#                                  #
#==================================#

# Valeurs propres
propres <- eigen(cor(centree_reduite));
valeursPropres <- propres$values;
vecteursPropres <- propres$vectors;

# Graphique des valeurs propres (éboulis et coude)
png(filename = "eboulis.png"); # start printing plot to png image
plot(1:length(valeursPropres), valeursPropres, type = "b");
dev.off(); # end printing

# Composantes principales
data_acp <- centree_reduite %*% vecteursPropres;

message("Vecteurs propres")
print(vecteursPropres);
message("Valeurs propres")
print(valeursPropres);

composante_principale_1 <- data_acp[,1];
composante_principale_2 <- data_acp[,2];

totalInfo <- sum(valeursPropres, na.rm = FALSE);
qte <- (valeursPropres[1] + valeursPropres[2]) / totalInfo;
message("Quantité d'information avec deux composantes : ", toString(qte * 100),"%");

if (qte < 0.8) {
  composante_principale_3 <- data_acp[, 3]
  qte <- qte + valeursPropres[3];
  message("Ajout d'une troisième composante pour améliorer la quantité d'information : ", toString(qte))
  troisComposantes <- true;
} else {
  message("On ne séléctionne que les deux première composantes principales car elles contiennent à elles seules plus de 80% des informations");
  troisComposantes <- false;
}


# Cercle de correlation
# Calcule de la correlation entre chaque variable et les composantes principales
cor1 <- cor(composante_principale_1,centree_reduite);
cor2 <- cor(composante_principale_2,centree_reduite);
png(filename = "cercle_de_correlation.png"); # start printing plot to png image
plot(cor1, cor2, xlim = c(-1, +1), ylim = c(-1, +1))
abline(h = 0, v = 0)
text(cor1, cor2, labels = colnames(data_acp))
dev.off(); # end printing

# Graphe 2D
png(filename = "graphe2D.png"); # start printing plot to png image
plot(composante_principale_1, composante_principale_2)
text(composante_principale_1, composante_principale_2, labels = rownames(data_acp))
abline(h = 0, v = 0)
dev.off(); # end printing