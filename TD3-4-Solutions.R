#Matrix
## Créer une matrice matvide vide contenant 2 colonnes et 4 lignes
matvide <- matrix(ncol = 2,nrow = 4)
## Créer un vecteur vec1 avec les valeurs (1,2,3,4,5,6)
vect1 <- c(1,2,3,4,5,6)
## Créer une matrice mat1 avec 2 colonnes et 3 lignes à partir de vec1
mat1 <- matrix(vect1,ncol = 2, nrow = 3)
## Sélectionner la valeur de la 2ème ligne et 2ème colonne (5)
mat1[2,2]

#Dataframe
## Créer un vecteur vect2 avec les valeurs "petit","petit","moyen","moyen","grand","grand")
vect2 <- c("petit","petit","moyen","moyen","grand","grand")
## Créer un dataframe data1 contenant les 2 vecteurs vec1 et vec2
data1 = data.frame(vect1, vect2)
## Sélectionner la valeur de la 3ème ligne et 2ème colonne (moyen)
data1[3,2]
## Renommer les colonnes du dataframe data1 : nombre et taille et vérifier le résultat
colnames(data1) = c("nombre", "taille")
data1
## Renommer la première colonne du dataframe data1 en nombre2 et vérifier le résultat
colnames(data1)[1] = "nombre2"
data1
## Trouver la valeur de l'élément de la ligne 4 et de la colonne "taille : 
data1[4,"taille"]
## Trouver les éléments de la colonne 2 du dataframe data1
data1[,"taille"]
## Trouver les éléments de la ligne 6 du dataframe data1
data1[6,]
## Calculer la moyenne de la colonne "nombre2" de 2 manières différentes
mean(data1[,"nombre2"])
mean(data1$nombre2)
## Calculer la moyenne de la colonne "nombre2" sur les lignes 1, 3, 5
mean(data1[c(1,3,5), "nombre2"])
## Ajouter une colonne nommée "age" dans le dataframe data1 correspondant au vecteur(1:6) :
data1$age = 1:6
## Ajouter et nommer une colonne "somme" dans le dataframe data1 correspondant au produit des colonnes "nombre2" et "age"
data1$somme = data1$nombre2+data1$age
## Dupliquer la colonne "somme" en lui donnant le nom "somme2"
data1$somme2 = data1$somme
## Trouver les statistiques descriptives de data1
summary(data1)
## ReTrouver les statistiques descriptives des colonnes 2,3,4,5 de data1
summary(data1[,c(2,3,4,5)])

#Statistiques bi-variées
## Créer 2 nouveaux vecteurs vec3 (1,4,6,8) et vec4 (1,3,5,7)
vec3 <- c(1,4,6,8)
vec4 <- c(1,3,5,7)
## Créer un dataframe data2 à partir de ces 2 vecteurs
data2 = data.frame(vec3,vec4)
## Renommer les colonnes: la première "X", la deuxième "Y"
colnames(data2)=c("X","Y")
## Calculer la moyenne de la première colonne de data2
mean(data2[,"X"])
## Calculer la somme des éléments de la 2ère colonne
sum(data2[,"Y"])
sum(data2$Y)
## Calculer la variance de X et de Y
var(data2$X)
var(data2$Y)
## Calculer l'écart type de X et Y de 2 façons différentes
sd(data2$X)
sqrt(var(data2$Y))
## Calculer la covariance de data2
cov(data2)
## Calculer le coefficient de correlation de Pearson de 2 manières (fonction + formule)
cor(data2$X, data2$Y) 
cov(data2)/(sd(data2$X)*sd(data2$Y))
## Représenter graphiquement la relation entre les 2 variables X et Y
plot(data2$X,data2$Y)
## Ajouter la droite de régression sur le graphique
ab=lm(data2$Y~data2$X)
plot(data2$X,data2$Y)+abline(ab)
## Calculer les coefficients de la droite a et b
a=cov(data2$X, data2$Y)/var(data2$X)
b=mean(data2$Y)-a*mean(data2$X)