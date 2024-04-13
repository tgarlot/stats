#TD6

#Exercice 1
#Dans une experience d'apprentissage, un psychologue demande à un groupe de 15 sujets de realiser 
#une tache sensori-motrice comportant 25 exercices. La tache est repetee 4 fois pour chaque sujet. 
#Le psychologue mesure le nombre d'exercices echoues par les sujets au 1er, 2eme, 3eme et 4eme essai 
#de cet apprentissage. 

#Importer, et nommer, le fichier de donnees disponible sur Moodle (data_sensorimot)
sensorimot <- read.table(file.choose(), header=T, sep=";", dec=",")

#Creer un graphique en barre representant le nombre moyen d'echecs a chaque essai.
#Ajouter un titre au graphique
#Renommer les axes du graphique
#Nommer chaque barre
#Ajuster les limites de l'axe des ordonnees
moy_e1 <- mean(sensorimot$essai1)
moy_e2 <- mean(sensorimot$essai2)
moy_e3 <- mean(sensorimot$essai3)
moy_e4 <- mean(sensorimot$essai4)
moy_essai <- c(moy_e1, moy_e2, moy_e3, moy_e4)
graph_barres1 <- barplot(moy_essai, main="Nombre moyen d'echecs \n a chaque essai", ylab="Nombre moyen d'echecs", ylim=c(0,25), names.arg=c("essai 1", "essai 2", "essai 3", "essai 4"))
#Ajouter les barres d'erreurs correspondant a l'ecart-type a chaque essai
et_e1 <- sd(sensorimot$essai1)
et_e2 <- sd(sensorimot$essai2)
et_e3 <- sd(sensorimot$essai3)
et_e4 <- sd(sensorimot$essai4)
et_essai <- c(et_e1, et_e2, et_e3, et_e4)
arrows(graph_barres1, moy_essai+et_essai, graph_barres1, moy_essai-et_essai, code=3, angle=90, length=0.2)                        
#code=3 : type de barre d'erreur (flèches ou trait aux extrémités, 3 pour un trait)
#angle=90 : angle entre la barre d'erreur et le trait de l'extremité
#length=0.05: longueur du trait au bout des barres d'erreur

#Creer les boites a moustaches des essais 1 et 4
#Ajouter un titre au graphique
#Renommer les axes du graphique
#Nommer chaque boite
#Ajuster les limites de l'axe des ordonnees
graph_box1 <- boxplot(sensorimot$essai1, sensorimot$essai4, main="Nombre moyen d'echecs \n aux essais 1 et 4", ylab="Nombre moyen d'echecs", ylim=c(0,25), names=c("essai 1", "essai 2"))

#Exercice 2
#Un enseignant desire comparer deux methodes d’enseignement de la methodologie en premiere annee.
#Pour la premiere methode, classique, proposee aux etudiants du groupe 1, l’enseignant corrige les exercices 
#au tableau. Pour la seconde, individualisee, proposee aux etudiants du groupe 2, les étudiants travaillent 
#par petits groupes et discutent entre eux des reponses aux questions.  
#L’enseignant compare ensuite les moyennes a l’examen entre les etudiants ayant suivi les deux methodes.

#Importer, et nommer, le fichier de donnees disponible sur Moodle (data_enseignement)
methode <- read.table(file.choose(), header=T, sep=";", dec=",")

#Construire un graphique en barres complet representant la moyenne a l'examen pour chacune des methodes d'enseignement.
moy_classique <- mean(methode$classique)
moy_individual <- mean(methode$individualisee)
moy_methode <- c(moy_classique, moy_individual)
et_classique <- sd(methode$classique)
et_individual <- sd(methode$individualisee)
et_methode <- c(et_classique, et_individual)
graph_barres2 <- barplot(moy_methode, main="Note moyenne a l'examen en fonction \n de la methode d'enseignement", ylab="Note moyenne", ylim=c(0,20), names.arg=c("classique", "individualisee"))
arrows(graph_barres2, moy_methode+et_methode, graph_barres2, moy_methode-et_methode, code=3, angle=90, length=0.05)                        

#Construire les boites a moustaches de chaque methode, faire un graphique complet
graph_box2 <- boxplot(methode$classique, methode$individualisee, main="Distribution des notes a l'examen \n en fonction de la methode d'enseignement", ylab="Nombre d'echecs", ylim=c(0,25), names=c("classique", "individualisee"))

#Exercice 3
#Refaire les graphiques des exercices 1 et 2 en :
#Changeant la couleur des barres / boites
#Changeant la couleur du titre
#Changeant la taille du titre
#Changeant la couleur des barres d'erreur (pour les graphiques en barres)
graph_barres1 <- barplot(moy_essai, main="Nombre moyen d'echecs \n a chaque essai", ylab="Nombre moyen d'echecs", ylim=c(0,25), names.arg=c("essai 1", "essai 2", "essai 3", "essai 4"), col=c("#414272", "#595A84", "#717195", "#8889A7"), col.main= "goldenrod2", cex.main= 0.90)
arrows(graph_barres1, moy_essai+et_essai, graph_barres1, moy_essai-et_essai, code=3, angle=90, length=0.05, col="goldenrod2")                        

graph_barres2 <- barplot(moy_methode, main="Note moyenne a l'examen en fonction \n de la methode d'enseignement", ylab="Note moyenne", ylim=c(0,20), names.arg=c("classique", "individualisee"), col=c("rosybrown2", "rosybrown3"), col.main= "rosybrown4", cex.main= 0.70)
arrows(graph_barres2, moy_methode+et_methode, graph_barres2, moy_methode-et_methode, code=3, angle=90, length=0.05, col="grey50")                        

graph_box1 <- boxplot(sensorimot$essai1, sensorimot$essai4, main="Nombre moyen d'echecs \n aux essais 1 et 4", ylab="Nombre moyen d'echecs", ylim=c(0,25), names=c("essai 1", "essai 2"), col=c("#40A497", "#2B7C71"), col.main= "blue4", cex.main= 1.25)

graph_box2 <- boxplot(methode$classique, methode$individualisee, main="Distribution des notes a l'examen \n en fonction de la methode d'enseignement", ylab="Nombre d'echecs", ylim=c(0,25), names=c("classique", "individualisee"), col=c("coral", "coral3"), col.main= "red", cex.main= 0.75)
