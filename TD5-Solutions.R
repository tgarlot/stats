# Corrélation linéaire
## Création de 2 vecteurs de données
vec1 <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
vec2 <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
## Les mettre dans un data frame
data1 = data.frame(vec1, vec2)
## Nommer les colonnes "X" et "Y"
colnames(data1) = c("X", "Y")
## Creer un nuage de points avec les données précédentes avec un titre pour le graph, un pour chacun des axes et des limites de valeurs
graph <- plot(data1$X, data1$Y, main= "titre", ylab= "Y", xlab= "X", ylim= c(2, 6), xlim= c(40,65))
##  Faire un test de correlation entre ces 2 variables
cor.test(data1$X,data1$Y)
## Calculer les coefficients de la droite de regression lineaire (a et b)
a <- cov(data1$X,data1$Y)/var(data1$X)
b <- mean(data1$Y)-a*mean(data1$X)
## Verifier les resultats avec une fonction permettant de trouver les parametres a et b
lm(data1$Y~data1$X)
## Ajouter la droite de regression lineaire sur le nuage de points
droite <- lm(data1$Y~data1$X)
graph+abline(droite)


# Graphique
## Refaire le graphique en changeant:
### le titre et l'écrire en jaune. Augmenter sa taille à 2 fois la taille normale
### la couleur des points en vert
### la taille des points (les grossir d'un facteur 3)
### le symbole des points (triangle inversé 25)
graph2 <- plot(data1$X, data1$Y, main= "Nouveau titre", col.main= "yellow", ylab= "Y", xlab= "X", ylim= c(2, 6), xlim= c(40,65), col="green", pch=25, cex=3, cex.main= 2)
graph2+abline(droite, col="blue")