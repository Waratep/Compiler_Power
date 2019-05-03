	push	sp
	push	12
	add
	pop	sp
	push	6
	push	0
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	3
	push	1
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	2
	push	2
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	1
	push	3
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	1
	push	4
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	2
	push	5
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	3
	push	6
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	6
	push	7
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	neg
	push	0
	pop	sb[8]
	push	sb[8]
	neg
	push	7
	pop	sb[9]
	push	sb[9]
	neg
	push	0
	pop	sb[10]
	push	sb[10]
	neg
	push	4
	pop	sb[11]
	push	sb[11]
	neg
L000:
	push	sb[8]
	push	sb[9]
	compLT
	j0	L001
	push	sb[8]
	push	0
	add
	pop	in
	push	sb[in]
	push	sb[9]
	push	0
	add
	pop	in
	push	sb[in]
	compEQ
	j0	L002
	push	sb[10]
	push	1
	add
	pop	sb[10]
	push	sb[10]
	neg
	jmp	L003
L002:
	push	sb[10]
	push	1
	sub
	pop	sb[10]
	push	sb[10]
	neg
L003:
	push	sb[8]
	push	1
	add
	pop	sb[8]
	push	sb[8]
	neg
	push	sb[9]
	push	1
	sub
	pop	sb[9]
	push	sb[9]
	neg
	jmp	L000
L001:
	push	sb[10]
	push	sb[11]
	compEQ
	j0	L004
	push	"Yes Palindom"
	puts
	jmp	L005
L004:
	push	"No Palindom"
	puts
L005:
	jmp	L999
L998:
	push	999999
	puti
L999:
