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
				beq 	\false
				
				cmp.b	#'0',d0
				blo	\true
				
				cmp.b 	#'9',d0
				bhi 	\true
				jmp 	\loop
				
\true			ori.b	#%00000100,ccr ; Mets le flag Z  = 1
				jmp		\quit

\false			andi.b 	#%11111011,ccr 	; Mets le flag Z = 0
				
\quit			movem.l	(a7)+,a0/d0
				rts


Convert			movem.l	a0/d0,-(a7)
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
sTest 			dc.b	"1321c54",0
