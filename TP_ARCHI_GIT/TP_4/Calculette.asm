; Initialisation des vecteurs
				
				org 	$4
				
vector_01		dc.l	Main

; Programme principal

				org 	$500
				
Main			lea		sTest,a0
				move.b	#24,d1
				move.b 	#20,d2
				jsr 	IsCharError
				
				illegal
				
; Sous-Programmes

RmSpace 		movem.l	a0/a1/d0,-(a7)
				movea.l a0,a1
				
\loop 			move.b 	(a0)+,d0
				beq		\quit
				
				cmp.b 	#' ',d0
				beq		\incA  ; incremente seulement a0
				move.b	d0,(a1)+
				
\incA 			jmp 	\loop
				
\quit 			move.b 	#0,(a1)
				movem.l (a7)+,a0/a1/d0
				rts


IsCharError		movem.l a0/d0,-(a7)
				
\loop			move.b	(a0)+,d0
				beq 	\quit
				
				cmp.b	#'0',d0
				blo	\true
				
				cmp.b 	#'9',d0
				bhi 	\true
				jmp 	\loop
				
\true			ori.b	#%00000100,ccr ; Mets le flag Z  = 1
				jmp		\quit

\false			andi.b 	#%11111011,ccr 	; Mets le flag Z = 0
				jmp		\quit
				
\quit			movem.l	(a7)+,a0/d0
				rts

; Donnees
sTest 			dc.b	"1654654",0
