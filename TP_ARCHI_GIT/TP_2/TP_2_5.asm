					org 	$4
Vector_001 			dc.l 	Main
					org 	$500
Main 				movea.l #STRING,a0 		; Initialise A0 avec l'adresse de la chaîne.
SpaceCount 				
					clr.l 	d0				; ... ; Programme SpaceCount à développer.
											; 20 = Space, #' '
loop										; ... ; En sortie du programme, D0.L doit contenir
					move.b 	(a0)+,d1			; ... ; le nombre d'espaces de la chaîne.
					
					beq 	quit
					
					cmp.l 	#' ',d1
					bne 	loop
					
					addq.l	#1,d0
					bra 	loop
			
quit				illegal
					org 	$550
STRING 				dc.b 	"Cette chaine comporte 4 espaces.",0



