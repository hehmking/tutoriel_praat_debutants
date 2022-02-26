#################################################################################
# chargeur.praat 								#
# 										#
# 										#
#################################################################################

chemin$ = ""

# créer un tableau où on va extraire les valeurs que Praat obtient. 
tableau = Create Table with column names: "formants", 0, "fichier sexe etiquette duree milieu F1 F2 F3"


liste_fichiers = Create Strings as file list: "list", chemin$ + "*.wav"
nombreDeFichiers = Get number of strings

for ifichier from 1 to nombreDeFichiers
	selectObject: liste_fichiers
	nomDuFichier$ = Get string: ifichier
	son = Read from file: chemin$ + nomDuFichier$




endfor










### commandes pour plus tard ! 

#selectObject(tableau)
#Append row
#current_row = Get number of rows
		
# On y insère les valeurs
#Set string value: current_row, "fichier", nomDuFichier$ - ".wav"
#Set string value: current_row, "sexe", speaker_sex$
#Set string value: current_row, "etiquette", etiquette$
#Set numeric value: current_row, "duree", duree
#Set numeric value: current_row, "milieu", milieu
#Set numeric value: current_row, "F1", f1
#Set numeric value: current_row, "F2", f2
#Set numeric value: current_row, "F3", f3

#Save as tab-separated file: chemin$ + "données_formants.txt"