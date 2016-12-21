;; check if prime program
;; R0 = A, R1 = prime flage (1 if prime), R2 = B
;;R3 is B*B
;;R4 is modulo result


.CODE ;; code segment
.ADDR x0000 ;; start filling code at address x0000

CMPI R0, #1 		; A - 1
BRP	INIT		;check if A is positive

CONST R1, #0 	;set prime flag to 0
BRnzp END 		;Jump to end

INIT
	CONST R2, #2 	; set r2 to 2
	CONST R1, #1	;set r1 to 1


Loop
	MUL R3, R2, R2	;set R3 equal to B*B
	CMP R3, R0 		;Compare B*B and A
	BRp End		;if negative go to end

	MOD R4, R0, R2		;Modulo A by B*B
	BRnp Add1		;if negative or positive proceed to next part
	CONST R1, #0	;Set prime flag to 0
	BRnzp END		; get to end somehow

Add1
	ADD R2, R2, #1		;B+1
	JMP Loop			;Restart loop

END				;End program
