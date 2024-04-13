# Création d'objets
## Créer une liste (vecteur) de nombres entiers vec1
vec1 <- c(4,7,23,8)
## Voir l'objet que l'on vient de créer (2 manières)
str(vec1)
vec1
## Calculer du nombre d'élément de vec1
length(vec1)
## Calculer de la moyenne de vec1
mean(vec1)
## Calculer de la médiane de vec1
median(vec1)
## Calculer le 3ème quartile de vec1
quantile(vec1,0.75)
## Déterminer la valeur minimale de vec1
min(vec1)
## Déterminer la valeur maximale de vec1
max(vec1)
## Calculer toutes les données de vec1
sum(vec1)
## Créer un 2ème vecteur vec2 à partir de vec1
vec2 <- vec1
## Créer un 3ème vecteur vec3 en fusionnant vec1 et vec2 et l'afficher
vec3 <- c(vec1,vec2)
str(vec3)
## Faire un résumé des différentes statistiques de vec3
summary(vec3)

# Commande globales
## Lister tous les objets créés (dans ce cas, il y en aura 3, vec1, vec2 et vec3)
ls()
## Trier les éléments de vec1 de manière ascendante puis descendante
sort(vec1)
sort(vec1, decreasing = TRUE)
## Supprimer vec1
rm(vec1)
## Supprimer vec2 et vec3 en une commande (qui supprime TOUS les objets)
rm(list=ls())
# ---------------------------------------------------------------------------------------

# On re-crée vec1 - on l'a supprimé ci-dessus...
vec1 <- c(4,7,23,8,9)

# Extraire les éléments d'une liste par leur position
## Extraire l'élément en 2ème position (7)
vec1[2]
## Extraire les éléments en 2ème et 3ème positions (7 23)
vec1[c(2,3)]
## Extraire les éléments de la 2ème à la 4ème position (7 23 8)
vec1[2:4]
## Extraire tous les éléments de vec1 sauf le 2ème (4 23 8 9)
vec1[-c(2)]
## Extraire tous les éléments sauf ceux de la 2ème à la 4ème positions (4 9)
vec1[-(2:4)]

# Extraire les éléments d'une liste à l'aide de filtre sur leurs valeurs
## Extraire tous les éléments dont la valeur est plus grande que 10 (23)
vec1[vec1 > 10]
## Extraire tous les éléments dont la valeur est comprise entre 7 ET 10 inclus (7 8 9)
vec1[vec1 >=7 & vec1 <= 10]
## Extraire tous les éléments dont la valeur est inférieure à 7 OU supérieure à 10 (4 23)
vec1[vec1 < 7 | vec1 > 10]

# Trouver les positions des éléments en fonction de certains critères
## Trouver la position des éléments dont la valeur est plus grande que 10 (3)
which(vec1 > 10)
## Trouver la position des éléments dont la valeur est comprise entre 7 ET 10 inclus (2 4 5 )
which(vec1 >=7 & vec1 <= 10)
## Trouver la position des éléments dont la valeur est inférieure à 7 OU supérieure à 10 (1 3)
which(vec1 < 7 | vec1 > 10)
## Trouver la position des éléments dont la valeur est égale à 7 (2)
which(vec1 == 7)

# Composition de fonction avec les filtres
##Trouver la somme des 3 premiers éléments (34)
sum(vec1[1:3])
## Trouver la moyenne sans prendre en compte les éléments aux positions 1,4 et 5 (15)
mean(vec1[-c(1,4,5)])