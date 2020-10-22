
# Lecture des données
x_matrix <- read.csv("CSV/generated/f&h-t-format.csv", header = T, sep = ";", row.names = 1)

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


## Correlation (pour uniquement 2 colonnes)

cor(x_matrix[,1:2])


# Données centrées réduites


centree_reduite <- scale(x_matrix, center = T, scale = T);



summary(centree_reduite[,1:2])

## Covariance (pour uniquement 2 colonnes)

cov(centree_reduite[,1:2])


## Variance (pour uniquement 2 colonnes)

var(centree_reduite[,1:2]);


## Correlation (pour uniquement 2 colonnes)

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


## Cercle de correlation
cor1 <- cor(composante_principale_1,centree_reduite);
cor2 <- cor(composante_principale_2,centree_reduite);
plot(cor1, cor2, xlim = c(-1, +1), ylim = c(-1, +1))
abline(h = 0, v = 0)
text(cor1, cor2, labels = colnames(x_matrix))


## Graphe 2D

plot(data_acp[, 1], data_acp[, 2])
text(data_acp[, 1], data_acp[, 2], labels = rownames(data_acp))
abline(h = 0, v = 0)

