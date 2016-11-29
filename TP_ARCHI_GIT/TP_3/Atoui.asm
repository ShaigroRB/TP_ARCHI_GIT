; Initialisation des vecteurs
				
				org 	$4
				
vector_01		dc.l	Main

; Programme principal

				org 	$500
				
Main			lea 	sTest,a0
				jsr 	Atoui
				
				illegal
				
; Sous-Programmes

Atoui			movem.l	d1/a0,-(a7)
				clr.l	d1
				clr.l	d0
				
\loop       	move.b	(a0)+,d1
				beq		\quit
				subi.b	#'0',d1
				mulu.w	#10,d0
				add.l	d1,d0
				bra  	\loop
				
				
\quit       	movem.l	(a7)+,d1/a0
				rts

; Donnees

sTest			dc.b	"42",0
