;; Square root subroutine
;; R0 = A
;; R1 = B
;; R2 = B*B
;; Additional code calls subroutine to find the value of a numbers square root multiplied by 2
;;If aquare root returns -1 it does not multiply
;; R3 = 2 the constant to multiply by
;; R4 = 2*B

.CODE			;indicates a code
.ADDR x0000		;Starts writing the code at address x0000

CONST R3, #2	;set R3 = to 2
JSR SUB_SQRT	;run sub routine
CMPI R1, #0		;Compares the square root to 0
BRN	END			;If the square root is negative it ends the program
MUL R4, R3, R1	;Multiply B and 2
BRNZP	END		;Bring to end	

.FALIGN 				;Padding
SUB_SQRT				;Label	
						;parameter R0
						;Return value R1
	CMPI R0, #0 		;compares A to 0
	BRN NEXT_STEP  		;If A is negative skips the while loop and returns B-1
	
	
	
	Loop
		MUL R2, R1, R1		;Multiplies B by itself
		CMP R2, R0			;compares B*B to A
		BRP NEXT_STEP		;if B*B > A go to NEXT_STEP
		ADD R1, R1, #1		;B = B + 1
		BRNZP Loop
	
	NEXT_STEP
	ADD R1, R1, #-1 	;Subtracts 1 from B
	RET					;Returns, jumps to address at R7

END