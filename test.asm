	push	sp
	push	2
	add
	pop	sp
	push	30
	pop	sb[0]
	push	sb[0]
	neg
	push	10
	pop	sb[1]
	push	sb[1]
	neg
	push	sb[0]
	puti
	push	sb[0]
	puth
	push	sb[1]
	puti
	push	sb[1]
	puth
	jmp	L999
L998:
	push	999999
	puti
L999:
