#################################################################################################################
#														#														#
# addformants.praat												#											#
# fonctionnement de ce script											#														#
#														#
# 														#
# 														#
# 														# 														#												#
#														#														#
#################################################################################################################

# le dossier où se trouve vos fichiers 			(à changer!) 
chemin$ = "D:\Teaching\2018-2019\Semestre 1\Phonetique M1\TD\"

# nom du fichier son qu'on traite sans .wav  		(à changer!) 
initiales$ = "nom_du_fichier"


# créer un objet de type tableau ("Table") où on va extraire les valeurs que Praat obtient. 
# Il y aura trois columnes : participant, voyelle, duree 
tableau = Create Table with column names: "monTableau", 0,
	... "participant voyelle duree"


# chercher le fichier son et lui donner un nom
son = Read from file: chemin$ + initiales$ + ".wav"
tg = Read from file: chemin$ + initiales$ + ".TextGrid"

# Praat trouve tous les intervalles qui contiennent une étiquette et cherche le début, 
# la fin et la durée de chacun.

selectObject: tg
# On cherche combien d'intervalles il y en a dans la tire 'voyelle'. 
numberOfIntervals = Get number of intervals: 1
	for intervalle to numberOfIntervals
		selectObject: tg
		etiquette$ = Get label of interval: 1, intervalle
			# si l'intervalle a une étiquette, on cherche le début et la fin
			if etiquette$ <> ""
			debut = Get start time of interval: 1, intervalle
			fin = Get end time of interval: 1, intervalle
			# on trouve la duree de l'intervalle
			duree = fin - debut
			

			# ajoutez les commandes pour trouver les formants ici 
			

			# On selectionne l'objet tableau 
			selectObject(tableau)
  			Append row
  			current_row = Get number of rows
		
  			# On y insère les valeurs
  			Set string value:  current_row, "participant", initiales$
 			Set string value: current_row, "voyelle", etiquette$
			Set numeric value: current_row, "duree", duree
			endif
	
	endfor

# On enlève les objets dans la liste d'objets
removeObject: son, tg


# Praat sauvegarde le tableau dans notre dossier de départ. Vous pouvez changer le nom du fichier. 
selectObject: tableau
Save as tab-separated file: chemin$ + "donnees_" + initiales$ + ".txt"