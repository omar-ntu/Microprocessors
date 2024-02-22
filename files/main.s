	AREA the_data, CODE, READONLY
	ENTRY
	ADR	R0, TABLE	; load register with TABLE
	MOV	R1, #30		; number of elements in TABLE
	MOV	R3, #0		; summing numbers
loop	LDRH	R4, [R0], #2	; load register halfword into R4 and post-increment R0 by 2
	ADD	R3, R3, R4	; into R3, add R3 and R4
	SUBS	R1, R1, #1	; decrement count of R1 by 1
	BNE	loop		; loop again if not complete
	MOV	R4, #0xFFFFFF39	; into R4, load -199 (0xFFFFFF39)
	SMULL	R2, R5, R3, R4	; multiply R3 by R4. low result in R2, high in R5. we are only taking R2
TABLE	DCW	10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68
stop	B	stop		; stop loop
	END
