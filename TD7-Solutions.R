#TD7

#Exercice 1
#Dans une experience d'apprentissage, un psychologue demande à un groupe de 15 sujets de realiser 
#une tache sensori-motrice comportant 25 exercices. La tache est repetee 4 fois pour chaque sujet. 
#Le psychologue mesure le nombre d'exercices echoues par les sujets au 1er, 2eme, 3eme et 4eme essai 
#de cet apprentissage.
#Le psychologue fait l'hypothese que les participants apprennent au fur et a mesure des essais. 
#Autrement dit, il fait l'hypothese que les participants feront en moyenne moins d'erreurs a l'essai 4 
#comparativement a l'essai 1.

#Importer, et nommer, le fichier de donnees disponible sur Moodle (data_sensorimot)
sensorimot <- read.table(file.choose(), header=T, sep=";", dec=",")

#Determiner le t-test a realiser pour tester l'hypothese du psychologue, ainsi que la lateralite de l'hypothese.
#Il faut realiser un t-test pour echantillon apparie. Il s'agit d'une hypothese unilaterale.

#Calculer le t observe permettant de tester l'hypothese du chercheur (a l'aide de la formule sur Moodle)
#solution1: decomposer en plusieurs etapes
diff1 <- sensorimot$essai1-sensorimot$essai4
moy_diff1 <- mean(diff1)
sd_diff1 <- sd(diff1)
tobs1 <- moy_diff1/(sd_diff1/sqrt(length(diff1)))
#solution2: decomposer en une seule ligne
tobs1bis <- mean(sensorimot$essai1-sensorimot$essai4)/(sd(sensorimot$essai1-sensorimot$essai4)/sqrt(length(sensorimot$essai1)))

#Trouver le t critique a l'aide de la fonction qt(p=X , df=X , lower.tail=F)
#en remplaçant les X par les valeurs adaptee a l'experience et a l'hypothese
tcrit1 <- qt(p=.05, df=14, lower.tail=F) #unilaterale donc p=.05 sur un seul cote de la distribution; 14 ddl

#Calculer les bornes de l'intervalle de confiance a 95% (a l'aide de la formule sur Moodle)
ICinf1 <- moy_diff1-tcrit1*(sd_diff1/sqrt(length(diff1)))
ICsup1 <- moy_diff1+tcrit1*(sd_diff1/sqrt(length(diff1)))

#Verifier ces informations a l'aide de la fonction du t-test
t.test(sensorimot$essai1,sensorimot$essai4, paired=T, alternative="greater", var.equal=T) #"greater" car hypothese: essai1 > esssai 4
t.test(sensorimot$essai4,sensorimot$essai1, paired=T, alternative="less", var.equal=T) #ou "less" car hypothèse: essai4 < essai 1

#Interpreter le resultat en concluant quant a l'hypothese du psychologue.
#Rediger les resultats en normes APA.
#En considerant H0 vraie, c'est a dire s'il n'existe pas de difference significative entre l'essai 1 et 4, la probabilite d'observer la difference que l'on observe dans l'echantillon est inferieure a 1%
#On peut donc conclure avec moins de 1% de risque de se tromper, que les participants font significativement moins d'erreurs a l'essai 4 (M=9.0, SD=3.2) qu'a l'essai 1 (M=17.7, SD=3.0), t(14)=6.76, p<.001.
#L'intervalle de confiance A 95% confirme que 0 n'est pas une difference probable entre les conditions.

#Exercice 2
#Un enseignant desire comparer deux methodes d’enseignement de la methodologie en premiere annee.
#Pour la premiere methode, classique, l’enseignant corrige les exercices au tableau. 
#Pour la seconde, individualisee, les étudiants travaillent par petits groupes de 5 etudiants et discutent 
#entre eux des reponses aux questions.  L’enseignant compare ensuite les moyennes a l’examen entre les 
#etudiants ayant suivi les deux methodes.  
#L'enseignant souhaite determiner laquelle des deux methodes d'enseignement est la plus efficace.

#Importer, et nommer, le fichier de donnees disponible sur Moodle (data_enseignement)
methode <- read.table(file.choose(), header=T, sep=";", dec=",")

#Faire les memes etapes qu'a l'exercice 1 (calcul du tobs, tcrit, intervalle de confiance, fonction t-test, interpretation)
#pour tester l'hypothese de l'enseignant. 
#Il faut realiser un t-test pour echantillon independant Il s'agit d'une hypothese bilaterale.

#solution1: decomposer en plusieurs etapes
moy_classique <- mean(methode$classique)
moy_individual <- mean(methode$individualisee)
diff2 <- moy_classique-moy_individual
varN_classique <- var(methode$classique)/length(methode$classique)
varN_individual <- var(methode$individualisee)/length(methode$individualisee)
denominateur1 <- sqrt(varN_classique+varN_individual)
tobs2 <- diff2/denominateur1
#solution2: decomposer en une seule ligne
tobs2bis <- (mean(methode$classique)-mean(methode$individualisee))/sqrt((var(methode$classique)/length(methode$classique))+(var(methode$individualisee)/length(methode$individualisee)))

tcrit2 <- qt(p=.025, 40, lower.tail=F) #bilaterale donc p=.025 sur un seul cote de la distribution; 40 ddl
ICinf2 <- diff2-tcrit2*denominateur1 #si denominateur1 non cree avant: sqrt((var(methode$classique)/length(methode$classique))+(var(methode$individualisee)/length(methode$individualisee)))
ICsup2 <- diff2+tcrit2*denominateur1
t.test(methode$classique,methode$individualisee, paired=F, alternative="two.sided", var.equal=T)
#En considerant H0 vraie, c'est a dire s'il n'existe pas de difference significative entre les deux methodes d'apprentissage, la probabilite d'observer la difference que l'on observe dans l'echantillon est inferieure a 1%
#On peut donc conclure avec moins de 1% de risque de se tromper, que les etudiants ayant suivi la methode classique ont eu une note significativement superieure (M=12.9, SD=2.9) a celle obtenue par les etudiants ayant suivi la methode individualisee (M=10.3, SD=3.1), t(40)=2.78, p=.008.
#L'intervalle de confiance A 95% confirme que 0 n'est pas une difference probable entre les groupes.
