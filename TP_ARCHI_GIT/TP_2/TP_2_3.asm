				org 	$4
Vector_001 		dc.l 	Main
				org 	$500
Main 			move.l 	#10,d0

Abs 			tst.l 	d0
				bpl 	exit ; = goto exit
				neg.l 	d0
				
exit 			illegal				
				
