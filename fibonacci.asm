;; program to store the first 20 numbers of the fibonacci sequence in the data memory
;;R0 stores the address of the data memory to start from
;;R1 is F_(i-2)
;;R2 is F_(i-1)
;;R3 is F_i
;; R4 is i

.DATA
.ADDR x4000

fibonacci_numbers	;labels x4000 as fibonacci_numbers
	.fill #0		;stores 1 in x4000
	.fill #1		;stores 1 in x4001
	
.CODE			;indicates code
.ADDR x0000		;starts code at address x0000

INIT 
	LEA R0, fibonacci_numbers	;sets R0 to x4000
	LDR R1, R0,	#0				;sets R1 to 0 
	LDR R2, R0, #1				;sets R2 to 1
	CONST R4, #2				;sets i to 2
	
Loop
	CMPI R4, #20		;compares i to 20
	BRzp END			;if i is greater than 20 break
	ADD R3, R2, R1		;F_i = F_(i-2) + F_(i-1)
	STR R3, R0, #2		;stores F_i in the the next data location
	LDR R1, R0, #1		;sets F_i-2 to F_i-1 
	LDR R2, R0, #2		;Sets F_i-1 to F_i
	ADD R0, R0, #1		;increases R0 by 1
	ADD R4, R4, #1		; i = i + 1
	BRnzp Loop			;restarts the loop
	
END						;end program