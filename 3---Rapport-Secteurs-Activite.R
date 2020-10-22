
x_matrix <- read.csv("csv/generated/year-activity-format.csv", header = T, sep = ";", row.names = 1)

## Nombre de colonne

ncol(x_matrix)

## Nombre de ligne

nrow(x_matrix)

## Affichage des 10 premières lignes (pour uniquement 2 colonnes)

x_matrix[1:10,1:2]


# Informations basiques
## Résumé (pour uniquement 2 colonnes)
summary(x_matrix[,1:2])

## Covariance (pour uniquement 2 colonnes)
cov(x_matrix[,1:2])


## Variance (pour uniquement 2 colonnes)
var(x_matrix[,1:2]);


## Corrélation (pour uniquement 2 colonnes)
cor(x_matrix[,1:2])

# Données centrées réduites
centree_reduite <- scale(x_matrix, center = T, scale = T);

summary(centree_reduite[,1:2])

## Covariance (pour uniquement 2 colonnes)

cov(centree_reduite[,1:2])


## Variance (pour uniquement 2 colonnes)
var(centree_reduite[,1:2]);

## Corrélation (pour uniquement 2 colonnes)
cor(centree_reduite[,1:2])

# Analyse en composante principale

## Valeurs propres
propres <- eigen(cor(centree_reduite));
valeursPropres <- propres$values;
vecteursPropres <- propres$vectors;


## Graphique des valeurs propres (éboulis et coude)
plot(1:length(valeursPropres), valeursPropres, type = "b");

## Composantes principales
data_acp <- centree_reduite %*% vecteursPropres;
composante_principale_1 <- data_acp[, 1];
composante_principale_2 <- data_acp[, 2];
totalInfo <- sum(valeursPropres, na.rm = FALSE);
qte <- (valeursPropres[1] + valeursPropres[2]) / totalInfo;
message("Quantité d'information avec deux composantes : ", toString(qte * 100),"%");
troisComposantes <- FALSE;
if (qte < 0.8) {
  composante_principale_3 <- data_acp[, 3]
  qte <- qte + valeursPropres[3];
  message("Ajout d'une troisième composante pour améliorer la quantité d'information : ", toString(qte))
  troisComposantes <- TRUE;
} else {
  message("On ne séléctionne que les deux première composantes principales car elles contiennent à elles seules plus de 80% des informations");
  troisComposantes <- FALSE;
}

## Cercle de corrélation

cor1 <- cor(composante_principale_1,centree_reduite);
cor2 <- cor(composante_principale_2,centree_reduite);

# Correlation 1 - 2
plot(cor1, cor2, xlim = c(-1, +1), ylim = c(-1, +1))
abline(h = 0, v = 0)
text(cor1, cor2, labels = colnames(x_matrix))

if(troisComposantes){
  cor3 <- cor(composante_principale_3, centree_reduite);
  # Correlation 3 - 1
  plot(cor1, cor2, xlim = c(-1, +1), ylim = c(-1, +1))
  abline(h = 0, v = 0)
  text(cor1, cor2, labels = colnames(x_matrix))

  # Correlation 3 - 2
  plot(cor1, cor2, xlim = c(-1, +1), ylim = c(-1, +1))
  abline(h = 0, v = 0)
  text(cor1, cor2, labels = colnames(x_matrix))
}

## Graphe 2D
# Graphe 1 - 2
plot(data_acp[, 1], data_acp[, 2])
text(data_acp[, 1], data_acp[, 2], labels = rownames(data_acp))
abline(h = 0, v = 0)

if(troisComposantes){
  # Graphe 3 - 1
  plot(data_acp[, 1], data_acp[, 3])
  text(data_acp[, 1], data_acp[, 3], labels = rownames(data_acp))
  abline(h = 0, v = 0)

  # Graphe 3 - 2
  plot(data_acp[, 3], data_acp[, 2])
  text(data_acp[, 3], data_acp[, 2], labels = rownames(data_acp))
  abline(h = 0, v = 0)

}